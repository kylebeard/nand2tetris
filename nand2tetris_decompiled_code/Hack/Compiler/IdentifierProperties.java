// 
// Decompiled by Procyon v0.5.36
// 

package Hack.Compiler;

public class IdentifierProperties
{
    private String type;
    private short index;
    
    public IdentifierProperties(final String type, final short index) {
        this.type = type;
        this.index = index;
    }
    
    public String getType() {
        return this.type;
    }
    
    public short getIndex() {
        return this.index;
    }
}
