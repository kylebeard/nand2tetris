#include "JackTokenizer.h"
#include "utils.h"
#include <dirent.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
int getPaths(char *inPath, char **paths);
int jackFilesInDir(DIR *);
bool isJackFile(char *);
char *changeExt(char *, char *);
char *jack = ".jack";
enum { ISFILE, ISDIR };

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("USAGE: JackCompiler <Path to .jack file or directory of .jack files>");
        exit(1);
    }

    char **paths;
    char *inPath = argv[1];
    int nfiles = getPaths(inPath, paths);
    if (nfiles == -1) {
        printf("invalid path. Must point to file or directory");
        exit(1);
    }

    printf("number of jack files found: %d\n", nfiles);
    for (int i = 0; i < nfiles; i++) { printf("%s\n", paths[i]); }

    return 0;

    char *outPath = "/Users/kyle/Documents/Programming/nand2tetris/CompilerInC/"
                    "test/TestT.xml";

    // char *infile1, char *infile2 -> char **inFiles char **outFiles char
    // ***paths
    // -> char infile1[] char inFiles[][]
    FILE *inFile, *outFile;

    if ((inFile = fopen(inPath, "r")) == NULL) {
        printf("file does not exist: %s", inPath);
        return 1;
    }
    outFile = fopen(outPath, "w");
    initTokenizer(inFile);
    int i = 0;
    bool b;
    b = hasMoreTokens();
    fprintf(outFile, "<tokens>\n");
    while (b && i < 250) {

        advance();
        char *val = tokenVal();
        TokenType tt = tokenType();
        char *ttStr = getTokenTypeStr(tt);
        // <tt>val</tt>
        fprintf(outFile, "<%s> %s </%s>\n", ttStr, val, ttStr);
        i++;
        b = hasMoreTokens();
        printf("hasMoreTokens: %d\n", b);
    }

    fprintf(outFile, "</tokens>\n");
    freeTokenizer();

    fclose(inFile);
    fclose(outFile);
    return 0;
}

int getPaths(char *inPath, char **paths) {
    /*
    file: replace ".jack" with "T.xml"
    if inPath is file:
        do $file
    if inPath is dir:
        foreach file in dir:
            if ext == ".jack":
                do $file
    */
    struct stat s;
    DIR *dir;
    struct dirent *entry;

    stat(inPath, &s);
    int files = 0;
    if (S_ISDIR(s.st_mode)) {
        dir = opendir(inPath);
        files = jackFilesInDir;
        if (!files) {
            printf("no Jack files found in directory.");
            exit(1);
        }

        paths = calloc(files, sizeof(char *));

        int i = 0;
        while ((entry = readdir(dir))) {
            if (!isJackFile(entry->d_name))
                continue;

            int nameLen = strnlen(entry->d_name, FILENAME_MAX);
            char name[nameLen + 1];
            strlcpy(name, entry->d_name, nameLen + 1);
            paths[i++] = name;
        }

        closedir(dir);
        return files;

    } else if (S_ISREG(s.st_mode)) {
        paths = calloc(1, sizeof(char *));
        *paths = inPath;
        return 1;
    }
    return -1;
}

int jackFilesInDir(DIR *dir) {
    int files = 0;
    struct dirent *entry;

    while ((entry = readdir(dir))) {
        if (isJackFile(entry->d_name))
            files++;
    }
    return files;
}

bool isJackFile(char *name) {
    char *dot = strrchr(name, '.');
    if (!dot)
        return false;
    return strncmp(jack, dot, 5) == 0;
}

char *changeExt(char *file, char *toExt) {}