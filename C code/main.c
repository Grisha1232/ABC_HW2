#include <stdio.h>
#include <stdlib.h>

extern int isPunctuationMark(const char c);

extern void inputFromConsole(char **string, size_t *length);

extern int inputFromFile(char* in);

extern void outputToFile(char* out, const int result);

extern int randomInput(int* result);

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
