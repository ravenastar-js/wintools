var WshShell = WScript.CreateObject("WScript.Shell");
var fso = new ActiveXObject("Scripting.FileSystemObject");
var CurrentDirectory = WshShell.CurrentDirectory;
var ToolsDirectory = fso.BuildPath(CurrentDirectory, "TOOLS");

var shortcuts = [
    { shortcut: "WINTOOLS (CMD).lnk", target: "menu.cmd", root: true }
];

for (var i = 0; i < shortcuts.length; i++) {
    var shortcut = shortcuts[i].shortcut;
    var target = shortcuts[i].target;

    var shortcutPath = CurrentDirectory + "\\" + shortcut;
    var targetPath = ToolsDirectory + "\\" + target;

    try {
        var oLink = WshShell.CreateShortcut(shortcutPath);
        oLink.TargetPath = targetPath;
        oLink.WorkingDirectory = ToolsDirectory;
        oLink.WindowStyle = 1;
        oLink.IconLocation = targetPath + ", 0";
        oLink.Description = "Atalho criado pelo script";
        oLink.Save();
    } catch (e) {
        WScript.Echo("Erro ao criar o atalho: " + shortcutPath + ". Detalhes: " + e.message);
    }
}
