
import java.io.*;
import java.util.Hashtable;
import java.util.Map;
import java.util.Properties;

import java.lang.Runtime;

public class TestScanner {
    private static Runtime run;

    private String comp, dest, jump = null;
    private String aValue = null; // value of the number in an A-Intruction
    private boolean isAInstruction, isCInstruction = false;

    private String getComp() {
        return comp;
    }

    private String getDest() {
        return dest;
    }

    private String getJump() {
        return jump;
    }

    public enum Num {
        ONE, TWO
    }

    public static void main(String[] args) {
        // String instr = " D = d +1; JGE";
        // String val = instr.trim();
        // String[] splitEquals = instr.split("=");
        // System.out.println(splitEquals[0]);
        // String[] splitSemiColon = splitEquals[1].split(";");
        // System.out.println(splitSemiColon.length);
        // System.out.println(splitSemiColon[0].replaceAll("\\s+", ""));
        // System.out.println(splitSemiColon[1]);

        // Dictionary<Character, String> dict = new Dictionary<Character,String>();
        // dict.put('a', "11111");
        // System.out.println(dict.get('a'));

        // Hashtable<String, String> compA0 = new Hashtable<String, String>();
        // Hashtable<String, String> compA1 = new Hashtable<String, String>();
        // compA0.put("a", "101010");
        // compA0.put("1", "11111");
        // System.out.println(compA0.get("A"));

        // compA0.put("1", "111111");
        // String val = compA0.get("1");
        // System.out.println(val);

        // System.out.println(instruction.indexOf("//"));
        // if(instruction.contains("//")){
        // System.out.print("contains '//'");
        // }else{
        // System.out.print("doesn't contains '//'");
        // }

        // TestScanner ts = new TestScanner();
        // System.out.println(ts.getComp());
        // System.out.println(ts.getDest());
        // System.out.println(ts.getJump());
        // String instruction = "D;JMP";
        // String dest = "null";
        // String comp = "null";
        // String jump = "null";
        // get destination
        // String[] splitEquals = instruction.split("=");
        // dest = splitEquals[0].replaceAll("\\s+", "");
        // get compputation
        // String[] splitSemiColon = splitEquals[1].split(";");
        // comp = splitSemiColon[0].replaceAll("\\s+", "");

        // there may or may not be a jump - if there is parse it
        // if(splitSemiColon.length == 2){
        // jump = splitSemiColon[1].replaceAll("\\s+", "");
        // }

        // System.out.println(dest + ":" + comp + ":" + jump);
        // float f = 4200000000L;
        // for(int i=2146999999; i< f; i+=5000 ){
        // if
        // System.out.println(i);
        // }
        // n =n;
        // Runtime p = Runtime.getRuntime();
        // System.out.println("Free memory: " + p.freeMemory());
        // System.out.println("Max memory: " + p.maxMemory());
        // System.out.println("total memory: " + p.totalMemory());
        // Map<String, String> map;
        // map = System.getenv();
        // System.out.println(map);
        // try{
        // File file = new File(args[0]);
        // String fileName = file.getName().replaceFirst(".asm", "");
        // System.out.println(fileName);
        // System.out.println(file.getPath());

        // } catch (FileNotFoundException fnfe){
        // fnfe.printStackTrace();

        // } catch(IOException ioe) {
        // ioe.printStackTrace();
        // }

        // String path = System.getProperty("java.library.path");
        // System.out.println(path);

        // String s = "0000000";
        // String s2 = "0000000";
        // System.out.println(s != "0000001");
        // Properties props = System.getProperties();

        // for(int i = 0; i < props.size(); i++){
        // props.ke
        // }
        // System.out.println(props.toString());

        // String s = "teststring";
        // s = "teststring2";
        // s += "123";
        // System.out.println(s);
        // int x = true | false;
        // double d = 0.0/0.0;
        // System.out.println(d);
        // System.out.println(d != d);

        // System.out.println(Math.cos(Math.toRadians(58)));
        // System.out.println(Math.sin(Math.toRadians(32)));

        Num n = Num.ONE;
        System.out.println(n);

    }
}