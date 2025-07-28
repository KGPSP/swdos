// Layout for SWD_PSP_OS-dark theme
loadTemplate("org.kde.plasma.desktop.defaultPanel")

// Configure the panel
for (var i = 0; i < panels().length; ++i) {
    var panel = panels()[i];
    if (panel.location == "bottom") {
        panel.height = gridUnit * 2.5;
        panel.alignment = "center";
        
        // Try to find and configure kickoff
        var widgets = panel.widgets();
        for (var j = 0; j < widgets.length; ++j) {
            if (widgets[j].type == "org.kde.plasma.kickoff") {
                widgets[j].currentConfigGroup = ["General"];
                widgets[j].writeConfig("icon", "start");
            }
        }
    }
}

// Set desktop wallpaper
var allDesktops = desktops();
for (var i = 0; i < allDesktops.length; i++) {
    allDesktops[i].wallpaperPlugin = "org.kde.image";
    allDesktops[i].currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
    
    // Try multiple paths for wallpaper
    var wallpaperPaths = [
        "/usr/share/wallpapers/SWD_PSP_OS-dark/contents/images/3840x2400.jpg",
        userDataPath("wallpapers/SWD_PSP_OS-dark/contents/images/3840x2400.jpg"),
        "SWD_PSP_OS-dark"
    ];
    
    // Use the first path that exists
    for (var j = 0; j < wallpaperPaths.length; j++) {
        allDesktops[i].writeConfig("Image", wallpaperPaths[j]);
        break; // Use the first one and hope it works
    }
    
    allDesktops[i].writeConfig("FillMode", 2);
}