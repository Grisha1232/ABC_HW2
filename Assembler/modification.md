# Сделанные модификации


**Заменены штуки вида:**
```Assembler
lea rax, 'something'     # (или какой-нибудь другой регистр вместо rax)
mov rdi, rax
```
**на:**
```
lea rdi, 'something'    
```
##
