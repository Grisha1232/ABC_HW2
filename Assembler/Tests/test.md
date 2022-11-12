# Тестовые прогоны после рефакторинга ассемблера с использованием регистров
Для подтверждения, что программы работают идентично

## Test 1
Входные данные:
```
asdfl;kjasdf;lkjasdf;lkj
```
* C code: ![image](https://user-images.githubusercontent.com/58052549/200172643-147dd1fd-5a14-453b-a4cb-31e14ea7e6a4.png)
* Assembler: ![image](https://user-images.githubusercontent.com/58052549/201476433-40b7f5ba-12db-4de0-b935-cea836a4e2a0.png)


## Test 2
Входные данные:
```
,./;'"!?asd()[]{}
```
* C code: ![image](https://user-images.githubusercontent.com/58052549/200172659-981aef9b-f403-4f08-b48c-359a7765ca26.png)
* Assembler: ![image](https://user-images.githubusercontent.com/58052549/201476452-70414a96-8de0-4c84-b6dc-c5a3a206f37b.png)


## Test 3
Входные данные:
```
123123123123
```
* C code: ![image](https://user-images.githubusercontent.com/58052549/200172691-240579e1-8518-4b5c-b2c1-90d8e830ebe2.png)
* Assembler: ![image](https://user-images.githubusercontent.com/58052549/201476468-e707ee49-4d47-4eb6-a238-7bd93ebd6555.png)
