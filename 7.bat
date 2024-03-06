:: 7.1

:: Отключение вывода команд на экран.
@echo off

:: ~ - удаляет кавычки, если они есть.
:: "" нам нужно, чтобы не было ошибки, если путь содержит пробелы
:: да и вообще, это хороший тон, всегда заключать переменные в кавычки.
set "dir=%~1"

:: Если ничего не передано в качестве аргумента, то завершаем скрипт
:: , а /b нужно, чтобы exit не завершил весь терминал, а только наш скрипт
if "%dir%"=="" (
    exit /b 1
)

set "count=0"
:: Это цикл for, который выполняется для каждого элемента, 
:: список которых вернет команда в скобках.
:: dir возращает список файлов и папок в указанной %dir% директории.
:: /ad-h - показывать только папки, которые не скрыты ( /a это начало параметров
:: d - показывать только папки, -h - показывать только нескрытые элементы).
:: 2^>nul: это перенаправление ошибок (поток вывода номер 2) в nul(специальное программное место для такого),
:: если они возникнут.
for /f %%i in ('dir /b /ad-h "%dir%" 2^>nul') do (
    set /a "count+=1"
)

echo %count%

:: 7.2
set "dir=%~1"
if "%dir%"=="" (
    exit /b 1
)

set "cnt=0"

:: Это цикл for, который выполняется для каждого файла с расширением 
:: .sys в указанном каталоге и всех его подкаталогах.
:: /r "%dir%": ключ /r говорит циклу for обходить каталог рекурсивно, т.е. включая все подкаталоги. 
:: "%dir%" - это переменная, содержащая путь к каталогу, который нужно обойти.
:: %%f - это переменная, которая будет содержать имя и путь к файлу.
:: (*.sys) - это маска, которая говорит, что нужно обойти все файлы с расширением .sys.
:: echo %%f - выводит путь к файлу в консоль.
:: set /a "cnt+=1" - увеличивает значение переменной cnt на 1 (/a - обозначает арифметическую операцию).
for /r "%dir%" %%f in (*.sys) do (
    echo %%f
    set /a "cnt+=1"
)

echo %cnt%