#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

extern int isPunctuationMark(const char c);

extern char fromIntToChar(int value);

void inputFromConsole(char **string, size_t *length) {
    size_t inputLen = 0;
    printf("Type string: ");
    *length = getline(&*string, &inputLen, stdin);
}

int inputFromFile(char *in, int resultPunct[]) {
    FILE *input = fopen(in, "r");
    char c;
    int count = 0;
    while (!feof(input)) {
        c = fgetc(input);
        int j = isPunctuationMark(c);
        if (j != -1) {
            resultPunct[j]++;
            count++;
        }
    }
    fclose(input);
    return count;
}

void outputToFile(char *out, const int result, const int resultPunct[]) {
    FILE *output = fopen(out, "w");
    fprintf(output, "Number of punctuation marks in string: %d\n", result);
    for (int i = 0; i < 23; i++) {
        if (resultPunct[i] != 0) {
            fprintf(output, "%c -- %d\n", fromIntToChar(i), resultPunct[i]);
        }
    }
    fclose(output);
}

void randomInput(int *result, int resultPunct[]) {
    srand(time(NULL));
    int length = rand() % 1000;
    printf("Length of the string: %d\n", length);
    printf("Result rand string: ");
    for (int i = 0; i < length; i++) {
        char c = rand() % 96 + 32;
        printf("%c", c);
        int j = isPunctuationMark(c);
        if (j != -1) {
            resultPunct[j]++;
            (*result)++;
        }
    }
}

void funcForTimeMeasuring(const char string[], const int length, int resultPunct[]) {
    int result = 0;
    for (int i = 0; i < length; i++) {
        char c = string[i];
        int j = isPunctuationMark(c);
        if (j != -1) {
            resultPunct[j]++;
            result++;
        }
    }
}

int main(int argc, char *argv[]) {
    int punctMarks[23] =
            {0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0};
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
        for (int i = 0; i < length; i++) {
            int j = isPunctuationMark(string[i]);
            if (j != -1) {
                punctMarks[j]++;
                result++;
            }
        }
        printf("Number of punctuation marks in string: %d\n", result);
        for (int i = 0; i < 23; i++) {
            if (punctMarks[i] != 0) {
                printf("%c -- %d\n", fromIntToChar(i), punctMarks[i]);
            }
        }
    } else if (argc == 2) {
        if (strcmp(argv[1], "measuring") == 0) {
            srand(time(NULL));
            int length1 = 999;
            char string1[length1];
            printf("Result rand string: ");
            for (int i = 0; i < length1; i++) {
                char c = rand() % 96 + 32;
                string1[i] = c;
                printf("%c", c);
            }
            time_t t_start = clock();
            for (int i = 0; i < 800000; i++) {
                if(i != 800000 - 1) {
                    int punct[23];
                    funcForTimeMeasuring(string1, length1, punct);
                } else {
                    funcForTimeMeasuring(string1, length1, punctMarks);
                }
            }
            time_t t_end = clock();

            printf("\nThe task is done 800000 times in %d ms\n", (int) (difftime(t_end, t_start)) / 1000);
            for (int i = 0; i < 23; i++) {
                if (punctMarks[i] != 0) {
                    printf("%c -- %d\n", fromIntToChar(i), punctMarks[i]);
                }
            }
            return 0;
        }
        randomInput(&result, punctMarks);
        printf("\nNumber of punctuation marks in string: %d\n", result);
        for (int i = 0; i < 23; i++) {
            if (punctMarks[i] != 0) {
                printf("%c -- %d\n", fromIntToChar(i), punctMarks[i]);
            }
        }
    } else if (argc == 3) {
        result = inputFromFile(argv[1], punctMarks);
        outputToFile(argv[2], result, punctMarks);
    }

    return 0;
}
