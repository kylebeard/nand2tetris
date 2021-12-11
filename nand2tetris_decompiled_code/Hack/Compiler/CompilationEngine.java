// 
// Decompiled by Procyon v0.5.36
// 

package Hack.Compiler;

import java.util.Iterator;
import java.util.Vector;
import java.util.HashSet;
import java.util.HashMap;

public class CompilationEngine
{
    private static final int GENERAL_TYPE = 1;
    private static final int NUMERIC_TYPE = 2;
    private static final int INT_TYPE = 3;
    private static final int CHAR_TYPE = 4;
    private static final int BOOLEAN_TYPE = 5;
    private static final int STRING_TYPE = 6;
    private static final int THIS_TYPE = 7;
    private static final int NULL_TYPE = 8;
    private JackTokenizer input;
    private VMWriter output;
    private SymbolTable identifiers;
    private HashMap subroutines;
    private HashSet classes;
    private Vector subroutineCalls;
    private int ifCounter;
    private int whileCounter;
    private int subroutineType;
    private int[] expTypes;
    private int expIndex;
    private String fileName;
    private boolean validJack;
    
    CompilationEngine() {
        this.classes = new HashSet();
        this.subroutines = new HashMap();
        this.subroutineCalls = new Vector();
    }
    
    public boolean compileClass(final JackTokenizer input, final VMWriter output, final String anObject, final String fileName) {
        this.input = input;
        this.output = output;
        this.fileName = fileName;
        this.expTypes = new int[100];
        this.expIndex = -1;
        this.validJack = true;
        input.advance();
        String identifier = null;
        try {
            if (this.isKeywordClass()) {
                input.advance();
            }
            else {
                this.recoverableError("Expected 'class'", -1, "", fileName);
            }
            if (this.isIdentifier()) {
                identifier = input.getIdentifier();
                if (!identifier.equals(anObject)) {
                    this.recoverableError("The class name doesn't match the file name", -1, "", fileName);
                }
                input.advance();
            }
            else {
                this.recoverableError("Expected a class name", -1, "", fileName);
                identifier = anObject;
            }
            this.identifiers = new SymbolTable(identifier);
            if (this.isSymbol('{')) {
                input.advance();
            }
            else {
                this.recoverableError("Expected {", -1, "", fileName);
            }
            this.compileFieldAndStaticDeclarations();
            this.compileAllSubroutines();
            if (!this.isSymbol('}')) {
                this.recoverableError("Expected }", -1, "", fileName);
            }
            if (input.hasMoreTokens()) {
                this.recoverableError("Expected end-of-file", -1, "", fileName);
            }
        }
        catch (JackException ex) {}
        finally {
            output.close();
            if (this.validJack) {
                this.classes.add(identifier);
            }
            return this.validJack;
        }
    }
    
    boolean verifySubroutineCalls() {
        this.validJack = true;
        for (final Object[] array : this.subroutineCalls) {
            final String s = (String)array[0];
            final boolean booleanValue = (boolean)array[1];
            final short shortValue = (short)array[2];
            final String s2 = (String)array[3];
            final String s3 = (String)array[4];
            final int intValue = (int)array[5];
            if (!this.classes.contains(s.substring(0, s.indexOf(".")))) {
                continue;
            }
            if (!this.subroutines.containsKey(s)) {
                this.recoverableError((booleanValue ? "Method " : "Function or constructor ") + s + " doesn't exist", intValue, s3, s2);
            }
            else {
                final Object[] array2 = this.subroutines.get(s);
                final int intValue2 = (int)array2[0];
                final short shortValue2 = (short)array2[1];
                if (booleanValue && intValue2 != 1) {
                    this.recoverableError(((intValue2 == 2) ? "Function " : "Constructor ") + s + " called as a method", intValue, s3, s2);
                }
                else if (!booleanValue && intValue2 == 1) {
                    this.recoverableError("Method " + s + " called as a function/constructor", intValue, s3, s2);
                }
                if (shortValue == shortValue2) {
                    continue;
                }
                this.recoverableError("Subroutine " + s + " (declared to accept " + shortValue2 + " parameter(s)) called with " + shortValue + " parameter(s)", intValue, s3, s2);
            }
        }
        return this.validJack;
    }
    
