var WshShell = WScript.CreateObject("WScript.Shell");
var fso = new ActiveXObject("Scripting.FileSystemObject");
var CurrentDirectory = WshShell.CurrentDirectory;
var ToolsDirectory = fso.BuildPath(CurrentDirectory, "TOOLS");

// Configurações do atalho
var shortcutName = "WinTools (CMD).lnk";
var targetFile = "menu.cmd";
var iconPath = fso.BuildPath(ToolsDirectory, "icon\\wintools.ico"); // Caminho do ícone personalizado

var shortcutPath = CurrentDirectory + "\\" + shortcutName;
var targetPath = ToolsDirectory + "\\" + targetFile;

try {
    // Verifica se o arquivo de ícone existe
    if (!fso.FileExists(iconPath)) {
        WScript.Echo("Aviso: O ícone personalizado não foi encontrado em: " + iconPath);
        iconPath = ""; // Usará o ícone padrão do .cmd se não existir
    }

    var oLink = WshShell.CreateShortcut(shortcutPath);
    oLink.TargetPath = targetPath;
    oLink.WorkingDirectory = ToolsDirectory;
    oLink.WindowStyle = 1; // 1 = Janela normal
    oLink.IconLocation = iconPath || (targetPath + ", 0"); // Usa ícone personalizado ou padrão
    oLink.Description = "Ferramentas de Administração do Windows";
    oLink.Save();
    WScript.Echo("Atalho criado com sucesso: " + shortcutName);
} catch (e) {
    WScript.Echo("Erro ao criar o atalho: " + e.message);
}