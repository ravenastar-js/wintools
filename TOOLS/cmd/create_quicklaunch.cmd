@echo off
setlocal

:: Path to Quick Launch
set quickLaunchPath=%APPDATA%\Microsoft\Internet Explorer\Quick Launch
echo %quickLaunchPath% | clip

:: Create temporary instructions file
set instructionsFile=%TEMP%\quick_launch_instructions.txt
(
echo Para adicionar a Quick Launch à barra de ferramentas:
echo.
echo 1. Clique com o botão direito na barra de tarefas.
echo 2. Selecione "Barra de ferramentas".
echo 3. Clique em "Nova barra de ferramentas...".
echo 4. Cole o caminho copiado: "%%APPDATA%%\Microsoft\Internet Explorer\Quick Launch" no campo de caminho.
echo 5. Clique em "Selecionar pasta".
) > "%instructionsFile%"

:: Open instructions file
start notepad "%instructionsFile%"

endlocal
