@echo off
setlocal

rem Caminho do log
set "logPath=%USERPROFILE%\Desktop\eventos_seguranca_log.txt"

where powershell >nul 2>&1
if errorlevel 1 (
    echo ❌ PowerShell não está disponível neste sistema.
    pause
    exit /b
)

rem Executa PowerShell com eventos modernos
powershell -ExecutionPolicy Bypass -Command ^
"$eventIDs = @(4624,4625,4648,4688,4720,4722,4723,4724,4725,4726,1102); ^
$startTime = (Get-Date).AddDays(-7); ^
$logPath = '%logPath%'; ^
$logs = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=$eventIDs; StartTime=$startTime}; ^
foreach ($log in $logs) { ^
    $entry = \"[$($log.TimeCreated)] Evento $($log.Id): $($log.Message)\"; ^
    Add-Content -Path $logPath -Value $entry ^
}; ^
Write-Host 'Monitoramento concluído. Log salvo em:' $logPath; ^
Write-Host 'Total de eventos encontrados:' $logs.Count"

rem Abre o arquivo de log automaticamente
start "" "%logPath%"

pause
endlocal
