@echo off
setlocal

rem Definir cores
set color_red=0C
set color_green=0A

rem Verifica se o script está sendo executado como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    color %color_red%
    echo Soliciting permissões de administrador...
    goto :elevate
) else (
    goto :runScript
)

:elevate
rem Reexecuta o script com permissões de administrador
cd /d "%~dp0"
powershell Start-Process "%~s0" -Verb RunAs
exit /b

:runScript
rem Muda para o diretório correto
cd /d "%~dp0"

rem Define o caminho para o arquivo create_shortcuts.js
set scriptPath=%~dp0scripts\CriarAtalhos.js

rem Executa o script JavaScript
cscript //nologo "%scriptPath%"

color %color_green%
echo Atalhos criados com sucesso!
pause
endlocal
