# Архитектура вычислительных систем. ИДЗ №2 Вариант 22. Селезнев Григорий Ильич БПИ217.

## Как устроена программа:
Для того, чтобы сделать ввод строки в ручную:
```
./program.exe
```
Для того, чтобы сделать ввод строки рандомный (генерация строки):
```
./program.exe 2
```
Для того, чтобы сделать замер работы программы (генерируются строки и считаются знаки пунктуации). При это сами строки не выводятся для не загрязнения консоли
```
./program.exe measuring
```
Для того, чтобы сделать ввод строки из файла (input.txt output.txt - это созданные файлы который лежит рядом с .exe):
```
./program.exe input.txt output.txt
```

## Отчет на 4 балла:

**Приведено решение задачи на С:**
* [main.c](https://github.com/Grisha1232/ABC_HW2/blob/d045336a1c9d9b707635d15b5db7e82ad5852656/C%20code/main.c)
* [checkFunc.c](https://github.com/Grisha1232/ABC_HW2/blob/d045336a1c9d9b707635d15b5db7e82ad5852656/C%20code/checkFunc.c)

**Ассемблер не модифицированый (без опций отладки, с комментариями):**
* [nonModmain.s](https://github.com/Grisha1232/ABC_HW2/blob/1ca575f339a62209288e3ad6f3c736adb7176784/Assembler%20non%20mod/nonModmain.s)
* [nonModcheckFunc.s](https://github.com/Grisha1232/ABC_HW2/blob/1ca575f339a62209288e3ad6f3c736adb7176784/Assembler%20non%20mod/nonModmain.s)

**Ассемблер модифицированый (с комментариями):**
* [main.s](https://github.com/Grisha1232/ABC_HW2/blob/48b2c426b5356b4621fed315a6829a024582d122/Assembler/main.s)
* [checkFunc.s](https://github.com/Grisha1232/ABC_HW2/blob/48b2c426b5356b4621fed315a6829a024582d122/Assembler/checkFunc.s)
> [Список изменений](https://github.com/Grisha1232/ABC_HW2/blob/48b2c426b5356b4621fed315a6829a024582d122/Assembler/modification.md)