    private void compileAllSubroutines() throws JackException {
        while (true) {
            if (!this.isKeywordMethod() && !this.isKeywordFunction()) {
                if (!this.isKeywordConstructor()) {
                    break;
                }
            }
            try {
                if (this.isKeywordMethod()) {
                    this.compileMethod();
                }
                else if (this.isKeywordFunction()) {
                    this.compileFunction();
                }
                else {
                    this.compileConstructor();
                }
            }
            catch (JackException ex) {
                while (!this.isKeywordMethod() && !this.isKeywordFunction() && !this.isKeywordConstructor() && this.input.hasMoreTokens()) {
                    this.input.advance();
                }
            }
        }
    }
    
    private void compileMethod() throws JackException {
        final SymbolTable identifiers = this.identifiers;
        this.compileSubroutine(1);
    }
    
    private void compileFunction() throws JackException {
        final SymbolTable identifiers = this.identifiers;
        this.compileSubroutine(2);
    }
    
    private void compileConstructor() throws JackException {
        final SymbolTable identifiers = this.identifiers;
        this.compileSubroutine(3);
    }
    
    private void compileSubroutine(final int n) throws JackException {
        this.subroutineType = n;
        this.ifCounter = 0;
        this.whileCounter = 0;
        this.input.advance();
        String type;
        if (this.isKeywordVoid()) {
            type = "void";
        }
        else {
            type = this.getType();
        }
        final int lineNumber = this.input.getLineNumber();
        this.input.advance();
        String identifier = null;
        String s;
        if (this.isIdentifier()) {
            identifier = this.input.getIdentifier();
            s = this.identifiers.getClassName() + "." + identifier;
            if (this.subroutines.containsKey(s)) {
                this.recoverableError("Subroutine " + identifier + " redeclared", -1, "", this.fileName);
            }
            this.input.advance();
        }
        else {
            this.recoverableError("Expected a type followed by a subroutine name", -1, "", this.fileName);
            s = this.identifiers.getClassName() + "." + "unknownname";
        }
        switch (n) {
            case 1: {
                this.identifiers.startMethod(identifier, type);
                break;
            }
            case 2: {
                this.identifiers.startFunction(identifier, type);
                break;
            }
            case 3: {
                this.identifiers.startConstructor(identifier);
                if (!type.equals(this.identifiers.getClassName())) {
                    this.recoverableError("The return type of a constructor must be of the class type", lineNumber);
                    break;
                }
                break;
            }
        }
        if (this.isSymbol('(')) {
            this.input.advance();
        }
        else {
            this.recoverableError("Expected (");
        }
        final short compileParametersList = this.compileParametersList();
        this.input.advance();
        this.compileSubroutineBody(s);
        this.identifiers.endSubroutine();
        if (identifier != null) {
            this.subroutines.put(s, new Object[] { new Integer(n), new Short(compileParametersList) });
        }
    }
    
    private void compileSubroutineBody(final String s) throws JackException {
        if (this.isSymbol('{')) {
            this.input.advance();
        }
        else {
            this.recoverableError("Expected {");
        }
        this.compileLocalsDeclarations();
        final SymbolTable identifiers = this.identifiers;
        final SymbolTable identifiers2 = this.identifiers;
        this.output.function(s, identifiers.getNumberOfIdentifiers(3));
        final int subroutineType = this.subroutineType;
        final SymbolTable identifiers3 = this.identifiers;
        if (subroutineType == 1) {
            this.output.push("argument", (short)0);
            this.output.pop("pointer", (short)0);
        }
        else {
            final int subroutineType2 = this.subroutineType;
            final SymbolTable identifiers4 = this.identifiers;
            if (subroutineType2 == 3) {
                final SymbolTable identifiers5 = this.identifiers;
                final SymbolTable identifiers6 = this.identifiers;
                this.output.push("constant", identifiers5.getNumberOfIdentifiers(1));
                this.output.callFunction("Memory.alloc", (short)1);
                this.output.pop("pointer", (short)0);
            }
        }
        if (this.compileStatements(true)) {
            this.recoverableError("Program flow may reach end of subroutine without 'return'");
        }
        this.input.advance();
    }
    
