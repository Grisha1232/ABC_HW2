int isPunctuationMark(const char c) {
    switch (c) {
        case 33:        // !
            return 0;
        case 34:        // "
            return 1;
        case 39:        // '
            return 2;
        case 40:        // (
            return 3;
        case 41:        // )
            return 4;
        case 44:        // ,
            return 5;
        case 45:        // -
            return 6;
        case 46:        // .
            return 7;
        case 47:        // /
            return 8;
        case 58:        // :
            return 9;
        case 59:        // ;
            return 10;
        case 60:        // <
            return 11;
        case 62:        // >
            return 12;
        case 63:        // ?
            return 13;
        case 91:        // [
            return 14;
        case 92:        // backslash
            return 15;
        case 93:        // ]
            return 16;
        case 94:        // ^
            return 17;
        case 95:        // _
            return 18;
        case 96:        // `
            return 19;
        case 123:       // {
            return 20;
        case 124:       // |
            return 21;
        case 125:       // }
            return 22;
        default:
            return -1;
    }
}
