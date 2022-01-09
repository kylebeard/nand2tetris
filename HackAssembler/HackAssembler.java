import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.FileNotFoundException;

public class HackAssembler {

    private static HackAssemblerParser parser;
    private static HackAssemblyConverter converter;
    private static String machineInstruction = null;

    public static void main(String[] args) {

        if (args.length != 1) {
            System.err.println("Usage: HackAssembler <input file>");
            System.exit(0);
        }
        parser = new HackAssemblerParser();
        converter = new HackAssemblyConverter();
        String input = args[0];
        File inFile, outFile = null;
        BufferedReader reader = null;
        BufferedWriter writer = null;
        String instruction = null;
        String path = "";

        // first pass for label definitions
        try {

            inFile = new File(input);
            reader = new BufferedReader(new FileReader(inFile));

            while ((instruction = reader.readLine()) != null) {
                parser.firstPass(instruction);
            }

        } catch (FileNotFoundException fnfe) {
            fnfe.printStackTrace();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        } finally {
            try {

                if (reader != null)
                    reader.close();
                if (writer != null)
                    writer.close();

            } catch (IOException ioe) {
                ioe.printStackTrace();
            }
        }

        try {

            inFile = new File(input);
            reader = new BufferedReader(new FileReader(inFile));

            path = input.substring(0, input.lastIndexOf('.'));
            outFile = new File(path + ".hack");
            outFile.createNewFile();
            writer = new BufferedWriter(new FileWriter(outFile));

            while ((instruction = reader.readLine()) != null) {
                machineInstruction = null;
                parser.parse(instruction);

                if (parser.isAInstruction()) {
                    machineInstruction = converter.convertAInstruction(parser.getAValue());

                } else if (parser.isCInstruction()) {
                    machineInstruction = null;
                    machineInstruction = converter.convertCInstruction(parser.getDest(), parser.getComp(),
                            parser.getJump());

                } else { // either a comment or label - continue to next line
                    continue;
                }

                writer.write(machineInstruction);
                writer.newLine();

            }

        } catch (FileNotFoundException fnfe) {
            fnfe.printStackTrace();

        } catch (IOException ioe) {
            ioe.printStackTrace();
        } finally {
            try {

                if (reader != null)
                    reader.close();
                if (writer != null)
                    writer.close();

            } catch (IOException ioe) {
                ioe.printStackTrace();
            }
        }
    }
}