    private short compileParametersList() throws JackException {
        short n = 0;
        if (this.isSymbol(')')) {
            return n;
        }
        int i = 1;
        while (i != 0) {
            ++n;
            final String type = this.getType();
            this.input.advance();
            String identifier = null;
            if (this.isIdentifier()) {
                identifier = this.input.getIdentifier();
                this.input.advance();
            }
            else {
                this.recoverableError("Expected a type followed by a variable name");
            }
            final SymbolTable identifiers = this.identifiers;
            final String s = identifier;
            final String s2 = type;
            final SymbolTable identifiers2 = this.identifiers;
            identifiers.define(s, s2, 2);
            if (this.isSymbol(')')) {
                i = 0;
            }
            else if (this.isSymbol(',')) {
                this.input.advance();
            }
            else {
                this.terminalError("Expected ) or , in parameters list");
            }
        }
        return n;
    }
    
    private void compileFieldAndStaticDeclarations() throws JackException {
        int i = 1;
        while (i != 0) {
            if (this.isKeywordField()) {
                final SymbolTable identifiers = this.identifiers;
                this.compileDeclarationLine(1);
            }
            else if (this.isKeywordStatic()) {
                final SymbolTable identifiers2 = this.identifiers;
                this.compileDeclarationLine(0);
            }
            else {
                i = 0;
            }
        }
    }
    
    private void compileLocalsDeclarations() throws JackException {
        while (this.isKeywordLocal()) {
            final SymbolTable identifiers = this.identifiers;
            this.compileDeclarationLine(3);
        }
    }
    
    private void compileDeclarationLine(final int n) throws JackException {
        this.input.advance();
        final String type = this.getType();
        int i = 1;
        while (i != 0) {
            this.input.advance();
            if (this.isIdentifier()) {
                this.identifiers.define(this.input.getIdentifier(), type, n);
                this.input.advance();
            }
            else {
                this.recoverableError("Expected a type followed by comma-seperated variable names");
            }
            if (this.isSymbol(';')) {
                this.input.advance();
                i = 0;
            }
            else {
                if (this.isSymbol(',')) {
                    continue;
                }
                this.terminalError("Expected , or ;");
            }
        }
    }
    
    private void skipToEndOfStatement() {
        while (!this.isSymbol(';') && !this.isSymbol('}') && this.input.hasMoreTokens()) {
            this.input.advance();
        }
        if (this.isSymbol(';') && this.input.hasMoreTokens()) {
            this.input.advance();
        }
    }
    
    private boolean compileStatements(boolean b) throws JackException {
        int n = b ? 0 : 1;
        while (!this.isSymbol('}')) {
            if (!b && n == 0) {
                this.warning("Unreachable code");
                n = 1;
            }
            if (this.isKeywordDo()) {
                try {
                    this.compileDo();
                }
                catch (JackException ex) {
                    this.skipToEndOfStatement();
                }
            }
            else if (this.isKeywordLet()) {
                try {
                    this.compileLet();
                }
                catch (JackException ex2) {
                    this.skipToEndOfStatement();
                }
            }
            else if (this.isKeywordWhile()) {
                b = this.compileWhile(b);
            }
            else if (this.isKeywordReturn()) {
                try {
                    this.compileReturn();
                }
                catch (JackException ex3) {
                    this.skipToEndOfStatement();
                }
                b = false;
            }
            else if (this.isKeywordIf()) {
                b = this.compileIf(b);
            }
            else if (this.isSymbol(';')) {
                this.recoverableError("An empty statement is not allowed");
                this.input.advance();
            }
            else {
                final String s = "Expected statement(do, let, while, return or if)";
                if (this.isIdentifier()) {
                    this.recoverableError(s);
                    this.skipToEndOfStatement();
                }
                else {
                    this.terminalError(s);
                }
            }
        }
        return b;
    }
    
    private void compileDo() throws JackException {
        this.input.advance();
        this.compileSubroutineCall();
        this.output.pop("temp", (short)0);
        if (this.isSymbol(';')) {
            this.input.advance();
        }
        else {
            this.recoverableError("Expected ;");
        }
    }
    
