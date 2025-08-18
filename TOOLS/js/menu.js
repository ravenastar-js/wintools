(function () {
    /**
     * 🔄 Bloco de Carregamento Seguro do data.js
     * 
     * 📌 Responsável por:
     * - Localizar e validar a existência do data.js
     * - Carregar dinamicamente o conteúdo do arquivo
     * - Verificar se menuOptions foi definido corretamente
     * - Encerrar com erro amigável se algo falhar
     * 
     * 🔒 Dependências:
     * - Arquivo data.js deve existir na mesma pasta
     * - Deve exportar menuOptions como array não vazio
     * 
     * @throws {Error} Se data.js não for encontrado ou for inválido
     */
    try {
        var fso = new ActiveXObject("Scripting.FileSystemObject");
        var currentFolder = fso.GetParentFolderName(WScript.ScriptFullName);
        var dataPath = fso.BuildPath(currentFolder, "data.js");

        if (!fso.FileExists(dataPath)) {
            throw new Error("Arquivo data.js não encontrado em:\n" + dataPath);
        }

        // Carrega e executa o data.js no mesmo escopo
        var file = fso.OpenTextFile(dataPath, 1);
        eval(file.ReadAll());
        file.Close();

        // Verifica se menuOptions foi carregado
        if (typeof menuOptions === 'undefined' || !menuOptions.length) {
            throw new Error("menuOptions não foi definido ou está vazio no data.js");
        }

    } catch (e) {
        WScript.Echo("ERRO AO CARREGAR DATA.JS:\n" + e.message +
            "\n\nVerifique:\n1. Se data.js existe na mesma pasta" +
            "\n2. Se o conteúdo está correto");
        WScript.Quit(1);
    }
    // Constantes para cores do CMD
    var COLORS = {
        DEFAULT: '0A',
        ERROR: '0C',
        SITE: '0E'
    };

    /**
     * 🏗️ Constrói o script CMD completo com base nas opções do menu
     * 
     * ✨ Esta função gera dinamicamente:
     * - Cabeçalho colorido do menu
     * - Opções numeradas a partir do array de entrada
     * - Lógica de navegação entre as seções
     * - Tratamento de erros e elevação de privilégios
     * 
     * @param {Array} options - Lista de objetos com opções do menu (deve conter label, cmd e script)
     * @returns {string} Script CMD completo pronto para ser gravado em arquivo
     * 
     * @example
     * generateCmdScript([
     *   { label: "Opção 1", cmd: "Opção 1", script: "Opção 1" },
     *   { label: "Opção 2", cmd: "opcao2", script: "Opção 2" }
     * ]);
     */
    function generateCmdScript(options) {
        var script = '@echo off\r\n';
        script += 'chcp 65001 > nul\r\n';
        script += 'color ' + COLORS.DEFAULT + '\r\n\r\n';
        script += 'rem Verifica se o script está sendo executado como administrador\r\n';
        script += 'net session >nul 2>&1\r\n';
        script += 'if %errorLevel% neq 0 (\r\n';
        script += '    color ' + COLORS.ERROR + '\r\n';
        script += '    echo Solicitando permissão de administrador...\r\n';
        script += '    goto elevate\r\n';
        script += ') else (\r\n';
        script += '    chcp 65001\r\n';
        script += '    goto runScript\r\n';
        script += ')\r\n\r\n';
        script += ':elevate\r\n';
        script += 'rem Reexecuta o script com permissões de administrador\r\n';
        script += 'cd /d "%~dp0"\r\n';
        script += 'powershell -Command "Start-Process \'%~s0\' -Verb RunAs"\r\n';
        script += 'exit /b\r\n\r\n';
        script += ':runScript\r\n';
        script += 'rem Muda para o diretório correto\r\n';
        script += 'cd /d "%~dp0"\r\n\r\n';
        script += ':menu\r\n';
        script += 'cls\r\n';
        script += 'color ' + COLORS.DEFAULT + '\r\n';
        script += 'echo ==================================================\r\n';
        script += 'echo.\r\n';
        script += 'echo \x1b[93m         ' + NameAndSite + '\x1b[32m\r\n';
        script += 'echo.\r\n';
        script += 'echo ==================================================\r\n';
        script += 'echo.\r\n';

        for (var i = 0; i < options.length; i++) {
            script += 'echo [ ' + (i + 1) + ' ] ' + options[i].label + '\r\n';
        }
        script += 'echo [0m\r\n';
        script += 'echo \x1b[94m ◙ COMANDO \x1b[37m ◙ GUIA\x1b[0m \r\n';
        script += 'echo.\r\n';
        script += 'echo [ \x1b[97mG\x1b[0m ] \x1b[97mAcessar Código Fonte no GitHub\x1b[0m\r\n';
        script += 'echo [ \x1b[91mE\x1b[0m ] \x1b[91mSair - Sai do script.\x1b[32m\r\n';
        script += 'echo ==================================================\r\n';
        script += 'set /p choice=Digite a sua escolha (1-' + options.length + ', G ou E):\x1b[93m \r\n\r\n';

        for (var i = 0; i < options.length; i++) {
            script += 'if /i "%choice%"=="' + (i + 1) + '" goto ' + options[i].cmd + '\r\n';
        }

        script += 'if /i "%choice%"=="G" goto github\r\n';
        script += 'if /i "%choice%"=="E" goto exit\r\n';
        script += 'goto invalid_choice\r\n\r\n';

        for (var i = 0; i < options.length; i++) {
            script += ':' + options[i].cmd + '\r\n';
            script += 'echo [0m\r\n';
            script += options[i].script + '\r\n';
            script += 'pause\r\n';
            script += 'goto menu\r\n\r\n';
        }

        script += ':github\r\n';
        script += 'echo [0m\r\n';
        script += 'start https://github.com/ravenastar-js/wintools\r\n';
        script += 'pause\r\n';
        script += 'goto menu\r\n\r\n';

        script += ':exit\r\n';
        script += 'exit\r\n';

        script += ':invalid_choice\r\n';
        script += 'powershell -command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show(\'Escolher entre 1 a ' + options.length + ', ou E.\', \'Erro\', \'OK\', \'Error\')}"\r\n';
        script += 'pause\r\n';
        script += 'goto menu\r\n';

        return script;
    }

    /**
     * 📂 Cria o arquivo CMD final no diretório raiz
     * 
     * ⚙️ Funcionamento:
     * 1. Localiza o diretório atual do script
     * 2. Sobe um nível para criar o arquivo
     * 3. Gera o conteúdo usando generateCmdScript()
     * 4. Cria o arquivo "menu.cmd" com o conteúdo
     * 
     * 🚨 Trata erros de permissão e criação de arquivo
     * 
     * @throws {Error} Se falhar ao criar o arquivo
     * @returns {void}
     * 
     * @example
     * createCmdFile(); // Cria menu.cmd no diretório raiz
     */
    function createCmdFile() {
        try {
            var fso = new ActiveXObject("Scripting.FileSystemObject");
            var currentFolder = fso.GetParentFolderName(WScript.ScriptFullName);
            var parentFolder = fso.GetParentFolderName(currentFolder);
            var cmdFilePath = fso.BuildPath(parentFolder, "menu.cmd");

            var cmdFile = fso.CreateTextFile(cmdFilePath, true);
            cmdFile.Write(generateCmdScript(menuOptions));
            cmdFile.Close();
        } catch (e) {
            WScript.Echo("Erro ao criar arquivo:\n" + e.message);
            WScript.Quit(1);
        }
    }

    // 🚀 Executa a função principal
    createCmdFile();
})();