var WshShell = WScript.CreateObject("WScript.Shell");
var CurrentDirectory = WshShell.CurrentDirectory;

var shortcuts = [
    { shortcut: "WINTOOLS (CMD).lnk", target: "tools\\menu.cmd", root: true }
];

for (var i = 0; i < shortcuts.length; i++) {
    var shortcut = shortcuts[i].shortcut;
    var target = shortcuts[i].target;
    var root = shortcuts[i].root;

    var shortcutPath = CurrentDirectory + "\\" + shortcut;
    var targetPath = CurrentDirectory + "\\" + target;

    try {
        var oLink = WshShell.CreateShortcut(shortcutPath);
        oLink.TargetPath = targetPath;
        oLink.WorkingDirectory = CurrentDirectory;
        oLink.WindowStyle = 1;
        oLink.IconLocation = targetPath + ", 0";
        oLink.Description = "Atalho criado pelo script";
        oLink.Save();
    } catch (e) {
        WScript.Echo("Erro ao criar o atalho: " + shortcutPath + ". Detalhes: " + e.message);
    }
}