    private void compileSubroutineCall() throws JackException {
        if (!this.isIdentifier()) {
            this.terminalError("Expected class name, subroutine name, field, parameter or local or static variable name");
        }
        final String identifier = this.input.getIdentifier();
        final int lineNumber = this.input.getLineNumber();
        this.input.advance();
        if (this.isSymbol('.')) {
            this.compileExternalSubroutineCall(identifier);
        }
        else {
            this.compileInternalSubroutineCall(identifier, lineNumber);
        }
    }
    
    private void compileExternalSubroutineCall(final String s) throws JackException {
        String string = null;
        short value = 1;
        this.input.advance();
        final int lineNumber = this.input.getLineNumber();
        String type;
        try {
            type = this.identifiers.getTypeOf(s);
            this.pushVariable(this.identifiers.getKindOf(s), this.identifiers.getIndexOf(s));
        }
        catch (JackException ex) {
            type = s;
            value = 0;
        }
        if (this.isIdentifier()) {
            string = type + "." + this.input.getIdentifier();
            this.input.advance();
        }
        else {
            this.terminalError("Expected subroutine name");
        }
        final short compileExpressionList = this.compileExpressionList();
        this.output.callFunction(string, (short)(compileExpressionList + value));
        this.subroutineCalls.addElement(new Object[] { string, new Boolean((boolean)(value != 0)), new Short(compileExpressionList), this.fileName, this.identifiers.getSubroutineName(), new Integer(lineNumber) });
    }
    
    private void compileInternalSubroutineCall(final String str, final int value) throws JackException {
        final String string = this.identifiers.getClassName() + "." + str;
        this.output.push("pointer", (short)0);
        final short compileExpressionList = this.compileExpressionList();
        this.output.callFunction(string, (short)(compileExpressionList + 1));
        if (this.subroutineType == 2) {
            this.recoverableError("Subroutine " + string + " called as a method from within a function", value);
        }
        else {
            this.subroutineCalls.addElement(new Object[] { string, Boolean.TRUE, new Short(compileExpressionList), this.fileName, this.identifiers.getSubroutineName(), new Integer(value) });
        }
    }
    
    private void skipFromParensToBlockStart() {
        while (!this.isSymbol(';') && !this.isSymbol('}') && !this.isSymbol('{') && this.input.hasMoreTokens()) {
            this.input.advance();
        }
    }
    
    private boolean compileWhile(final boolean b) throws JackException {
        final int whileCounter = this.whileCounter;
        ++this.whileCounter;
        this.input.advance();
        if (this.isSymbol('(')) {
            this.input.advance();
        }
        else {
            this.recoverableError("Expected (");
        }
        try {
            this.output.label("WHILE_EXP" + whileCounter);
            this.compileNewExpression(1);
            this.output.not();
            if (this.isSymbol(')')) {
                this.input.advance();
            }
            else {
                this.recoverableError("Expected )");
            }
        }
        catch (JackException ex) {
            this.skipFromParensToBlockStart();
            if (!this.isSymbol('{')) {
                throw ex;
            }
        }
        if (this.isSymbol('{')) {
            this.input.advance();
        }
        else {
            this.recoverableError("Expected {");
        }
        this.output.ifGoTo("WHILE_END" + whileCounter);
        final boolean compileStatements = this.compileStatements(b);
        if (this.isSymbol('}')) {
            this.input.advance();
        }
        else {
            this.recoverableError("Expected }");
        }
        this.output.goTo("WHILE_EXP" + whileCounter);
        this.output.label("WHILE_END" + whileCounter);
        return compileStatements;
    }
    
