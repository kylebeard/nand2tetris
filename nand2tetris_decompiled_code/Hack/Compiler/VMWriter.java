// 
// Decompiled by Procyon v0.5.36
// 

package Hack.Compiler;

import java.io.PrintWriter;
import Hack.VirtualMachine.VirtualMachine;

public class VMWriter implements VirtualMachine
{
    private PrintWriter writer;
    
    public VMWriter(final PrintWriter writer) {
        this.writer = writer;
    }
    
    public void close() {
        this.writer.flush();
        this.writer.close();
    }
    
    public void add() {
        this.writer.println("add");
    }
    
    public void substract() {
        this.writer.println("sub");
    }
    
    public void negate() {
        this.writer.println("neg");
    }
    
    public void equal() {
        this.writer.println("eq");
    }
    
    public void greaterThan() {
        this.writer.println("gt");
    }
    
    public void lessThan() {
        this.writer.println("lt");
    }
    
    public void and() {
        this.writer.println("and");
    }
    
    public void or() {
        this.writer.println("or");
    }
    
    public void not() {
        this.writer.println("not");
    }
    
    public void push(final String str, final short i) {
        this.writer.println("push " + str + " " + i);
    }
    
    public void pop(final String str, final short i) {
        this.writer.println("pop " + str + " " + i);
    }
    
    public void label(final String str) {
        this.writer.println("label " + str);
    }
    
    public void goTo(final String str) {
        this.writer.println("goto " + str);
    }
    
    public void ifGoTo(final String str) {
        this.writer.println("if-goto " + str);
    }
    
    public void function(final String str, final short i) {
        this.writer.println("function " + str + " " + i);
    }
    
    public void returnFromFunction() {
        this.writer.println("return");
    }
    
    public void callFunction(final String str, final short i) {
        this.writer.println("call " + str + " " + i);
    }
}
