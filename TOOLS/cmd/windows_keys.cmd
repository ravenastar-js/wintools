@echo off
setlocal

:: Create temporary instructions file
set instructionsFile=%TEMP%\windows_keys.txt

:: Write the shortcut list to the instructions file
echo Atalhos com Tecla Win > "%instructionsFile%"
echo. >> "%instructionsFile%"
echo Mostrar área de trabalho: Win + D >> "%instructionsFile%"
echo Minimizar todas as janelas: Win + M >> "%instructionsFile%"
echo Restaurar janelas minimizadas: Win + Shift + M >> "%instructionsFile%"
echo Redimensionar e mover janelas: Win + Setas (↑ ↓ ← →) >> "%instructionsFile%"
echo Bloquear o computador: Win + L >> "%instructionsFile%"
echo Abrir o Explorador de Arquivos: Win + E >> "%instructionsFile%"
echo Abrir Configurações: Win + I >> "%instructionsFile%"
echo Abrir a busca: Win + S >> "%instructionsFile%"
echo Capturar a tela inteira e salvar como arquivo: Win + PrtScn >> "%instructionsFile%"
echo Capturar uma parte da tela: Win + Shift + S >> "%instructionsFile%"
echo Reiniciar a placa gráfica: Win + Ctrl + Shift + B >> "%instructionsFile%"
echo Abrir a Central de Ações: Win + A >> "%instructionsFile%"
echo Abrir a Barra de Notificações: Win + N >> "%instructionsFile%"
echo Abrir a Visão de Tarefas: Win + Tab >> "%instructionsFile%"
echo Mostrar ou esconder a Barra de Tarefas: Win + T >> "%instructionsFile%"
echo Maximizar a janela: Win + Setas (↑) >> "%instructionsFile%"
echo Minimizar a janela: Win + Setas (↓) >> "%instructionsFile%"
echo Restaurar janela maximizada: Win + Setas (↓) >> "%instructionsFile%"
echo Mover janela para a metade esquerda: Win + Setas (←) >> "%instructionsFile%"
echo Mover janela para a metade direita: Win + Setas (→) >> "%instructionsFile%"
echo Criar uma nova Área de Trabalho: Win + Ctrl + D >> "%instructionsFile%"
echo Fechar a Área de Trabalho atual: Win + Ctrl + F4 >> "%instructionsFile%"
echo Alternar entre Áreas de Trabalho: Win + Ctrl + Setas (← →) >> "%instructionsFile%"
echo Abrir Cortana (por voz): Win + C >> "%instructionsFile%"
echo Abrir o Hub de Feedback: Win + F >> "%instructionsFile%"
echo Abrir a Conexão de Projeção: Win + K >> "%instructionsFile%"
echo Acessar a área de transferência: Win + V >> "%instructionsFile%"
echo Desbloquear o narrador: Win + Ctrl + Enter >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo Outros Atalhos >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo Copiar: Ctrl + C >> "%instructionsFile%"
echo Colar: Ctrl + V >> "%instructionsFile%"
echo Recortar: Ctrl + X >> "%instructionsFile%"
echo Desfazer: Ctrl + Z >> "%instructionsFile%"
echo Selecionar tudo: Ctrl + A >> "%instructionsFile%"
echo Alternar entre janelas abertas: Alt + Tab >> "%instructionsFile%"
echo Fechar a janela ativa: Alt + F4 >> "%instructionsFile%"
echo Abrir o Gerenciador de Tarefas: Ctrl + Shift + Esc >> "%instructionsFile%"
echo Abrir o Menu Iniciar: Ctrl + Esc ou Win >> "%instructionsFile%"
echo Selecionar a barra de endereços: Ctrl + L >> "%instructionsFile%"
echo Exibir histórico de comandos: F7 >> "%instructionsFile%"
echo Abrir Busca de arquivo ou pasta: F3 >> "%instructionsFile%"

:: Open instructions file
start notepad "%instructionsFile%"

endlocal
