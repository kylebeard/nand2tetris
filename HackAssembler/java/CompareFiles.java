import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.IOException;
import java.util.FormatFlagsConversionMismatchException;
import java.io.FileNotFoundException;

public class CompareFiles {

    public static void main(String[] args) {
        String in1 = args[0];
        String in2 = args[1];
        File file1, file2 = null;
        BufferedReader reader1 = null;
        BufferedReader reader2 = null;
        String inst1 = null;
        String inst2 = null;
        // String path = "";

        // first pass for label definitions
        try {

            file1 = new File(in1);
            reader1 = new BufferedReader(new FileReader(file1));

            file2 = new File(in2);
            reader2 = new BufferedReader(new FileReader(file2));
            int i = 1;
            while (i < 10000) {
                inst1 = reader1.readLine();
                inst2 = reader2.readLine();
                inst1 = inst1.trim();
                inst2 = inst2.trim();
                if (!inst1.equals(inst2)) {
                    System.out.println("inst1: " + inst1 + " on line " + i);
                    System.out.println("inst2: " + inst2 + " on line " + i);
                    System.out.println();

                }
                i++;
            }

        } catch (FileNotFoundException fnfe) {
            fnfe.printStackTrace();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        } finally {
            try {

                if (reader1 != null)
                    reader1.close();
                if (reader2 != null)
                    reader2.close();

            } catch (IOException ioe) {
                ioe.printStackTrace();
            }
        }

    }
}