    private boolean compileIf(final boolean b) throws JackException {
        final int ifCounter = this.ifCounter;
        ++this.ifCounter;
        this.input.advance();
        if (this.isSymbol('(')) {
            this.input.advance();
        }
        else {
            this.recoverableError("Expected (");
        }
        try {
            this.compileNewExpression(1);
            if (this.isSymbol(')')) {
                this.input.advance();
            }
            else {
                this.recoverableError("Expected )");
            }
        }
        catch (JackException ex) {
            this.skipFromParensToBlockStart();
            if (!this.isSymbol('{')) {
                throw ex;
            }
        }
        if (this.isSymbol('{')) {
            this.input.advance();
        }
        else {
            this.recoverableError("Expected {");
        }
        this.output.ifGoTo("IF_TRUE" + ifCounter);
        this.output.goTo("IF_FALSE" + ifCounter);
        this.output.label("IF_TRUE" + ifCounter);
        final boolean compileStatements = this.compileStatements(b);
        if (this.isSymbol('}')) {
            this.input.advance();
        }
        else {
            this.recoverableError("Expected }");
        }
        if (this.isKeywordElse()) {
            this.input.advance();
            if (this.isSymbol('{')) {
                this.input.advance();
            }
            else {
                this.recoverableError("Expected {");
            }
            this.output.goTo("IF_END" + ifCounter);
            this.output.label("IF_FALSE" + ifCounter);
            final boolean compileStatements2 = this.compileStatements(b);
            if (this.isSymbol('}')) {
                this.input.advance();
            }
            else {
                this.recoverableError("Expected }");
            }
            this.output.label("IF_END" + ifCounter);
            return compileStatements || compileStatements2;
        }
        this.output.label("IF_FALSE" + ifCounter);
        return true;
    }
    
    private void compileReturn() throws JackException {
        this.input.advance();
        if (this.subroutineType == 3 && !this.isKeywordThis()) {
            this.recoverableError("A constructor must return 'this'");
        }
        if (this.isSymbol(';')) {
            if (!this.identifiers.getReturnType().equals("void")) {
                this.recoverableError("A non-void function must return a value");
            }
            this.output.push("constant", (short)0);
            this.output.returnFromFunction();
            this.input.advance();
        }
        else {
            if (this.identifiers.getReturnType().equals("void")) {
                this.recoverableError("A void function must not return a value");
            }
            this.compileNewExpression(1);
            this.output.returnFromFunction();
            if (this.isSymbol(';')) {
                this.input.advance();
            }
            else {
                this.recoverableError("Expected ;");
            }
        }
    }
    
    private void compileLet() throws JackException {
        this.input.advance();
        if (!this.isIdentifier()) {
            this.terminalError("Expected field, parameter or local or static variable name");
        }
        final String identifier = this.input.getIdentifier();
        int kind;
        short index;
        String type;
        try {
            kind = this.identifiers.getKindOf(identifier);
            index = this.identifiers.getIndexOf(identifier);
            type = this.identifiers.getTypeOf(identifier);
        }
        catch (JackException ex) {
            this.recoverableError(identifier + " is not defined as a field, parameter or local or static variable");
            final SymbolTable identifiers = this.identifiers;
            kind = 0;
            index = 0;
            type = "int";
        }
        this.input.advance();
        if (this.isSymbol('=')) {
            this.input.advance();
            final int compileNewExpression = this.compileNewExpression(1);
            this.popVariable(kind, index);
            if (compileNewExpression != 1) {
                if (type.equals("int") && compileNewExpression != 3 && compileNewExpression != 2) {
                    this.recoverableError("an int value is expected", this.input.getLineNumber() - 1);
                }
                else if (type.equals("char") && compileNewExpression != 4 && compileNewExpression != 2) {
                    this.recoverableError("a char value is expected", this.input.getLineNumber() - 1);
                }
                else if (type.equals("boolean") && compileNewExpression != 2 && compileNewExpression != 3 && compileNewExpression != 5) {
                    this.recoverableError("a boolean value is expected", this.input.getLineNumber() - 1);
                }
            }
        }
        else if (this.isSymbol('[')) {
            this.input.advance();
            this.compileNewExpression(2);
            if (this.isSymbol(']')) {
                this.input.advance();
            }
            else {
                this.terminalError("Expected ]");
            }
            this.pushVariable(kind, index);
            this.output.add();
            if (this.isSymbol('=')) {
                this.input.advance();
            }
            else {
                this.terminalError("Expected =");
            }
            this.compileNewExpression(1);
            this.output.pop("temp", (short)0);
            this.output.pop("pointer", (short)1);
            this.output.push("temp", (short)0);
            this.output.pop("that", (short)0);
        }
        else {
            this.terminalError("Expected [ or =");
        }
        if (this.isSymbol(';')) {
            this.input.advance();
        }
        else {
            this.recoverableError("Expected ;");
        }
    }
    
