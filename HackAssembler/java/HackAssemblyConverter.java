import java.util.Hashtable;

public class HackAssemblyConverter {

    // The hack computer is a 16-bit computer
    private static int bitLength = 16;

    // tables for C-instruction - format is: dest = comp ; jump
    private static Hashtable<String, String> compHashTable = new Hashtable<String, String>();
    private static Hashtable<String, String> destHashTable = new Hashtable<String, String>();
    private static Hashtable<String, String> jumpHashTable = new Hashtable<String, String>();

    public HackAssemblyConverter() {
        initCompTable();
        initDestTable();
        initJumpTable();
    }

    private static void initCompTable() {
        // key,value for a=0
        compHashTable.put("0", "0101010");
        compHashTable.put("1", "0111111");
        compHashTable.put("-1", "0111010");
        compHashTable.put("D", "0001100");
        compHashTable.put("A", "0110000");
        compHashTable.put("!D", "0101010");
        compHashTable.put("!A", "0110001");
        compHashTable.put("-D", "0001111");
        compHashTable.put("-A", "0110011");
        compHashTable.put("D+1", "0011111");
        compHashTable.put("A+1", "0110111");
        compHashTable.put("D-1", "0001110");
        compHashTable.put("A-1", "0110010");
        compHashTable.put("D+A", "0000010");
        compHashTable.put("D-A", "0010011");
        compHashTable.put("A-D", "0000111");
        compHashTable.put("D&A", "0000000");
        compHashTable.put("D|A", "0010101");

        // key, value for a=1
        compHashTable.put("M", "1110000");
        compHashTable.put("!M", "1110001");
        compHashTable.put("-M", "1110011");
        compHashTable.put("M+1", "1110111");
        compHashTable.put("M-1", "1110010");
        compHashTable.put("D+M", "1000010");
        compHashTable.put("D-M", "1010011");
        compHashTable.put("M-D", "1000111");
        compHashTable.put("D&M", "1000000");
        compHashTable.put("D|M", "1010101");
    }

    private static void initDestTable() {
        destHashTable.put("null", "000");
        destHashTable.put("M", "001");
        destHashTable.put("D", "010");
        destHashTable.put("MD", "011");
        destHashTable.put("A", "100");
        destHashTable.put("AM", "101");
        destHashTable.put("AD", "110");
        destHashTable.put("AMD", "111");
    }

    private static void initJumpTable() {
        jumpHashTable.put("null", "000");
        jumpHashTable.put("JGT", "001");
        jumpHashTable.put("JEQ", "010");
        jumpHashTable.put("JGE", "011");
        jumpHashTable.put("JLT", "100");
        jumpHashTable.put("JNE", "101");
        jumpHashTable.put("JLE", "110");
        jumpHashTable.put("JMP", "111");
    }

    /**
     * Converts the C-instruction fields (destination, computation, jumpCondition)
     * to a binary C-instruction
     * 
     * @return the machine language instruction as a string
     */
    public String convertCInstruction(String destSymbol, String compSymbol, String jumpSymbol) {
        String destBinary = destHashTable.get(destSymbol);
        String compBinary = compHashTable.get(compSymbol);
        String jumpBinary = jumpHashTable.get(jumpSymbol);

        // binary C-instruction format = 111ac1c2c3c4c5c6d1d2d3j1j2j3
        // see nand2tetris.org for more info
        return "111" + compBinary + destBinary + jumpBinary;
    }

    /**
     * Converts the A-instruction decimal value to a binary A-instruction
     * 
     * @return the machine language instruction as a string
     */
    public String convertAInstruction(int decimal) {
        // A-instructions always start with 0, so there are only 15 bits for the value
        // to use
        int[] binary = new int[bitLength];
        String machineInstruction = "";

        decimal = decimal % 32768; // max value 32767 ((2^15) - 1)

        binary = decimalToBinary(decimal);
        for (int i = 0; i < binary.length; i++) {
            machineInstruction += binary[i];
        }
        return machineInstruction;
    }

    /**
     * Converts base 10 number into binary
     * 
     * @param decimal
     * @return binary number as a char array
     */
    private static int[] decimalToBinary(int decimal) {
        int[] binNum = new int[bitLength];

        // converts decimal to binary
        // i only goes down to 1 because this only needs to be done
        // for A-instructions and they always start with 0
        int i = 15;
        while (decimal > 0 && i > 0) {
            int remainder = decimal % 2;
            binNum[i] = remainder;
            decimal = decimal / 2;
            i--;
        }

        return binNum;
    }

}