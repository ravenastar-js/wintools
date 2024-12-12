@echo off
color 0A

:: Verifica se está sendo executado como administrador
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo Por favor, execute este script como administrador.
    pause
    exit /b
)

:menu
cls
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
echo [ 13 ] Acessar Codigo Fonte no GitHub
echo [ 14 ] Exibir Informacoes do Sistema
echo [ 15 ] Verificar e Reparar Disco
echo [ 16 ] Configurar Inicio do Sistema (msconfig)
echo [ 17 ] Verificar Arquivos de Sistema (sfc)
echo [ 18 ] Abrir Visualizador de Eventos
echo [0m
echo [ [93mH[0m ] [93mAjuda - Exibe esta tela de ajuda.[0m
echo [ [91mE[0m ] [91mSair - Sai do script.[32m
echo ==================================================
set /p choice=Digite a sua escolha (1-18, H ou E):

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
if /i "%choice%"=="13" goto github
if /i "%choice%"=="14" goto system_info
if /i "%choice%"=="15" goto check_disk
if /i "%choice%"=="16" goto msconfig
if /i "%choice%"=="17" goto sfc_scan
if /i "%choice%"=="18" goto event_viewer
if /i "%choice%"=="H" goto help
if /i "%choice%"=="E" goto exit
goto invalid_choice

:reboot_bios
cls
echo Detectando tipo de BIOS...
powershell -command "Confirm-SecureBootUEFI" | findstr "True"
if %errorlevel%==0 (
    msg * "Sistema UEFI detectado. Reiniciando para BIOS..."
    shutdown /r /fw /t 0
) else (
    powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Sistema BIOS legado detectado. Reinicializacao direta para BIOS nao suportada.', 'Erro', 'OK', 'Error')}"
)
pause
goto menu

:reboot_normal
shutdown /r /t 0
pause
goto menu

:shutdown
shutdown /s /t 0
pause
goto menu

:task_manager
start taskmgr
pause
goto menu

:lock_screen
rundll32.exe user32.dll,LockWorkStation
pause
goto menu

:open_appsfolder
explorer shell:appsfolder
pause
goto menu

:open_godmode
mkdir "%userprofile%\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
explorer "%userprofile%\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
pause
goto menu

:clean_temp
cd %~dp0..\..\..
powershell -command "Start-Process cmd.exe -ArgumentList '/c %~dp0cmd\clean_temp_files.cmd' -Verb RunAs"
pause
goto menu

:enable_f8
bcdedit /set {default} bootmenupolicy legacy
pause
goto menu

:disable_f8
bcdedit /set {default} bootmenupolicy standard
pause
goto menu

:create_restore_point
Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Criado via atalho", 100, 7
pause
goto menu

:enable_unlimited_restore_points
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency >nul 2>&1
if %errorlevel%==0 (
    powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('A chave ja existe.', 'Aviso', 'OK', 'Warning')}"
) else (
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency /t REG_DWORD /d 0 /f
)
pause
goto menu

:github
start https://github.com/ravenastar-js/wintools
pause
goto menu

:system_info
systeminfo
pause
goto menu

:check_disk
chkdsk C: /F /R
pause
goto menu

:msconfig
start msconfig
pause
goto menu

:sfc_scan
sfc /scannow
pause
goto menu

:event_viewer
start eventvwr
pause
goto menu

:invalid_choice
powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Escolher entre 1 a 18, H ou S.', 'Erro', 'OK', 'Error')}"
pause
goto menu

:help
cls
color 0E
echo Ajuda:
echo [ 1 ] Reiniciar para BIOS (UEFI) - Reinicia o computador para o menu BIOS/UEFI.
echo [ 2 ] Reiniciar normalmente - Reinicia o computador normalmente.
echo [ 3 ] Desligar o PC - Desliga o computador.
echo [ 4 ] Iniciar Gerenciador de Tarefas - Abre o Gerenciador de Tarefas.
echo [ 5 ] Bloquear a Tela - Bloqueia a tela do computador.
echo [ 6 ] Abrir a pasta de Aplicativos - Abre a pasta de Aplicativos.
echo [ 7 ] Abrir God Mode - Cria e abre a pasta God Mode.
echo [ 8 ] Limpar Arquivos Temporarios - Limpa arquivos temporarios.
echo [ 9 ] Habilitar F8 - Habilita o menu F8 no boot.
echo [ 10 ] Desabilitar F8 - Desabilita o menu F8 no boot.
echo [ 11 ] Criar Ponto de Restauracao - Cria um ponto de restauracao do sistema.
echo [ 12 ] Habilitar Ponto de Restauracao Ilimitado - Habilita a criacao ilimitada de pontos de restauracao.
echo [ 13 ] Acessar Codigo Fonte no GitHub - Abre o repositorio no GitHub.
echo [ 14 ] Exibir Informacoes do Sistema - Exibe informacoes detalhadas do sistema.
echo [ 15 ] Verificar e Reparar Disco - Executa uma verificacao e reparo do disco.
echo [ 16 ] Configurar Inicio do Sistema - Abre as configuracoes de inicializacao do sistema (msconfig).
echo [ 17 ] Verificar Arquivos de Sistema - Verifica e repara arquivos de sistema corrompidos.
echo [ 18 ] Abrir Visualizador de Eventos - Abre o Visualizador de Eventos do Windows.
echo.
echo [ H ] Ajuda - Exibe esta tela de ajuda.
echo [ E ] Sai do script.
color 0E
pause
color 0A
goto menu

:exit
exit