    private short compileExpressionList() throws JackException {
        if (this.isSymbol('(')) {
            this.input.advance();
        }
        else {
            this.terminalError("Expected (");
        }
        short n = 0;
        if (this.isSymbol(')')) {
            this.input.advance();
        }
        else {
            int i = 1;
            while (i != 0) {
                this.compileNewExpression(1);
                ++n;
                if (this.isSymbol(',')) {
                    this.input.advance();
                }
                else if (this.isSymbol(')')) {
                    i = 0;
                    this.input.advance();
                }
                else {
                    this.terminalError("Expected , or ) in expression list");
                }
            }
        }
        return n;
    }
    
    private int compileNewExpression(final int expType) throws JackException {
        ++this.expIndex;
        this.setExpType(expType);
        this.compileExpression();
        --this.expIndex;
        return this.expTypes[this.expIndex + 1];
    }
    
    private void compileExpression() throws JackException {
        boolean b = false;
        this.compileTerm();
        do {
            final int tokenType = this.input.getTokenType();
            final JackTokenizer input = this.input;
            if (tokenType == 2) {
                final char symbol = this.input.getSymbol();
                b = (symbol == '+' || symbol == '-' || symbol == '*' || symbol == '/' || symbol == '&' || symbol == '|' || symbol == '>' || symbol == '<' || symbol == '=');
                if (!b) {
                    continue;
                }
                this.input.advance();
                this.compileTerm();
                switch (symbol) {
                    default: {
                        continue;
                    }
                    case 43: {
                        this.output.add();
                        continue;
                    }
                    case 45: {
                        this.output.substract();
                        continue;
                    }
                    case 42: {
                        this.output.callFunction("Math.multiply", (short)2);
                        continue;
                    }
                    case 47: {
                        this.output.callFunction("Math.divide", (short)2);
                        continue;
                    }
                    case 38: {
                        this.output.and();
                        continue;
                    }
                    case 124: {
                        this.output.or();
                        continue;
                    }
                    case 62: {
                        this.output.greaterThan();
                        continue;
                    }
                    case 60: {
                        this.output.lessThan();
                        continue;
                    }
                    case 61: {
                        this.output.equal();
                        continue;
                    }
                }
            }
        } while (b);
    }
    
    private void compileTerm() throws JackException {
        switch (this.input.getTokenType()) {
            case 4: {
                this.compileIntConst();
                break;
            }
            case 5: {
                this.compileStringConst();
                break;
            }
            case 1: {
                this.compileKeywordConst();
                break;
            }
            case 3: {
                this.compileIdentifierTerm();
                break;
            }
            default: {
                if (this.isSymbol('-')) {
                    this.input.advance();
                    this.compileTerm();
                    this.output.negate();
                    break;
                }
                if (this.isSymbol('~')) {
                    this.input.advance();
                    this.compileTerm();
                    this.output.not();
                    break;
                }
                if (!this.isSymbol('(')) {
                    this.terminalError("Expected - or ~ or ( in term");
                    break;
                }
                this.input.advance();
                this.compileNewExpression(1);
                if (this.isSymbol(')')) {
                    this.input.advance();
                    break;
                }
                this.terminalError("Expected )");
                break;
            }
        }
    }
    
    private void compileIntConst() throws JackException {
        if (this.input.getIntValue() > 32767) {
            this.recoverableError("Integer constant too big");
        }
        this.output.push("constant", (short)this.input.getIntValue());
        if (this.getExpType() < 2) {
            this.setExpType(2);
        }
        else if (this.getExpType() > 4) {
            this.recoverableError("a numeric value is illegal here");
        }
        this.input.advance();
    }
    
    private void compileStringConst() throws JackException {
        if (this.getExpType() == 1) {
            this.setExpType(6);
        }
        else {
            this.recoverableError("A string constant is illegal here");
        }
        final String stringValue = this.input.getStringValue();
        final short n = (short)stringValue.length();
        this.output.push("constant", n);
        this.output.callFunction("String.new", (short)1);
        for (short index = 0; index < n; ++index) {
            this.output.push("constant", (short)stringValue.charAt(index));
            this.output.callFunction("String.appendChar", (short)2);
        }
        this.input.advance();
    }
    
