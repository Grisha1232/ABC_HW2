#include <stdio.h>
#include <stdlib.h>

extern int isPunctuationMark(const char c);

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
    srand(10);
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
