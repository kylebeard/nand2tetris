// 
// Decompiled by Procyon v0.5.36
// 

package Hack.Compiler;

import java.io.FileNotFoundException;
import java.io.BufferedReader;
import java.io.FilenameFilter;
import Hack.Utilities.HackFileFilter;
import java.io.IOException;
import java.io.Writer;
import java.io.PrintWriter;
import java.io.FileWriter;
import java.io.Reader;
import java.io.FileReader;
import java.io.File;

public class JackCompiler
{
    private CompilationEngine compilationEngine;
    
    public JackCompiler() {
        this.compilationEngine = new CompilationEngine();
    }
    
    public boolean compileFile(final File obj) {
        final String substring = obj.getName().substring(0, obj.getName().indexOf(46));
        final String parent = obj.getParent();
        try {
            final JackTokenizer jackTokenizer = new JackTokenizer((Reader)new FileReader(obj.getPath()));
            final File file = new File(parent + "/" + substring + ".vm");
            if (this.compilationEngine.compileClass(jackTokenizer, new VMWriter(new PrintWriter(new FileWriter(file))), substring, obj.getName())) {
                return true;
            }
            file.delete();
            return false;
        }
        catch (IOException ex) {
            System.err.println("Error reading/writing while compiling " + obj);
            System.exit(-1);
            return false;
        }
    }
    
    public boolean compileDirectory(final String pathname) {
        boolean b = true;
        final File[] listFiles = new File(pathname).listFiles((FilenameFilter)new HackFileFilter(".jack"));
        for (int i = 0; i < listFiles.length; ++i) {
            b &= this.compileFile(listFiles[i]);
        }
        return b;
    }
    
    public boolean verify() {
        return this.compilationEngine.verifySubroutineCalls();
    }
    
    public static void main(final String[] array) {
        if (array.length != 1) {
            try {
                String line;
                while ((line = new BufferedReader(new FileReader(new File("bin/help/compiler.txt"))).readLine()) != null) {
                    System.out.println(line);
                }
                System.out.println("");
            }
            catch (FileNotFoundException ex) {}
            catch (IOException ex2) {}
            System.out.println("Usage: java JackCompiler <Jack-dir or Jack-file-name>");
            System.exit(-1);
        }
        final JackCompiler jackCompiler = new JackCompiler();
        final File file = new File(array[0]);
        if (!file.exists()) {
            System.err.println("Could not find file or directory: " + array[0]);
            System.exit(-1);
        }
        boolean b;
        if (file.isDirectory()) {
            b = jackCompiler.compileDirectory(array[0]);
        }
        else {
            b = jackCompiler.compileFile(file);
        }
        System.exit((b & jackCompiler.verify()) ? 0 : 1);
    }
}
