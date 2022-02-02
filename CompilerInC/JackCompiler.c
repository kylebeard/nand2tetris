#include "JackTokenizer.h"
#include "utils.h"
#include <dirent.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
char **getPaths(char *, int *);
int jackFilesInDir(DIR *);
bool isJackFile(char *);
char *changeExt(char *, char *);
char *jack = ".jack";
char *outExt = "T.xml";
const int MAX_TOKENS = 1000000;
char *toXml(char *);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("USAGE: JackCompiler <Path to .jack file or directory of .jack files>");
        return 1;
    }

    int nfiles = 0;
    char **paths = getPaths(argv[1], &nfiles);

    printf("number of jack files found: %d\n", nfiles);
    FILE *inFile, *outFile;
    for (int i = 0; i < nfiles; i++) {
        char *inPath = paths[i];
        char *outPath = changeExt(inPath, outExt);
        printf("comiling %s\n to %s\n", inPath, outPath);

        inFile = fopen(inPath, "r"); // getPaths() checks for existence
        outFile = fopen(outPath, "w");
        initTokenizer(inFile);

        fprintf(outFile, "<tokens>\n");
        for (int i = 0; hasMoreTokens() && i < MAX_TOKENS; i++) {
            advance();
            char *ttStr = getTokenTypeStr(tokenType());
            char *val = tokenVal();
            val = toXml(val);
            fprintf(outFile, "<%s> %s </%s>\n", ttStr, val, ttStr);
        }

        fprintf(outFile, "</tokens>\n");
        freeTokenizer();

        fclose(inFile);
        fclose(outFile);
    }
    return 0;
}
char *toXml(char *tok) {
    if (strnlen(tok, 100) > 1)
        return tok;

    switch (tok[0]) {
    case '<':
        return "&lt;";
    case '>':
        return "&gt;";
    case '"':
        return "&quot;";
    case '&':
        return "&amp;";
    default:
        return tok;
    }
}
char **getPaths(char *inPath, int *numFiles) {
    /*
    if inPath is a file:
        copy it to paths
    if inPath is a directory:
        read each file in the directory:
            if it's a jack file:
                contact inPath + / + file
                append it to paths
    */
    char **paths = NULL;
    struct stat s;
    DIR *dir = NULL;
    struct dirent *entry = NULL;

    stat(inPath, &s);
    if (S_ISDIR(s.st_mode)) {
        dir = opendir(inPath);

        int inPathLen = strnlen(inPath, 5000);
        // so /path/to/dir and /path/to/dir/ work
        if (inPath[inPathLen - 1] == '/') {
            inPath[inPathLen - 1] = '\0';
            inPathLen--;
        }

        int i = 0;
        while ((entry = readdir(dir))) {
            if (!isJackFile(entry->d_name))
                continue;

            paths = (char **)realloc(paths, ++(*numFiles) * sizeof(char **));
            int nameLen = entry->d_namlen;
            // +2 for \0 and '/' we may be adding
            char *fullPath = (char *)calloc(inPathLen + nameLen + 2, sizeof(char));

            strlcpy(fullPath, inPath, inPathLen + 1);
            fullPath[inPathLen + 1] = '\0';
            fullPath[inPathLen] = '/';
            strlcat(fullPath, entry->d_name, inPathLen + nameLen + 2);
            paths[i++] = fullPath;
        }

        closedir(dir);
        if (!*numFiles) {
            printf("no Jack files found in directory.\n");
            exit(1);
        }

        return paths;

    } else if (S_ISREG(s.st_mode)) {
        paths = (char **)calloc(1, sizeof(char *));
        *paths = inPath;
        *numFiles = 1;
        return paths;
    }
    printf("invalid path. Must point to file or directory");
    exit(1);
}

bool isJackFile(char *name) {
    char *dot = strrchr(name, '.');
    if (!dot)
        return false;
    return strncmp(jack, dot, 5) == 0;
}

/** `toExt` must include the '.'*/
char *changeExt(char *file, char *toExt) {
    char *dot = strrchr(file, '.');
    if (!dot)
        return NULL;

    int fileNameLen = strnlen(file, FILENAME_MAX) - strnlen(dot, 50);
    int newFileLen = fileNameLen + strnlen(toExt, 50);

    char *newFile = (char *)calloc(newFileLen, sizeof(char));
    strlcpy(newFile, file, fileNameLen + 1);
    strlcat(newFile, toExt, newFileLen + 1);


    return newFile;
}