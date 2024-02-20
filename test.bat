:: 6.1
@echo off
setlocal enabledelayedexpansion

set "dir=%~1"
if "%dir%"=="" (
    exit /b 1
)

set /a "count=0"
for /f %%i in ('dir /b /adh "%dir%" 2^>nul') do (
    set /a "count+=1"
)

echo Number of hidden directories in "%dir%" : %count%

echo Other method
dir /adh /b 2>nul "%dir%" | find /c /v "" 

endlocal


:: 6.2
setlocal enabledelayedexpansion

set "dir=%~1"
if "%dir%"=="" (
    exit /b 1
)

set /a "count=0"

for /r "%dir%" %%f in (*.txt) do (
    attrib "%%~dpf\." | findstr /i "h" >nul
    if errorlevel 1 (
        echo %%f
        set /a "count+=1"
    )
)

echo Number of .txt files: %count%

endlocal

:: 6.2 -- without recursive subdirectories
setlocal enabledelayedexpansion

set "dir=%~1"
if "%dir%"=="" (
    exit /b 1
)

set /a "count=0"

for %%f in ("%dir%\*.txt") do (
    echo %%f
    set /a "count+=1"
)

echo Number of .txt files in "%dir%": %count%

endlocal