    private void compileKeywordConst() throws JackException {
        final int keywordType = this.input.getKeywordType();
        switch (keywordType) {
            case 18: {
                this.output.push("constant", (short)0);
                this.output.not();
                break;
            }
            case 19:
            case 20: {
                this.output.push("constant", (short)0);
                break;
            }
            case 21: {
                final int subroutineType = this.subroutineType;
                final SymbolTable identifiers = this.identifiers;
                if (subroutineType == 2) {
                    this.recoverableError("'this' can't be referenced in a function");
                }
                this.output.push("pointer", (short)0);
                break;
            }
            default: {
                this.terminalError("Illegal keyword in term");
                break;
            }
        }
        switch (keywordType) {
            case 18:
            case 19: {
                if (this.getExpType() <= 2) {
                    this.setExpType(5);
                    break;
                }
                this.recoverableError("A boolean value is illegal here");
                break;
            }
            case 20: {
                if (this.getExpType() == 1) {
                    this.setExpType(8);
                    break;
                }
                this.recoverableError("'null' is illegal here");
                break;
            }
            case 21: {
                if (this.getExpType() == 1) {
                    this.setExpType(7);
                    break;
                }
                this.recoverableError("'this' is illegal here");
                break;
            }
        }
        this.input.advance();
    }
    
    private void compileIdentifierTerm() throws JackException {
        if (this.getExpType() == 6) {
            this.recoverableError("Illegal casting into String constant");
        }
        final String identifier = this.input.getIdentifier();
        final int lineNumber = this.input.getLineNumber();
        this.input.advance();
        if (this.isSymbol('[')) {
            this.input.advance();
            this.compileNewExpression(2);
            try {
                this.pushVariable(this.identifiers.getKindOf(identifier), this.identifiers.getIndexOf(identifier));
            }
            catch (JackException ex) {
                this.recoverableError(identifier + " is not defined as a field, parameter or local or static variable", lineNumber);
            }
            this.output.add();
            this.output.pop("pointer", (short)1);
            this.output.push("that", (short)0);
            if (this.isSymbol(']')) {
                this.input.advance();
            }
            else {
                this.terminalError("Expected ]");
            }
        }
        else if (this.isSymbol('(')) {
            this.compileInternalSubroutineCall(identifier, lineNumber);
        }
        else if (this.isSymbol('.')) {
            this.compileExternalSubroutineCall(identifier);
        }
        else {
            try {
                final int kind = this.identifiers.getKindOf(identifier);
                final short index = this.identifiers.getIndexOf(identifier);
                if (this.subroutineType == 2 && kind == 1) {
                    this.recoverableError("A field may not be referenced in a function", lineNumber);
                }
                this.pushVariable(kind, index);
                final String type = this.identifiers.getTypeOf(identifier);
                if (type.equals("int")) {
                    if (this.getExpType() <= 2) {
                        this.setExpType(3);
                    }
                    else if (this.getExpType() > 3) {
                        this.recoverableError("An int value is illegal here", lineNumber);
                    }
                }
                else if (type.equals("char")) {
                    if (this.getExpType() <= 2) {
                        this.setExpType(4);
                    }
                    else if (this.getExpType() > 4 || this.getExpType() == 3) {
                        this.recoverableError("A char value is illegal here", lineNumber);
                    }
                }
                else if (type.equals("boolean")) {
                    if (this.getExpType() <= 2) {
                        this.setExpType(5);
                    }
                    else if (this.getExpType() != 5) {
                        this.recoverableError("A boolean value is illegal here", lineNumber);
                    }
                }
            }
            catch (JackException ex2) {
                this.recoverableError(identifier + " is not defined as a field, parameter or local or static variable", lineNumber);
            }
        }
    }
    
    private int getExpType() {
        return this.expTypes[this.expIndex];
    }
    
    private int setExpType(final int n) {
        return this.expTypes[this.expIndex] = n;
    }
    
