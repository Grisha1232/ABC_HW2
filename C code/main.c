#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

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
    fprintf(output, "Number of punctuation marks in string: %d", result);
    fclose(output);
}

void randomInput(int* result) {
    srand(time(NULL));
    int length = rand() % 1000;
    printf("Length of the string: %d\n", length);
    printf("Result rand string: ");
    for (int i = 0; i < length; i++) {
        char c = rand() % 96 + 32;
        printf("%c", c);
        if (isPunctuationMark(c)) {
            (*result)++;
        }
    }
}

void funcForTimeMeasuring() {
    int result = 0;
    srand(time(NULL));
    int length = rand() % 1000;
    for (int i = 0; i < length; i++) {
        char c = rand() % 96 + 32;
        if (isPunctuationMark(c)) {
            result++;
        }
    }
}

int main(int argc, char *argv[]) {
    int result = 0;
    char *string = NULL;
    size_t length = 0;
    for (int i = 0; i < argc; i++) {
        printf("'%s'\n", argv[i]);
    }
    if (argc == 1) {
        inputFromConsole(&string, &length);
        if (length <= 1) {
            printf("Incorrect input");
            return -1;
        }
        length--;
        for (int i = 0; i < length; i++) {
            if (isPunctuationMark(string[i])) {
                result++;
            }
        }
        printf("Number of punctuation marks in string: %d", result);
    } else if (argc == 2) {
        if (strcmp(argv[1], "measuring") == 0) {
            time_t t_start = clock();
            for (int i = 0; i < 700000; i++) {
                funcForTimeMeasuring();
            }
            time_t t_end = clock();

            printf("\nThe task is done 700000 times in %d ms\n", (int) (difftime(t_end, t_start)) / 1000);
            return 0;
        }
        randomInput(&result);
        printf("\nNumber of punctuation marks in string: %d", result);
    } else if (argc == 3) {
        result = inputFromFile(argv[1]);
        outputToFile(argv[2], result);
    }

    return 0;
}
