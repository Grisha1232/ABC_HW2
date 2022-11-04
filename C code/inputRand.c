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
