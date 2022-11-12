# Архитектура вычислительных систем. ИДЗ №2 Вариант 22. Селезнев Григорий Ильич БПИ217.

## Вариант 22:
Разработать программу, вычисляющую число вхождений различных знаков препинания в заданной ASCII-строке.

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

**1. Приведено решение задачи на С:**
* [main.c](https://github.com/Grisha1232/ABC_HW2/blob/d045336a1c9d9b707635d15b5db7e82ad5852656/C%20code/main.c)
* [checkFunc.c](https://github.com/Grisha1232/ABC_HW2/blob/d045336a1c9d9b707635d15b5db7e82ad5852656/C%20code/checkFunc.c)
* [fromIntToChar](https://github.com/Grisha1232/ABC_HW2/blob/2d3f19fdd03e04c6370ad2e7ab01b2abceaebaaa/C%20code/fromIntToChar.c)

**2. Ассемблер не модифицированый (без опций отладки, с комментариями):**
```
gcc main.c -S -o nonModMain.s
gcc checkFunc.c -S -o nonModCheckFunc.s
gcc fromIntToChar.c -S -o nonModFromIntToChar.s
```
* [nonModmain.s](https://github.com/Grisha1232/ABC_HW2/blob/1ca575f339a62209288e3ad6f3c736adb7176784/Assembler%20non%20mod/nonModmain.s)
* [nonModcheckFunc.s](https://github.com/Grisha1232/ABC_HW2/blob/1ca575f339a62209288e3ad6f3c736adb7176784/Assembler%20non%20mod/nonModmain.s)
* [nonModFromIntToChar.s]()

**3. Ассемблер модифицированый (с комментариями):**
* [main.s](https://github.com/Grisha1232/ABC_HW2/blob/48b2c426b5356b4621fed315a6829a024582d122/Assembler/main.s)
* [checkFunc.s](https://github.com/Grisha1232/ABC_HW2/blob/48b2c426b5356b4621fed315a6829a024582d122/Assembler/checkFunc.s)
> [Список изменений](https://github.com/Grisha1232/ABC_HW2/blob/48b2c426b5356b4621fed315a6829a024582d122/Assembler/modification.md)


### Итог:
* Приведено решения на С
* Приведена ассемблерная программа без отладочных опций (с комментариями)
* Приведена ассемблерная программа с модификациями  (с комментариями)
* Проведены [тесты](https://github.com/Grisha1232/ABC_HW2/blob/172f26346ab041398afd02f12694f86c6d8afe9d/C%20code/Tests/test.md) для подтвержинения индентичной работы двух программ

## Отчет на 5 баллов:

**1. Сделаны функции с передачей данных через параметры:**  
* isPunctuationMark(const char c)
* inputFromConsole(char ***string, size_t *length)
* inputFromFile(char* in)
* outputToFile(char* out, const int result)
* randomInput(int* result)

### Итог: 
* Использованы локальные переменные в файле [main.c](https://github.com/Grisha1232/ABC_HW2/blob/d045336a1c9d9b707635d15b5db7e82ad5852656/C%20code/main.c)  
* Добавлены комментарии в ассемблерную програму описывающую передачу данных через параметры [main.s](https://github.com/Grisha1232/ABC_HW2/blob/48b2c426b5356b4621fed315a6829a024582d122/Assembler/main.s)  

## Отчет на 6 баллов:

**1. Заменены следующие переменные:**
* Замена переменной i (C code) во всех циклах на регистр r12d
* Замена переменной count (C code) в некоторых местах на регистр r12d
* Замена переменной result (C code) в функции на регистр r12d

### Итог:
* Использованы регистры для некоторых переменных в assembler
* Проведены [тестовые прогоны](https://github.com/Grisha1232/ABC_HW2/blob/db276b4c2f406b24840ed629068590b26d19f6b2/Assembler/Tests/test.md) для подтверждения, что программа работает идентично C коду

## Отчет на 7 баллов:

**1. Реализована программа с двумя еденицами компиляции:**
* Функция isPunctuationMark(const char c) вынесена в отдельный файл checkFunc.c
* Добавлена одна еденица компиляции к уже имеющейся:
```
gcc main.s -c -o main.o
gcc checkFunc.s -c -o checkFunc.o
gcc main.o checkFunc.o -o program.exe
```

**2. Реализован ввод и вывод через файлы.** Для того, чтобы ввести данные через файл и также вывести в другой файл нужно:
* Создать два файла input.txt и output.txt (Названия файлов не важны).
* Расположить эти два файла рядом с **program.exe**
* Прописать в командной строке:
```
./program.exe input.txt output.txt
```
Где **input.txt** - для ввода данных, а **output.txt** - для вывода результата.

### Итог: 
* Добавлена еденица компиляции
* Добавлен ввод и вывод через файлы
* Проведены [тесты с файлами](https://github.com/Grisha1232/ABC_HW2/blob/05d644c2aff69349c4c50eb9dd1fe4e32a739fb8/Assembler/Tests/testWithFilesInputOutput.md), которые показали идентичную работу

## Отчет на 8 баллов:

**1. Реализован генератор случайной строки.**
Для того, чтобы запустить программу, которая сама генерирует строку и выводит ответ нужно ввести в командную строку:
```
./program.exe 1
```
> Вместо 1 может быть все, что угодно кроме фразы "measuring".

**2. Реализован замер времени без учета ввода и ввывода (только операция поиска знаков препинания).**
Для того, чтобы запустить программу, которая сгенерирует строку и прогонет много раз один и тот же тест для замера времени нужно ввести в командную строку:
```
./program.exe measuring
```
> Только с этим ключем запуститься тест на замер времени работы программы.

### Итог:
* Добавлен генератор случайной строки для облегчения тестирования
* Добавлена возможность запустить тест для замера времени с выводом времени. ([тут можно посмотреть на замеры времени](https://github.com/Grisha1232/ABC_HW2/blob/0bbd92b4353d397dc2f944bfb44f4efd6c012706/Time%20Test/test.md))
> Из тестов по замеру времени видно, что ассемблерная программа работает на пару десятых секунд быстрее
