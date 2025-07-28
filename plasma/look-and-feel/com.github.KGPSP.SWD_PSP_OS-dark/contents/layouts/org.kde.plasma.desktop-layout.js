// Simple layout for SWD_PSP_OS theme
loadTemplate("org.kde.plasma.desktop.defaultPanel")

// Configure the panel
for (var i = 0; i < panels().length; ++i) {
    var panel = panels()[i];
    if (panel.location == "bottom") {
        panel.height = gridUnit * 2.5;
        panel.alignment = "center";
    }
}

// Set desktop wallpaper
var desktops = desktops();
for (var i = 0; i < desktops.length; i++) {
    var desktop = desktops[i];
    desktop.wallpaperPlugin = "org.kde.image";
    desktop.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
    desktop.writeConfig("Image", "SWD_PSP_OS-dark");
}