    private String getType() throws JackException {
        String identifier = null;
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            switch (this.input.getKeywordType()) {
                case 5: {
                    identifier = "int";
                    break;
                }
                case 6: {
                    identifier = "boolean";
                    break;
                }
                case 7: {
                    identifier = "char";
                    break;
                }
                default: {
                    this.terminalError("Expected primitive type or class name");
                    break;
                }
            }
        }
        else if (this.isIdentifier()) {
            identifier = this.input.getIdentifier();
        }
        else {
            this.terminalError("Expected primitive type or class name");
        }
        return identifier;
    }
    
    private void pushVariable(final int n, final short n2) throws JackException {
        switch (n) {
            case 2: {
                this.output.push("argument", n2);
                break;
            }
            case 3: {
                this.output.push("local", n2);
                break;
            }
            case 1: {
                this.output.push("this", n2);
                break;
            }
            case 0: {
                this.output.push("static", n2);
                break;
            }
            default: {
                this.terminalError("Internal Error: Illegal kind");
                break;
            }
        }
    }
    
    private void popVariable(final int n, final short n2) throws JackException {
        switch (n) {
            case 3: {
                this.output.pop("local", n2);
                break;
            }
            case 2: {
                this.output.pop("argument", n2);
                break;
            }
            case 1: {
                this.output.pop("this", n2);
                break;
            }
            case 0: {
                this.output.pop("static", n2);
                break;
            }
        }
    }
    
    private boolean isKeywordClass() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 1) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordStatic() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 10) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordField() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 11) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordLocal() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 9) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isIdentifier() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        return tokenType == 3;
    }
    
    private boolean isSymbol(final char c) {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        return tokenType == 2 && this.input.getSymbol() == c;
    }
    
    private boolean isKeywordMethod() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 2) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordFunction() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 3) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordConstructor() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 4) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordVoid() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 8) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordDo() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 13) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordLet() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 12) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordWhile() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 16) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordReturn() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 17) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordIf() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 14) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordElse() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 15) {
                return true;
            }
        }
        return false;
    }
    
    private boolean isKeywordThis() {
        final int tokenType = this.input.getTokenType();
        final JackTokenizer input = this.input;
        if (tokenType == 1) {
            final int keywordType = this.input.getKeywordType();
            final JackTokenizer input2 = this.input;
            if (keywordType == 21) {
                return true;
            }
        }
        return false;
    }
    
    private void terminalError(final String s) throws JackException {
        this.terminalError(s, -1, null, null);
    }
    
    private void terminalError(final String s, final int n) throws JackException {
        this.terminalError(s, n, null, null);
    }
    
    private void terminalError(final String s, final int n, final String s2, final String s3) throws JackException {
        this.recoverableError(s, n, s2, s3);
        throw new JackException(this.generateMessage(s, n, s2, s3));
    }
    
    private void warning(final String s) {
        this.warning(s, -1, null, null);
    }
    
    private void warning(final String s, final int n) {
        this.warning(s, n, null, null);
    }
    
    private void warning(final String str, final int n, final String s, final String s2) {
        System.err.println(this.generateMessage("Warning: " + str, n, s, s2));
    }
    
    private void recoverableError(final String s) {
        this.recoverableError(s, -1, null, null);
    }
    
    private void recoverableError(final String s, final int n) {
        this.recoverableError(s, n, null, null);
    }
    
    private void recoverableError(final String s, final int n, final String s2, final String s3) {
        System.err.println(this.generateMessage(s, n, s2, s3));
        this.validJack = false;
    }
    
    private String generateMessage(final String str, int lineNumber, String subroutineName, String fileName) {
        if (fileName == null) {
            fileName = this.fileName;
        }
        if (subroutineName == null) {
            subroutineName = this.identifiers.getSubroutineName();
        }
        if (lineNumber == -1) {
            lineNumber = this.input.getLineNumber();
        }
        return "In " + fileName + " (line " + lineNumber + "): " + ("".equals(subroutineName) ? "" : ("In subroutine" + ((subroutineName == null) ? "" : (" " + subroutineName)) + ": ")) + str;
    }
}
