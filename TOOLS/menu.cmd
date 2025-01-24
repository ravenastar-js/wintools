@echo off
color 0A

rem Verifica se o script esta sendo executado como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo Solicitando permissao de administrador...
    goto elevate
) else (
    chcp 65001
    goto runScript
)

:elevate
rem Reexecuta o script com permissoes de administrador
cd /d "%~dp0"
powershell -Command "Start-Process '%~s0' -Verb RunAs"
exit /b

:runScript
rem Muda para o diretorio correto
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
echo [ 1 ] Reiniciar para BIOS (UEFI)                  [ 17 ] Verificar arquivos de sistema
echo [ 2 ] Reiniciar normalmente                       [ 18 ] Abrir Visualizador de Eventos
echo [ 3 ] Desligar o PC                               [ 19 ] Abrir Quick Launch
echo [ 4 ] Iniciar Gerenciador de Tarefas              [ 20 ] Criar Quick Launch
echo [ 5 ] Bloquear a tela                             [ 21 ] Desinstalar ou alterar um programa
echo [ 6 ] Abrir a pasta de aplicativos                [ 22 ] Conexões de Rede
echo [ 7 ] Gerenciamento de Disco                      [ 23 ] Mostrar o cache DNS
echo [ 8 ] Abrir God Mode                              [ 24 ] Limpar o cache DNS
echo [ 9 ] Limpar arquivos temporários                [ 25 ] Abrir aba DNS navegador Firefox
echo [ 10 ] Abrir Pasta Lixeira                        [ 26 ] Abrir aba DNS navegador Google
echo [ 11 ] Habilitar F8                               [ 27 ] Teclas de atalho do Windows
echo [ 12 ] Desabilitar F8                             [ 28 ] Curso gratuito Windows Rápido e Seguro 2.0
echo [ 13 ] Criar ponto de restauração               [ 29 ] Flash USB inicializáveis (softwares)
echo [ 14 ] Habilitar ponto de restauração ilimitado [ 30 ] Ativar Suporte à PVM para usar o WSL
echo [ 15 ] Exibir informações do sistema            [ 31 ] Desativar Suporte à PVM (caso necessário)
echo [ 16 ] Configurar início do sistema (msconfig)   
echo [0m
echo [ [97mG[0m ] [97mAcessar Codigo Fonte no GitHub[0m
echo [ [91mE[0m ] [91mSair - Sai do script.[32m
echo ==================================================
set /p choice=Digite a sua escolha (1-31, G ou E):[93m 

if /i "%choice%"=="1" goto reboot_bios
if /i "%choice%"=="2" goto reboot_normal
if /i "%choice%"=="3" goto shutdown
if /i "%choice%"=="4" goto task_manager
if /i "%choice%"=="5" goto lock_screen
if /i "%choice%"=="6" goto open_appsfolder
if /i "%choice%"=="7" goto open_gd
if /i "%choice%"=="8" goto open_godmode
if /i "%choice%"=="9" goto clean_temp_files
if /i "%choice%"=="10" goto open_lixeira
if /i "%choice%"=="11" goto enable_f8
if /i "%choice%"=="12" goto disable_f8
if /i "%choice%"=="13" goto create_restore_point
if /i "%choice%"=="14" goto enable_unlimited_restore_points
if /i "%choice%"=="15" goto system_info
if /i "%choice%"=="16" goto msconfig
if /i "%choice%"=="17" goto sfc_scan
if /i "%choice%"=="18" goto event_viewer
if /i "%choice%"=="19" goto open_quicklaunch
if /i "%choice%"=="20" goto create_quicklaunch
if /i "%choice%"=="21" goto uninstall_programs
if /i "%choice%"=="22" goto conexoes_redes
if /i "%choice%"=="23" goto display_dns
if /i "%choice%"=="24" goto flush_dns
if /i "%choice%"=="25" goto firefox_dns
if /i "%choice%"=="26" goto chrome_dns
if /i "%choice%"=="27" goto windows_keys
if /i "%choice%"=="28" goto wrs_2
if /i "%choice%"=="29" goto usb_boot_tools
if /i "%choice%"=="30" goto a_vm
if /i "%choice%"=="31" goto d_vm
if /i "%choice%"=="G" goto github
if /i "%choice%"=="E" goto exit
goto invalid_choice

: reboot_bios
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\reboot_bios.cmd' -Verb RunAs"
pause
goto menu

: reboot_normal
echo [0m
cmd /c %~dp0cmd\reboot_normal.cmd
pause
goto menu

: shutdown
echo [0m
cmd /c %~dp0cmd\shutdown.cmd
pause
goto menu

: task_manager
echo [0m
cmd /c %~dp0cmd\task_manager.cmd
pause
goto menu

: lock_screen
echo [0m
cmd /c %~dp0cmd\lock_screen.cmd
pause
goto menu

: open_appsfolder
echo [0m
cmd /c %~dp0cmd\open_appsfolder.cmd
pause
goto menu

: open_gd
echo [0m
cmd /c %~dp0cmd\open_gd.cmd
pause
goto menu

: open_godmode
echo [0m
cmd /c %~dp0cmd\open_godmode.cmd
pause
goto menu

: clean_temp_files
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\clean_temp_files.cmd' -Verb RunAs"
pause
goto menu

: open_lixeira
echo [0m
cmd /c %~dp0cmd\open_lixeira.cmd
pause
goto menu

: enable_f8
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\enable_f8.cmd' -Verb RunAs"
pause
goto menu

: disable_f8
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\disable_f8.cmd' -Verb RunAs"
pause
goto menu

: create_restore_point
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\create_restore_point.cmd' -Verb RunAs"
pause
goto menu

: enable_unlimited_restore_points
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\enable_unlimited_restore_points.cmd' -Verb RunAs"
pause
goto menu

: system_info
echo [0m
cmd /c %~dp0cmd\system_info.cmd
pause
goto menu

: msconfig
echo [0m
cmd /c %~dp0cmd\msconfig.cmd
pause
goto menu

: sfc_scan
echo [0m
cmd /c sfc /scannow
pause
goto menu

: event_viewer
echo [0m
cmd /c %~dp0cmd\event_viewer.cmd
pause
goto menu

: open_quicklaunch
echo [0m
start explorer "%appdata%\Microsoft\Internet Explorer\Quick Launch"
pause
goto menu

: create_quicklaunch
echo [0m
cmd /c %~dp0cmd\create_quicklaunch.cmd
pause
goto menu

: uninstall_programs
echo [0m
cmd /c %~dp0cmd\uninstall_programs.cmd
pause
goto menu

: conexoes_redes
echo [0m
cmd /c %~dp0cmd\conexoes_redes.cmd
pause
goto menu

: display_dns
echo [0m
cmd /c %~dp0cmd\display_dns.cmd
pause
goto menu

: flush_dns
echo [0m
cmd /c %~dp0cmd\flush_dns.cmd
pause
goto menu

: firefox_dns
echo [0m
cmd /c %~dp0cmd\firefox_dns.cmd
pause
goto menu

: chrome_dns
echo [0m
cmd /c %~dp0cmd\chrome_dns.cmd
pause
goto menu

: windows_keys
echo [0m
cmd /c %~dp0cmd\windows_keys.cmd
pause
goto menu

: wrs_2
echo [0m
cmd /c %~dp0cmd\wrs_2.cmd
pause
goto menu

: usb_boot_tools
echo [0m
cmd /c %~dp0cmd\usb_boot_tools.cmd
pause
goto menu

: a_vm
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\a_vm.cmd' -Verb RunAs"
pause
goto menu

: d_vm
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\d_vm.cmd' -Verb RunAs"
pause
goto menu

:github
echo [0m
start https://github.com/ravenastar-js/wintools
pause
goto menu

:exit
exit
:invalid_choice
powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Escolher entre 1 a 31, G ou E.', 'Erro', 'OK', 'Error')}"
pause
goto menu
