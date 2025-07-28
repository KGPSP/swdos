#!/bin/bash

# Apply SWD_PSP_OS Theme Script
# This script applies the theme after installation

THEME_NAME="SWD_PSP_OS"

echo "Applying ${THEME_NAME} theme..."
echo

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Apply color scheme
echo "1. Applying color scheme..."
if [[ "$1" == "--dark" ]] || [[ -z "$1" ]]; then
    plasma-apply-colorscheme "${THEME_NAME}Dark" 2>/dev/null || echo "   Note: Could not apply dark color scheme automatically"
else
    plasma-apply-colorscheme "${THEME_NAME}Light" 2>/dev/null || echo "   Note: Could not apply light color scheme automatically"
fi

# Apply desktop theme (Plasma theme)
echo "2. Applying Plasma desktop theme..."
if [[ "$1" == "--dark" ]] || [[ -z "$1" ]]; then
    plasma-apply-desktoptheme "${THEME_NAME}-dark" 2>/dev/null || echo "   Note: Could not apply dark desktop theme automatically"
else
    plasma-apply-desktoptheme "${THEME_NAME}-light" 2>/dev/null || echo "   Note: Could not apply light desktop theme automatically"
fi

# Apply Look and Feel package (this should apply everything)
echo "3. Applying Look and Feel package..."
if [[ "$1" == "--dark" ]] || [[ -z "$1" ]]; then
    plasma-apply-lookandfeel -a "com.github.KGPSP.${THEME_NAME}-dark" 2>/dev/null || echo "   Note: Could not apply dark look and feel automatically"
else
    plasma-apply-lookandfeel -a "com.github.KGPSP.${THEME_NAME}-light" 2>/dev/null || echo "   Note: Could not apply light look and feel automatically"
fi

# Apply window decorations (Aurorae theme)
echo "4. Applying window decorations..."
if command_exists kwriteconfig5; then
    if [[ "$1" == "--dark" ]] || [[ -z "$1" ]]; then
        kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key theme "__aurorae__svg__${THEME_NAME}-dark"
    else
        kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key theme "__aurorae__svg__${THEME_NAME}-light"
    fi
fi

# Apply Kvantum theme
echo "5. Applying Kvantum theme..."
if command_exists kvantummanager; then
    if [[ "$1" == "--dark" ]] || [[ -z "$1" ]]; then
        kvantummanager --set "${THEME_NAME}-dark" 2>/dev/null || echo "   Note: Please set Kvantum theme manually in Kvantum Manager"
    else
        kvantummanager --set "${THEME_NAME}-light" 2>/dev/null || echo "   Note: Please set Kvantum theme manually in Kvantum Manager"
    fi
fi

# Apply wallpaper
echo "6. Applying wallpaper..."
if command_exists plasma-apply-wallpaperimage; then
    if [[ "$1" == "--dark" ]] || [[ -z "$1" ]]; then
        WALLPAPER_PATH="$HOME/.local/share/wallpapers/${THEME_NAME}-dark/contents/images/3840x2400.jpg"
        if [[ -f "$WALLPAPER_PATH" ]]; then
            plasma-apply-wallpaperimage "$WALLPAPER_PATH" 2>/dev/null || echo "   Note: Could not apply wallpaper automatically"
        elif [[ -f "/usr/share/wallpapers/${THEME_NAME}-dark/contents/images/3840x2400.jpg" ]]; then
            plasma-apply-wallpaperimage "/usr/share/wallpapers/${THEME_NAME}-dark/contents/images/3840x2400.jpg" 2>/dev/null
        fi
    else
        WALLPAPER_PATH="$HOME/.local/share/wallpapers/${THEME_NAME}-light/contents/images/3840x2400.jpg"
        if [[ -f "$WALLPAPER_PATH" ]]; then
            plasma-apply-wallpaperimage "$WALLPAPER_PATH" 2>/dev/null || echo "   Note: Could not apply wallpaper automatically"
        elif [[ -f "/usr/share/wallpapers/${THEME_NAME}-light/contents/images/3840x2400.jpg" ]]; then
            plasma-apply-wallpaperimage "/usr/share/wallpapers/${THEME_NAME}-light/contents/images/3840x2400.jpg" 2>/dev/null
        fi
    fi
fi

# Restart KWin for window decoration changes
echo
echo "7. Restarting KWin..."
if command_exists qdbus; then
    qdbus org.kde.KWin /KWin reconfigure 2>/dev/null || echo "   Note: Could not restart KWin automatically"
fi

echo
echo "Theme application complete!"
echo
echo "If some components were not applied automatically, please:"
echo "1. Go to System Settings → Appearance → Global Theme"
echo "2. Select '${THEME_NAME}-dark' or '${THEME_NAME}-light'"
echo "3. Click 'Apply'"
echo
echo "For Kvantum themes:"
echo "1. Open Kvantum Manager"
echo "2. Select '${THEME_NAME}-dark' or '${THEME_NAME}-light'"
echo "3. Click 'Use this theme'"
echo
echo "You may need to log out and log back in for all changes to take effect."