@echo off
set tempDir=%TEMP%\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}
if exist "%tempDir%" (
    echo A pasta existe. Abrindo...
    explorer "%tempDir%"
) else (
    echo Criando a pasta God Mode...
    mkdir "%tempDir%"
    explorer "%tempDir%"
)
exit /b
