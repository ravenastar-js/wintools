@echo off
color 0A

rem Verifica se o script está sendo executado como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo Solicitando permissao de administrador...
    goto elevate
) else (
    goto runScript
)

:elevate
rem Reexecuta o script com permissões de administrador
cd /d "%~dp0"
powershell -Command "Start-Process '%~s0' -Verb RunAs"
exit /b

:runScript
rem Muda para o diretório correto
cd /d "%~dp0"

:menu
cls
color 0A
echo ==================================================
echo.
echo          github.com/ravenastar-js/wintools
echo.
echo ==================================================
echo.
echo [ 1 ] Reiniciar para BIOS (UEFI)
echo [ 2 ] Reiniciar normalmente
echo [ 3 ] Desligar o PC
echo [ 4 ] Iniciar Gerenciador de Tarefas
echo [ 5 ] Bloquear a Tela
echo [ 6 ] Abrir a pasta de Aplicativos
echo [ 7 ] Abrir God Mode
echo [ 8 ] Limpar Arquivos Temporarios
echo [ 9 ] Habilitar F8
echo [ 10 ] Desabilitar F8
echo [ 11 ] Criar Ponto de Restauracao
echo [ 12 ] Habilitar Ponto de Restauracao Ilimitado
echo [ 13 ] Exibir Informacoes do Sistema
echo [ 14 ] Verificar e Reparar Disco
echo [ 15 ] Configurar Inicio do Sistema (msconfig)
echo [ 16 ] Verificar Arquivos de Sistema
echo [ 17 ] Abrir Visualizador de Eventos
echo [ 18 ] Abrir Quick Launch
echo [ 19 ] Criar Quick Launch
echo [0m
echo [ [97mG[0m ] [97mAcessar Codigo Fonte no GitHub[0m
echo [ [93mH[0m ] [93mAjuda - Exibe tela de ajuda.[0m
echo [ [91mE[0m ] [91mSair - Sai do script.[32m
echo ==================================================
set /p choice=Digite a sua escolha (1-19, H, E, ou G):[0m

if /i "%choice%"=="1" goto reboot_bios
if /i "%choice%"=="2" goto reboot_normal
if /i "%choice%"=="3" goto shutdown
if /i "%choice%"=="4" goto task_manager
if /i "%choice%"=="5" goto lock_screen
if /i "%choice%"=="6" goto open_appsfolder
if /i "%choice%"=="7" goto open_godmode
if /i "%choice%"=="8" goto clean_temp
if /i "%choice%"=="9" goto enable_f8
if /i "%choice%"=="10" goto disable_f8
if /i "%choice%"=="11" goto create_restore_point
if /i "%choice%"=="12" goto enable_unlimited_restore_points
if /i "%choice%"=="13" goto system_info
if /i "%choice%"=="14" goto check_disk
if /i "%choice%"=="15" goto msconfig
if /i "%choice%"=="16" goto sfc_scan
if /i "%choice%"=="17" goto event_viewer
if /i "%choice%"=="18" goto open_quicklaunch
if /i "%choice%"=="19" goto create_quicklaunch
if /i "%choice%"=="G" goto github
if /i "%choice%"=="H" goto help
if /i "%choice%"=="E" goto exit
goto invalid_choice

:reboot_bios
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\reboot_bios.cmd' -Verb RunAs"
pause
goto menu

:reboot_normal
cmd /c %~dp0cmd\reboot_normal.cmd
pause
goto menu

:shutdown
cmd /c %~dp0cmd\shutdown.cmd
pause
goto menu

:task_manager
cmd /c %~dp0cmd\task_manager.cmd
pause
goto menu

:lock_screen
cmd /c %~dp0cmd\lock_screen.cmd
pause
goto menu

:open_appsfolder
cmd /c %~dp0cmd\open_appsfolder.cmd
pause
goto menu

:open_godmode
cmd /c %~dp0cmd\open_godmode.cmd
pause
goto menu

:clean_temp
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\clean_temp_files.cmd' -Verb RunAs"
pause
goto menu

:enable_f8
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\enable_f8.cmd' -Verb RunAs"
pause
goto menu

:disable_f8
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\disable_f8.cmd' -Verb RunAs"
pause
goto menu

:create_restore_point
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\create_restore_point.cmd' -Verb RunAs"
pause
goto menu

:enable_unlimited_restore_points
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\enable_unlimited_restore_points.cmd' -Verb RunAs"
pause
goto menu

:system_info
cmd /c %~dp0cmd\system_info.cmd
pause
goto menu

:check_disk
cmd /c sfc /scannow
pause
goto menu

:msconfig
cmd /c %~dp0cmd\msconfig.cmd
pause
goto menu

:sfc_scan
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\sfc_scan.cmd' -Verb RunAs"
pause
goto menu

:event_viewer
cmd /c %~dp0cmd\event_viewer.cmd
pause
goto menu

:open_quicklaunch
start explorer "%appdata%\Microsoft\Internet Explorer\Quick Launch"
pause
goto menu

:create_quicklaunch
cmd /c %~dp0cmd\create_quicklaunch.cmd
pause
goto menu

:github
start https://github.com/ravenastar-js/wintools
pause
goto menu

:help
cls
color 0E
echo Ajuda:
echo [ 1 ] Reiniciar para BIOS (UEFI)
echo [ 2 ] Reiniciar normalmente
echo [ 3 ] Desligar o PC
echo [ 4 ] Iniciar Gerenciador de Tarefas
echo [ 5 ] Bloquear a Tela
echo [ 6 ] Abrir a pasta de Aplicativos
echo [ 7 ] Abrir God Mode
echo [ 8 ] Limpar Arquivos Temporarios
echo [ 9 ] Habilitar F8
echo [ 10 ] Desabilitar F8
echo [ 11 ] Criar Ponto de Restauracao
echo [ 12 ] Habilitar Ponto de Restauracao Ilimitado
echo [ 13 ] Exibir Informacoes do Sistema
echo [ 14 ] Verificar e Reparar Disco
echo [ 15 ] Configurar Inicio do Sistema (msconfig)
echo [ 16 ] Verificar Arquivos de Sistema
echo [ 17 ] Abrir Visualizador de Eventos
echo [ 18 ] Abrir Quick Launch
echo [ 19 ] Criar Quick Launch
echo [ G ] Acessar Codigo Fonte no GitHub
echo [ H ] Ajuda - Exibe esta tela de ajuda.
echo [ E ] Sai do script.
color 0E
pause
color 0A
goto menu

:exit
exit
:invalid_choice
powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Escolher entre 1 a 19, H, E, ou G.', 'Erro', 'OK', 'Error')}"
pause
goto menu
