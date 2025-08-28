@echo off
chcp 65001 > nul
color 0A

rem Verifica se o script está sendo executado como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo Solicitando permissão de administrador...
    goto elevate
) else (
    chcp 65001
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
echo [93m         github.com/ravenastar-js/wintools[32m
echo.
echo ==================================================
echo.
echo [ 1 ] [94m◙[32m Reiniciar o dispositivo para BIOS (UEFI)
echo [ 2 ] [94m◙[32m Habilitar F8
echo [ 3 ] [94m◙[32m Desabilitar F8
echo [ 4 ] [94m◙[32m Criar ponto de restauração
echo [ 5 ] [94m◙[32m Habilitar ponto de restauração ilimitado
echo [ 6 ] [94m◙[32m Limpar arquivos temporários
echo [ 7 ] [94m◙[32m Verificar arquivos de sistema
echo [ 8 ] [94m◙[32m Gerenciar contas de usuário
echo [ 9 ] [94m◙[32m Reiniciar o dispositivo normalmente
echo [ 10 ] [94m◙[32m Desligar o dispositivo
echo [ 11 ] [94m◙[32m Bloquear a tela
echo [ 12 ] [94m◙[32m Iniciar Gerenciador de Tarefas
echo [ 13 ] [94m◙[32m Gerenciamento de Disco
echo [ 14 ] [94m◙[32m Abrir God Mode
echo [ 15 ] [94m◙[32m Abrir Pasta Lixeira
echo [ 16 ] [94m◙[32m Exibir informações do sistema
echo [ 17 ] [94m◙[32m Configurar início do sistema (msconfig)
echo [ 18 ] [94m◙[32m Abrir Visualizador de Eventos
echo [ 19 ] [94m◙[32m Desinstalar ou alterar um programa
echo [ 20 ] [94m◙[32m Ativar ou desativar recursos do Windows
echo [ 21 ] [94m◙[32m Auditoria de Eventos de Segurança do Windows (Últimas 168h)
echo [ 22 ] [94m◙[32m Abrir Histórico de Atualizações do Windows
echo [ 23 ] [94m◙[32m Conexões de Rede
echo [ 24 ] [94m◙[32m Mostrar o cache DNS
echo [ 25 ] [94m◙[32m Limpar o cache DNS
echo [ 26 ] [94m◙[32m Abrir aba DNS navegador Firefox
echo [ 27 ] [94m◙[32m Abrir aba DNS navegador Google
echo [ 28 ] [94m◙[32m Abrir a pasta de aplicativos
echo [ 29 ] [94m◙[32m Abrir Quick Launch
echo [ 30 ] [94m◙[32m Ativar Suporte à PVM para usar o WSL
echo [ 31 ] [94m◙[32m Desativar Suporte à PVM (caso necessário)
echo [ 32 ] [37m◙[32m Verificação do HD/SSD
echo [ 33 ] [37m◙[32m Corrigindo arquivos do Windows
echo [ 34 ] [37m◙[32m Arquivos temporários
echo [ 35 ] [37m◙[32m Remoção de Bloatwares e programas indesejados
echo [ 36 ] [37m◙[32m Instalar o Windows 11 com Conta Local (sem conexão obrigatória)
echo [ 37 ] [37m◙[32m Configurações Importantes na BIOS/UEFI
echo [ 38 ] [37m◙[32m Criar Quick Launch
echo [ 39 ] [37m◙[32m Teclas de atalho do Windows
echo [ 40 ] [37m◙[32m Curso gratuito Windows Rápido e Seguro 2.0
echo [ 41 ] [37m◙[32m Flash USB inicializáveis (softwares)
echo [ 42 ] [37m◙[32m MBR Filter
echo [ 43 ] [37m◙[32m Instalação do Kali Linux no Windows via WSL
echo [ 44 ] [37m◙[32m Monitoramento de Segurança com o Visualizador de Eventos
echo [ 45 ] [37m◙[32m Ativação do Super God Mode
echo [ 46 ] [37m◙[32m MRT vs Antivírus no Windows
echo [0m
echo [94m ◙ COMANDO [37m ◙ GUIA[0m 
echo.
echo [ [97mG[0m ] [97mAcessar Código Fonte no GitHub[0m
echo [ [91mE[0m ] [91mSair - Sai do script.[32m
echo ==================================================
set /p choice=Digite a sua escolha (1-46, G ou E):[93m 

if /i "%choice%"=="1" goto reboot_bios
if /i "%choice%"=="2" goto enable_f8
if /i "%choice%"=="3" goto disable_f8
if /i "%choice%"=="4" goto create_restore_point
if /i "%choice%"=="5" goto enable_unlimited_restore_points
if /i "%choice%"=="6" goto clean_temp_files
if /i "%choice%"=="7" goto sfc_scan
if /i "%choice%"=="8" goto open_guser
if /i "%choice%"=="9" goto reboot_normal
if /i "%choice%"=="10" goto shutdown
if /i "%choice%"=="11" goto lock_screen
if /i "%choice%"=="12" goto task_manager
if /i "%choice%"=="13" goto open_gd
if /i "%choice%"=="14" goto open_godmode
if /i "%choice%"=="15" goto open_lixeira
if /i "%choice%"=="16" goto system_info
if /i "%choice%"=="17" goto msconfig
if /i "%choice%"=="18" goto event_viewer
if /i "%choice%"=="19" goto uninstall_programs
if /i "%choice%"=="20" goto open_optwin
if /i "%choice%"=="21" goto monitor_eventos
if /i "%choice%"=="22" goto winupdate_history
if /i "%choice%"=="23" goto conexoes_redes
if /i "%choice%"=="24" goto display_dns
if /i "%choice%"=="25" goto flush_dns
if /i "%choice%"=="26" goto firefox_dns
if /i "%choice%"=="27" goto chrome_dns
if /i "%choice%"=="28" goto open_appsfolder
if /i "%choice%"=="29" goto open_quicklaunch
if /i "%choice%"=="30" goto a_vm
if /i "%choice%"=="31" goto d_vm
if /i "%choice%"=="32" goto v_armazen
if /i "%choice%"=="33" goto win_chkdsk
if /i "%choice%"=="34" goto temp_files
if /i "%choice%"=="35" goto r_bloatwares
if /i "%choice%"=="36" goto win11_cl
if /i "%choice%"=="37" goto config_bios
if /i "%choice%"=="38" goto create_quicklaunch
if /i "%choice%"=="39" goto windows_keys
if /i "%choice%"=="40" goto wrs_2
if /i "%choice%"=="41" goto usb_boot_tools
if /i "%choice%"=="42" goto mbr_filter
if /i "%choice%"=="43" goto win_wsl
if /i "%choice%"=="44" goto v_eventos
if /i "%choice%"=="45" goto super_godmode
if /i "%choice%"=="46" goto win_MRT
if /i "%choice%"=="G" goto github
if /i "%choice%"=="E" goto exit
goto invalid_choice

:reboot_bios
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\reboot_bios.cmd' -Verb RunAs"
pause
goto menu

:enable_f8
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\enable_f8.cmd' -Verb RunAs"
pause
goto menu

:disable_f8
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\disable_f8.cmd' -Verb RunAs"
pause
goto menu

:create_restore_point
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\create_restore_point.cmd' -Verb RunAs"
pause
goto menu

:enable_unlimited_restore_points
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\enable_unlimited_restore_points.cmd' -Verb RunAs"
pause
goto menu

:clean_temp_files
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\clean_temp_files.cmd' -Verb RunAs"
pause
goto menu

:sfc_scan
echo [0m
cmd /c sfc /scannow
pause
goto menu

:open_guser
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\open_guser.cmd' -Verb RunAs"
pause
goto menu

:reboot_normal
echo [0m
cmd /c %~dp0cmd\reboot_normal.cmd
pause
goto menu

:shutdown
echo [0m
cmd /c %~dp0cmd\shutdown.cmd
pause
goto menu

:lock_screen
echo [0m
cmd /c %~dp0cmd\lock_screen.cmd
pause
goto menu

:task_manager
echo [0m
cmd /c %~dp0cmd\task_manager.cmd
pause
goto menu

:open_gd
echo [0m
cmd /c %~dp0cmd\open_gd.cmd
pause
goto menu

:open_godmode
echo [0m
cmd /c %~dp0cmd\open_godmode.cmd
pause
goto menu

:open_lixeira
echo [0m
cmd /c %~dp0cmd\open_lixeira.cmd
pause
goto menu

:system_info
echo [0m
cmd /c %~dp0cmd\system_info.cmd
pause
goto menu

:msconfig
echo [0m
cmd /c %~dp0cmd\msconfig.cmd
pause
goto menu

:event_viewer
echo [0m
cmd /c %~dp0cmd\event_viewer.cmd
pause
goto menu

:uninstall_programs
echo [0m
cmd /c %~dp0cmd\uninstall_programs.cmd
pause
goto menu

:open_optwin
echo [0m
cmd /c %~dp0cmd\open_optwin.cmd
pause
goto menu

:monitor_eventos
echo [0m
cmd /c %~dp0cmd\monitor_eventos.cmd
pause
goto menu

:winupdate_history
echo [0m
cmd /c %~dp0cmd\winupdate_history.cmd
pause
goto menu

:conexoes_redes
echo [0m
cmd /c %~dp0cmd\conexoes_redes.cmd
pause
goto menu

:display_dns
echo [0m
cmd /c %~dp0cmd\display_dns.cmd
pause
goto menu

:flush_dns
echo [0m
cmd /c %~dp0cmd\flush_dns.cmd
pause
goto menu

:firefox_dns
echo [0m
cmd /c %~dp0cmd\firefox_dns.cmd
pause
goto menu

:chrome_dns
echo [0m
cmd /c %~dp0cmd\chrome_dns.cmd
pause
goto menu

:open_appsfolder
echo [0m
cmd /c %~dp0cmd\open_appsfolder.cmd
pause
goto menu

:open_quicklaunch
echo [0m
start explorer "%appdata%\Microsoft\Internet Explorer\Quick Launch"
pause
goto menu

:a_vm
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\a_vm.cmd' -Verb RunAs"
pause
goto menu

:d_vm
echo [0m
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\d_vm.cmd' -Verb RunAs"
pause
goto menu

:v_armazen
echo [0m
cmd /c start "" "%~dp0docs\v_armazen.txt"
pause
goto menu

:win_chkdsk
echo [0m
cmd /c start "" "%~dp0docs\win_chkdsk.txt"
pause
goto menu

:temp_files
echo [0m
cmd /c start "" "%~dp0docs\temp_files.txt"
pause
goto menu

:r_bloatwares
echo [0m
cmd /c start "" "%~dp0docs\r_bloatwares.txt"
pause
goto menu

:win11_cl
echo [0m
cmd /c start "" "%~dp0docs\win11_cl.txt"
pause
goto menu

:config_bios
echo [0m
cmd /c start "" "%~dp0docs\config_bios.txt"
pause
goto menu

:create_quicklaunch
echo [0m
cmd /c start "" "%~dp0docs\create_quicklaunch.txt"
pause
goto menu

:windows_keys
echo [0m
cmd /c start "" "%~dp0docs\windows_keys.txt"
pause
goto menu

:wrs_2
echo [0m
cmd /c start "" "%~dp0docs\wrs_2.txt"
pause
goto menu

:usb_boot_tools
echo [0m
cmd /c start "" "%~dp0docs\usb_boot_tools.txt"
pause
goto menu

:mbr_filter
echo [0m
cmd /c start "" "%~dp0docs\mbr_filter.txt"
pause
goto menu

:win_wsl
echo [0m
cmd /c start "" "%~dp0docs\win_wsl.txt"
pause
goto menu

:v_eventos
echo [0m
cmd /c start "" "%~dp0docs\v_eventos.txt"
pause
goto menu

:super_godmode
echo [0m
cmd /c start "" "%~dp0docs\super_godmode.txt"
pause
goto menu

:win_MRT
echo [0m
cmd /c start "" "%~dp0docs\win_MRT.txt"
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
powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Escolher entre 1 a 46, ou E.', 'Erro', 'OK', 'Error')}"
pause
goto menu
