#include <stdio.h>
#include <stdlib.h>

#define max_size 10000

int isPunctuationMark(const char c) {
    switch (c) {
        case 33:        // !
        case 34:        // "
        case 39:        // '
        case 40:        // (
        case 41:        // )
        case 44:        // ,
        case 45:        // -
        case 46:        // .
        case 47:        // /
        case 58:        // :
        case 59:        // ;
        case 60:        // <
        case 62:        // >
        case 63:        // ?
        case 91:        // [
        case 92:        // backslash
        case 93:        // ]
        case 94:        // ^
        case 95:        // _
        case 96:        // `
        case 123:       // {
        case 124:       // |
        case 125:       // }
            return 1;
        default:
            return 0;
    }
}

void inputFromConsole(char **string, size_t *length) {
    // char* string;    string that input user
    size_t inputLen = 0;
    printf("Type string: ");
    *length = getline(&*string, &inputLen, stdin);
}

void inputFromFile(char* stream) {
    // TODO: Write func to read from FILE
}

void outputToFile(char* output) {
    // TODO: Write func to output result to file
}

void randomInput(int* result) {
    // TODO: Write func for randInput (with output random) and count result
}

int main(int argc, char *argv[]) {
    int result = 0;
    char *string = NULL;
    size_t length = 0;
    if (argc == 1) {
        inputFromConsole(&string, &length);
        if (length <= 1) {
            printf("Incorrect input");
            return -1;
        }
        length--;
    } else if (argc == 2) {
        randomInput(&result);
        printf("%d", result);
    } else if (argc == 3) {
        inputFromFile(argv[1]);
        outputToFile(argv[2]);
    }

    return 0;
}
