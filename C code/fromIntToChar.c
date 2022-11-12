
char fromIntToChar(int value) {
    switch (value) {
        case 0:        // !
            return 33;
        case 1:        // "
            return 34;
        case 2:        // '
            return 39;
        case 3:        // (
            return 40;
        case 4:        // )
            return 41;
        case 5:        // ,
            return 44;
        case 6:        // -
            return 45;
        case 7:        // .
            return 46;
        case 8:        // /
            return 47;
        case 9:        // :
            return 58;
        case 10:        // ;
            return 59;
        case 11:        // <
            return 60;
        case 12:        // >
            return 62;
        case 13:        // ?
            return 63;
        case 14:        // [
            return 91;
        case 15:        // backslash
            return 92;
        case 16:        // ]
            return 93;
        case 17:        // ^
            return 94;
        case 18:        // _
            return 95;
        case 19:        // `
            return 96;
        case 20:       // {
            return 123;
        case 21:       // |
            return 124;
        case 22:       // }
            return 125;
        default:
            return 0;
    }
}
