@echo off
setlocal

rem Definir cores
set color_red=0C
set color_green=0A
set color_yellow=0E

rem Verifica se o script está sendo executado como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    color %color_red%
    echo Solicitando permissao de administrador...
    goto :elevate
) else (
    goto :runScript
)

:elevate
rem Reexecuta o script com permissões de administrador
cd /d "%~dp0"
powershell -Command "Start-Process '%~s0' -Verb RunAs"
exit /b

:runScript
rem Muda para o diretório correto
cd /d "%~dp0"

rem Define o caminho para os arquivos .js
set scriptPath1=%~dp0TOOLS\js\atalhos.js
set scriptPath2=%~dp0TOOLS\js\menu.js

rem Verifica se os arquivos existem
if not exist "%scriptPath1%" (
    color %color_red%
    echo Arquivo %scriptPath1% nao encontrado.
    pause
    exit /b
)

if not exist "%scriptPath2%" (
    color %color_red%
    echo Arquivo %scriptPath2% nao encontrado.
    pause
    exit /b
)

rem Executa os js que fica dentro da pasta TOOLS
cscript //nologo "%scriptPath1%"
cscript //nologo "%scriptPath2%"

rem Exibir mensagem de sucesso e fechar a tela preta
cscript //nologo %~dp0TOOLS\js\s_message.js

endlocal
exit /b
