void outputToFile(char* out, const int result) {
    FILE* output = fopen(out, "w");
    fprintf(output, "%d", result);
    fclose(output);
}
