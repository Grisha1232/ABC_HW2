# Тестовые прогоны после рефакторинга ассемблера с использованием регистров
Для подтверждения, что программы работают идентично

## Test 1
Входные данные:
```
asdfl;kjasdf;lkjasdf;lkj
```
* C code: ![image](https://user-images.githubusercontent.com/58052549/201476481-dd48d7f9-3d33-46ba-bc98-8316b7ea5f1e.png)
* Assembler: ![image](https://user-images.githubusercontent.com/58052549/201476433-40b7f5ba-12db-4de0-b935-cea836a4e2a0.png)


## Test 2
Входные данные:
```
,./;'"!?asd()[]{}
```
* C code: ![image](https://user-images.githubusercontent.com/58052549/201476493-6c249deb-a800-4816-bc56-02976ba6faf2.png)
* Assembler: ![image](https://user-images.githubusercontent.com/58052549/201476452-70414a96-8de0-4c84-b6dc-c5a3a206f37b.png)


## Test 3
Входные данные:
```
123123123123
```
* C code: ![image](https://user-images.githubusercontent.com/58052549/201476502-5ad9dd18-63f2-4789-b620-64f938167156.png)
* Assembler: ![image](https://user-images.githubusercontent.com/58052549/201476468-e707ee49-4d47-4eb6-a238-7bd93ebd6555.png)
