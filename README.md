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
* [main.c](https://github.com/Grisha1232/ABC_HW2/blob/7d4e43970e7ab0c9fd1adc561a86e21c517584c5/C%20code/main.c)
* [checkFunc.c](https://github.com/Grisha1232/ABC_HW2/blob/26484f97d626ee4b38a630b58063502ea6d85774/C%20code/checkFunc.c)
* [fromIntToChar](https://github.com/Grisha1232/ABC_HW2/blob/26484f97d626ee4b38a630b58063502ea6d85774/C%20code/fromIntToChar.c)

**2. Ассемблер не модифицированый (без опций отладки, с комментариями):**
```
gcc main.c -S -o nonModMain.s
gcc checkFunc.c -S -o nonModCheckFunc.s
gcc fromIntToChar.c -S -o nonModFromIntToChar.s
```
* [nonModmain.s](https://github.com/Grisha1232/ABC_HW2/blob/26484f97d626ee4b38a630b58063502ea6d85774/Assembler%20non%20mod/nonModmain.s)
* [nonModcheckFunc.s](https://github.com/Grisha1232/ABC_HW2/blob/26484f97d626ee4b38a630b58063502ea6d85774/Assembler%20non%20mod/nonModcheckFunc.s)
* [nonModFromIntToChar.s](https://github.com/Grisha1232/ABC_HW2/blob/26484f97d626ee4b38a630b58063502ea6d85774/Assembler%20non%20mod/nonModFromIntToChar.s)

**3. Ассемблер модифицированый (с комментариями):**
* [main.s](https://github.com/Grisha1232/ABC_HW2/blob/26484f97d626ee4b38a630b58063502ea6d85774/Assembler/main.s)
* [checkFunc.s](https://github.com/Grisha1232/ABC_HW2/blob/26484f97d626ee4b38a630b58063502ea6d85774/Assembler/fromIntToChar.s)
* [fromIntToChar.s](https://github.com/Grisha1232/ABC_HW2/blob/26484f97d626ee4b38a630b58063502ea6d85774/Assembler/checkFunc.s)
> [Список изменений](https://github.com/Grisha1232/ABC_HW2/blob/48b2c426b5356b4621fed315a6829a024582d122/Assembler/modification.md)


### Итог:
* Приведено решения на С
* Приведена ассемблерная программа без отладочных опций (с комментариями)
* Приведена ассемблерная программа с модификациями  (с комментариями)
* Проведены [тесты](https://github.com/Grisha1232/ABC_HW2/blob/84d526e480b62f112f14b90ca98112c2e69ffac0/C%20code/Tests/test.md) для подтвержинения индентичной работы двух программ

## Отчет на 5 баллов:

**1. Сделаны функции с передачей данных через параметры:**  
* isPunctuationMark(const char c)
* fromIntToChar(int value)
* inputFromConsole(char **string, size_t *length)
* inputFromFile(char* in, int resultPunct[])
* outputToFile(char* out, const int result, const int resultPunct[])
* randomInput(int* result, int resultPunct[])

### Итог: 
* Использованы локальные переменные в файле [main.c](https://github.com/Grisha1232/ABC_HW2/blob/7d4e43970e7ab0c9fd1adc561a86e21c517584c5/C%20code/main.c)  
* Добавлены комментарии в ассемблерную програму описывающую передачу данных через параметры [main.s](https://github.com/Grisha1232/ABC_HW2/blob/26484f97d626ee4b38a630b58063502ea6d85774/Assembler/main.s)  

## Отчет на 6 баллов:

**1. Заменены следующие переменные:**
* Замена переменной i (C code) во всех циклах на регистр r12d (или на r13d, т.к. r12d используется уже в другом месте тоже для переменной цикла i)
* Замена переменной count (C code) в некоторых местах на регистр r13d
* Замена переменной result (C code) в функции на регистр r14d

### Итог:
* Использованы регистры для некоторых переменных в assembler
* Проведены [тестовые прогоны](https://github.com/Grisha1232/ABC_HW2/blob/abb6343a33c955feffcfc2398663a29da59c0825/Assembler/Tests/test.md) для подтверждения, что программа работает идентично C коду

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
* Проведены [тесты с файлами](https://github.com/Grisha1232/ABC_HW2/blob/3586a7aec56af62b878b0b77b9ab3294f7275781/Assembler/Tests/testWithFilesInputOutput.md), которые показали идентичную работу

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
> Из тестов по замеру времени видно, что ассемблерная программа работает на целую секунду быстрее C кода

## Отчет на 9 баллов:
> Проведены замеры времени не модифицированой ассемблерной программой, модифицированной и C code.  
> Для тестов были использованы:
> * одинаковые размеры строки (999 символов)
> * 800000 раз повторений функции подсчета количество знаков препинания


