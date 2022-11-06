# Тестовые прогоны после рефакторинга ассемблера с использованием регистров
Для подтверждения, что программы работают идентично

## Test 1
Входные данные:
```
asdfl;kjasdf;lkjasdf;lkj
```
* C code:![image](https://user-images.githubusercontent.com/58052549/200172643-147dd1fd-5a14-453b-a4cb-31e14ea7e6a4.png)
* Assembler:![image](https://user-images.githubusercontent.com/58052549/200172621-4f582b97-18f2-4af6-b97d-d343cfdc8c34.png)


## Test 2
Входные данные:
```
,./;'"!?asd()[]{}
```
* C code:![image](https://user-images.githubusercontent.com/58052549/200172659-981aef9b-f403-4f08-b48c-359a7765ca26.png)
* Assembler:![image](https://user-images.githubusercontent.com/58052549/200172668-95336d7d-31fe-4388-b5eb-c6fd4d517327.png)

## Test 3
Входные данные:
```
123123123123
```
* C code:![image](https://user-images.githubusercontent.com/58052549/200172691-240579e1-8518-4b5c-b2c1-90d8e830ebe2.png)
* Assembler:![image](https://user-images.githubusercontent.com/58052549/200172679-becdd2ed-70fb-45cc-8cd3-c24456dd0cf5.png)
