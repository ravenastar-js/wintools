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
    echo Solicitando perm de administrador...
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

rem Define o caminho para o arquivo create_shortcuts.js
set scriptPath=%~dp0scripts\CriarAtalhos.js

rem Verifica se o arquivo create_shortcuts.js existe
if not exist "%scriptPath%" (
    color %color_red%
    echo Arquivo %scriptPath% nao encontrado.
    pause
    exit /b
)

rem Executa o script JavaScript%
cscript //nologo "%scriptPath%"

color %color_green%
echo Atalhos criados com sucesso!
color %color_yellow%
echo ##########################################
echo #                                        #
echo #     AVISO IMPORTANTE                   #
echo #                                        #
echo #  Configure os atalhos para             #
echo #  "Executar como administrador".        #
echo #  Altere manualmente as propriedades    #
echo #  de cada atalho.                       #
echo #                                        #
echo ##########################################
color %color_green%
echo.
pause
endlocal
