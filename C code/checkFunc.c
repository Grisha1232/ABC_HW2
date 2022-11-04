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
