@echo off
color 0A
echo Habilitando Ponto de Restauracao Ilimitados...
:: Habilitar Pontos de Restauração Ilimitados
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency >nul 2>&1
if %errorlevel%==0 (
    powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('A chave ja existe.', 'Aviso', 'OK', 'Warning')}"
    exit
) else (
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency /t REG_DWORD /d 0 /f
    exit
)