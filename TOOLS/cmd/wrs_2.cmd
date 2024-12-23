@echo off
setlocal

:: Create temporary instructions file
set instructionsFile=%TEMP%\wrs_2.txt

:: Write the shortcut list to the instructions file
echo 🔒 Windows Rápido e Seguro 2.0 > "%instructionsFile%"
echo. >> "%instructionsFile%"
echo ▶ Aula 1: Introdução e erros a evitar >> "%instructionsFile%"
echo 🔗 https://www.baboo.com.br/cursos/aula-01 >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo ▶ Aula 2: Análise do disco rígido e SSD >> "%instructionsFile%"
echo 🔗 https://www.baboo.com.br/cursos/aula-02 >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo ▶ Aula 3: CHKDSK SFC DISM >> "%instructionsFile%"
echo 🔗 https://www.baboo.com.br/cursos/aula-03 >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo ▶ Aula 4: Windows Update >> "%instructionsFile%"
echo 🔗 https://www.baboo.com.br/cursos/aula-04 >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo ▶ Aula 5: Desinstalação de programas dispensáveis >> "%instructionsFile%"
echo 🔗 https://www.baboo.com.br/cursos/aula-05 >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo ▶ Aula 6: Remoção de arquivos temporários >> "%instructionsFile%"
echo 🔗 https://www.baboo.com.br/cursos/aula-06 >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo ▶ Aula 7: AdwCleaner + uBlock Origin + TrafficLight >> "%instructionsFile%"
echo 🔗 https://www.baboo.com.br/cursos/aula-07 >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo ▶ Aula 8: KVRT e HouseCall >> "%instructionsFile%"
echo 🔗 https://www.baboo.com.br/cursos/aula-08 >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo ▶ Aula 9: ESET Online Scanner, Emsisoft Emergency Kit e Malwarebytes Premium >> "%instructionsFile%"
echo 🔗 https://www.baboo.com.br/cursos/aula-09 >> "%instructionsFile%"
echo. >> "%instructionsFile%"
echo ▶ Aula 10: Desfragmentação e dicas finais >> "%instructionsFile%"
echo 🔗 https://www.baboo.com.br/cursos/aula-10 >> "%instructionsFile%"

:: Open instructions file
start notepad "%instructionsFile%"

endlocal
