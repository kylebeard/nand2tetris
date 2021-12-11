// 
// Decompiled by Procyon v0.5.36
// 

package Hack.Compiler;

import java.util.HashMap;

public class SymbolTable
{
    public static final int KIND_STATIC = 0;
    public static final int KIND_FIELD = 1;
    public static final int KIND_PARAMETER = 2;
    public static final int KIND_LOCAL = 3;
    public static final int SUBROUTINE_TYPE_UNDEFINED = 0;
    public static final int SUBROUTINE_TYPE_METHOD = 1;
    public static final int SUBROUTINE_TYPE_FUNCTION = 2;
    public static final int SUBROUTINE_TYPE_CONSTRUCTOR = 3;
    private static short staticsNumbering;
    private static short fieldsNumbering;
    private static short parametersNumbering;
    private static short localsNumbering;
    private String className;
    private String subroutineName;
    private int subroutineType;
    private String returnType;
    private HashMap fields;
    private HashMap parameters;
    private HashMap locals;
    private HashMap statics;
    
    public SymbolTable(final String className) {
        this.className = className;
        this.fields = new HashMap();
        this.statics = new HashMap();
        this.parameters = new HashMap();
        this.locals = new HashMap();
        SymbolTable.fieldsNumbering = 0;
        SymbolTable.staticsNumbering = 0;
        SymbolTable.localsNumbering = 0;
        SymbolTable.parametersNumbering = 1;
        this.subroutineType = 0;
    }
    
    public void startMethod(final String s, final String s2) {
        this.startSubroutine(s, 1, s2, (short)1);
    }
    
    public void startFunction(final String s, final String s2) {
        this.startSubroutine(s, 2, s2, (short)0);
    }
    
    public void startConstructor(final String s) {
        this.startSubroutine(s, 3, this.className, (short)0);
    }
    
    public void endSubroutine() {
        this.parameters.clear();
        this.locals.clear();
        SymbolTable.localsNumbering = 0;
        SymbolTable.parametersNumbering = 1;
        this.subroutineType = 0;
        this.subroutineName = null;
        this.returnType = null;
    }
    
    private void startSubroutine(final String subroutineName, final int subroutineType, final String returnType, final short parametersNumbering) {
        this.endSubroutine();
        this.subroutineName = subroutineName;
        this.subroutineType = subroutineType;
        this.returnType = returnType;
        SymbolTable.parametersNumbering = parametersNumbering;
    }
    
    public void define(final String s, final String s2, final int n) {
        switch (n) {
            case 0: {
                this.statics.put(s, new IdentifierProperties(s2, SymbolTable.staticsNumbering));
                ++SymbolTable.staticsNumbering;
                break;
            }
            case 1: {
                this.fields.put(s, new IdentifierProperties(s2, SymbolTable.fieldsNumbering));
                ++SymbolTable.fieldsNumbering;
                break;
            }
            case 2: {
                this.parameters.put(s, new IdentifierProperties(s2, SymbolTable.parametersNumbering));
                ++SymbolTable.parametersNumbering;
                break;
            }
            case 3: {
                this.locals.put(s, new IdentifierProperties(s2, SymbolTable.localsNumbering));
                ++SymbolTable.localsNumbering;
                break;
            }
        }
    }
    
    public int getKindOf(final String s) throws JackException {
        int n;
        if (this.parameters.containsKey(s)) {
            n = 2;
        }
        else if (this.locals.containsKey(s)) {
            n = 3;
        }
        else if (this.subroutineType != 2 && this.fields.containsKey(s)) {
            n = 1;
        }
        else {
            if (!this.statics.containsKey(s)) {
                throw new JackException(s);
            }
            n = 0;
        }
        return n;
    }
    
    public String getTypeOf(final String s) throws JackException {
        return this.getIdentifierProperties(s).getType();
    }
    
    public short getIndexOf(final String s) throws JackException {
        return this.getIdentifierProperties(s).getIndex();
    }
    
    public short getNumberOfIdentifiers(final int n) {
        short n2 = -1;
        switch (n) {
            case 0: {
                n2 = SymbolTable.staticsNumbering;
                break;
            }
            case 1: {
                n2 = SymbolTable.fieldsNumbering;
                break;
            }
            case 2: {
                n2 = (short)(SymbolTable.parametersNumbering - 1);
                break;
            }
            case 3: {
                n2 = SymbolTable.localsNumbering;
                break;
            }
        }
        return n2;
    }
    
    public String getClassName() {
        return this.className;
    }
    
    public String getSubroutineName() {
        return this.subroutineName;
    }
    
    public String getReturnType() {
        return this.returnType;
    }
    
    private IdentifierProperties getIdentifierProperties(final String s) throws JackException {
        IdentifierProperties identifierProperties = null;
        switch (this.getKindOf(s)) {
            case 2: {
                identifierProperties = this.parameters.get(s);
                break;
            }
            case 3: {
                identifierProperties = this.locals.get(s);
                break;
            }
            case 1: {
                identifierProperties = this.fields.get(s);
                break;
            }
            case 0: {
                identifierProperties = this.statics.get(s);
                break;
            }
        }
        return identifierProperties;
    }
}
