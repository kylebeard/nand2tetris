
/**
 * 
 * This program parses instructions for the Hack Assembly Langauage
 * The Hack Assembly Language is part of the nand2tetris course:
 * nand2tetris.org
 * 
 * @author Kyle Beard
 * 
 */

import java.util.Hashtable;

public class HackAssemblerParser {

    /**
     * There are two types of instructions in the Hack Assembly Language, A and C:
     * A-Instruction form: @decimalValue C-Instruction form: destination =
     * computation ; jumpCondition || destination = computation || computation ;
     * jumpCondition
     */

    private String comp, dest, jump = "null";
    private String aValue = null; // value of the number in an A-Instruction
    private boolean isAInstruction = false;
    private boolean isCInstruction = false;
    private static Hashtable<String, String> symbolTable;

    // used in firstPass to keep track of what any @USER_LABEL value should be,
    // it is only incremented when a legitamate assembly instruction
    // is passed (i.e. not a comment or a lablel declaration)
    private int lineNumber;

    // the register to start at when allocating memory for user variables
    private final int VAR_MEMORY_START = 16;
    private int currVarRegister;

    public HackAssemblerParser() {
        symbolTable = new Hashtable<String, String>();
        lineNumber = 0;
        currVarRegister = VAR_MEMORY_START;

        // register symbols
        symbolTable.put("R0", "0");
        symbolTable.put("R1", "1");
        symbolTable.put("R2", "2");
        symbolTable.put("R3", "3");
        symbolTable.put("R4", "4");
        symbolTable.put("R5", "5");
        symbolTable.put("R6", "6");
        symbolTable.put("R7", "7");
        symbolTable.put("R8", "8");
        symbolTable.put("R9", "9");
        symbolTable.put("R10", "10");
        symbolTable.put("R11", "11");
        symbolTable.put("R12", "12");
        symbolTable.put("R13", "13");
        symbolTable.put("R14", "14");
        symbolTable.put("R15", "15");

        symbolTable.put("SCREEN", "16384");
        symbolTable.put("KBD", "24576");
        symbolTable.put("SP", "0");
        symbolTable.put("LCL", "1");
        symbolTable.put("ARG", "2");
        symbolTable.put("THIS", "3");
        symbolTable.put("THAT", "4");
    }

    /** Used to initialize user defined labels to the symbol table */
    public void firstPass(String instruction) {
        instruction = instruction.trim();

        String label;
        if (instruction.length() > 0) {
            if (instruction.charAt(0) == '(') {
                label = instruction.substring(1, instruction.length() - 1);
                symbolTable.put(label, Integer.toString(lineNumber));

            } else if (!instruction.substring(0, 2).equals("//")) {
                lineNumber++;
            }
        }
    }

    /**
     * Parses a line of code from the Hack Assembly Language
     */
    public void parse(String instruction) {
        int commentIndex;
        char firstChar;

        // reset all fields
        comp = "null";
        dest = "null";
        jump = "null";
        aValue = null;
        isAInstruction = false;
        isCInstruction = false;

        instruction = instruction.trim();

        // labels were handled in the first pass
        if (instruction.length() > 0 && instruction.charAt(0) != '(') {
            commentIndex = instruction.indexOf("//");

            if (commentIndex > -1) {
                // there is a comment - get the substring prior to the comment
                instruction = instruction.substring(0, commentIndex);
                instruction = instruction.trim();
            }

            // if it was an in-line comment there is still an instruction to parse
            if (instruction.length() > 0) {
                firstChar = instruction.charAt(0);

                if (firstChar == '@') {
                    isAInstruction = true;
                    parseAInstruction(instruction);

                } else {
                    isCInstruction = true;
                    parseCInstruction(instruction);
                }
            }
        }
    }

    /** parses the decimal value of A-Instruction */
    private void parseAInstruction(String instruction) {
        // remove '@' symbol
        aValue = instruction.substring(1);
        aValue = aValue.trim();

        // aValue is a label or variable
        if (Character.isLetter(aValue.charAt(0))) {
            if (symbolTable.containsKey(aValue)) {
                aValue = symbolTable.get(aValue);
            } else {
                symbolTable.put(aValue, Integer.toString(currVarRegister));
                aValue = Integer.toString(currVarRegister);
                currVarRegister++;
            }
        }
    }

    /**
     * Parses a C-instruction into it's destination, computation, and jump fields
     */
    private void parseCInstruction(String instruction) {
        if (instruction.contains("=")) {
            // get destination
            String[] splitOnEquals = instruction.split("=");
            dest = splitOnEquals[0].replaceAll("\\s+", "");

            // get compputation
            String[] splitOnSemiColon = splitOnEquals[1].split(";");
            comp = splitOnSemiColon[0].replaceAll("\\s+", "");

            // there may not be a jump
            if (splitOnSemiColon.length == 2) {
                jump = splitOnSemiColon[1].replaceAll("\\s+", "");
            }

            // there is no destination so format is comp;jump
        } else if (instruction.contains(";")) {
            String[] split = instruction.split(";");
            comp = split[0];
            jump = split[1];
        }
    }

    /**
     * @return true if current instruction is an A-instruction, false otherwise
     */
    public boolean isAInstruction() {
        return isAInstruction;
    }

    /**
     * @return true if current instruction is an C-instruction, false otherwise
     */
    public boolean isCInstruction() {
        return isCInstruction;
    }

    /**
     * @return the decimal value of the A-instruction
     */
    public Integer getAValue() {
        return Integer.parseInt(aValue);
    }

    /**
     * @return the destination of the C-instruction
     */
    public String getDest() {
        return dest;
    }

    /**
     * @return the computation segment of the C-instruction
     */
    public String getComp() {
        return comp;
    }

    /**
     * @return the jump condition of the C-instruction if there is one, returns null
     *         otherwise
     */
    public String getJump() {
        return jump;
    }

}