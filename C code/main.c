#include <stdio.h>
#include <stdlib.h>

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
    size_t inputLen = 0;
    printf("Type string: ");
    *length = getline(&*string, &inputLen, stdin);
}

int inputFromFile(char* in) {
    FILE* input = fopen(in, "r");
    char c;
    int count = 0;
    while(!feof(input)) {
        c = fgetc(input);
        if (isPunctuationMark(c)) {
            count++;
        }
    }
    fclose(input);
    return count;
}

void outputToFile(char* out, const int result) {
    FILE* output = fopen(out, "w");
    fprintf(output, "%d", result);
    fclose(output);
}

int randomInput(int* result) {
    srand(NULL);
    int count = 0;
    int length = rand() % 10000;
    printf("Result rand string: ");
    for (int i = 0; i < length; i++) {
        char c = rand() % 128;
        printf("%c", c);
        if (isPunctuationMark(c)) {
            count++;
        }
    }
    return count;
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
        result = inputFromFile(argv[1]);
        outputToFile(argv[2], result);
    }

    return 0;
}
