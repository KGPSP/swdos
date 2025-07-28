#!/bin/bash

# SWD_PSP_OS Theme Installation Verification Script

echo "================================================"
echo "SWD_PSP_OS Theme Installation Verification"
echo "================================================"
echo

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
   INSTALL_DIR="/usr/share"
else
   INSTALL_DIR="$HOME/.local/share"
fi

echo "Checking installation in: $INSTALL_DIR"
echo

# Function to check if file exists and show result
check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} $2"
        return 0
    else
        echo -e "${RED}✗${NC} $2"
        echo "  Missing: $1"
        return 1
    fi
}

# Function to check if directory exists
check_dir() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✓${NC} $2"
        return 0
    else
        echo -e "${RED}✗${NC} $2"
        echo "  Missing: $1"
        return 1
    fi
}

# Counter for errors
ERRORS=0

echo "1. PODSTAWOWE KOMPONENTY THEME:"
echo "==============================="

# Aurorae themes
check_dir "$INSTALL_DIR/aurorae/themes/SWD_PSP_OS-dark" "Aurorae dark theme" || ((ERRORS++))
check_dir "$INSTALL_DIR/aurorae/themes/SWD_PSP_OS-light" "Aurorae light theme" || ((ERRORS++))

# Color schemes
check_file "$INSTALL_DIR/color-schemes/SWD_PSP_OSDark.colors" "Dark color scheme" || ((ERRORS++))
check_file "$INSTALL_DIR/color-schemes/SWD_PSP_OSLight.colors" "Light color scheme" || ((ERRORS++))

# Plasma themes
check_dir "$INSTALL_DIR/plasma/desktoptheme/SWD_PSP_OS-dark" "Plasma dark theme" || ((ERRORS++))
check_dir "$INSTALL_DIR/plasma/desktoptheme/SWD_PSP_OS-light" "Plasma light theme" || ((ERRORS++))

# Look and Feel
check_dir "$INSTALL_DIR/plasma/look-and-feel/com.github.KGPSP.SWD_PSP_OS-dark" "Look and Feel dark" || ((ERRORS++))
check_dir "$INSTALL_DIR/plasma/look-and-feel/com.github.KGPSP.SWD_PSP_OS-light" "Look and Feel light" || ((ERRORS++))

# Kvantum
if [ "$EUID" -eq 0 ]; then
    KVANTUM_DIR="/usr/share/Kvantum"
else
    KVANTUM_DIR="$HOME/.config/Kvantum"
fi
check_dir "$KVANTUM_DIR/SWD_PSP_OS-dark" "Kvantum dark theme" || ((ERRORS++))
check_dir "$KVANTUM_DIR/SWD_PSP_OS-light" "Kvantum light theme" || ((ERRORS++))

echo
echo "2. KLUCZOWE PLIKI Z MOD/:"
echo "========================"

# Kickoff button icon
check_file "$INSTALL_DIR/plasma/desktoptheme/SWD_PSP_OS-dark/icons/start.svg" "Kickoff button icon (dark)" || ((ERRORS++))
check_file "$INSTALL_DIR/plasma/desktoptheme/SWD_PSP_OS-light/icons/start.svg" "Kickoff button icon (light)" || ((ERRORS++))

# Splash screen logo
check_file "$INSTALL_DIR/plasma/look-and-feel/com.github.KGPSP.SWD_PSP_OS-dark/contents/splash/images/kde.svg" "Splash logo (dark)" || ((ERRORS++))
check_file "$INSTALL_DIR/plasma/look-and-feel/com.github.KGPSP.SWD_PSP_OS-light/contents/splash/images/kde.svg" "Splash logo (light)" || ((ERRORS++))

# Wallpapers
check_file "$INSTALL_DIR/wallpapers/SWD_PSP_OS-dark/contents/images/3840x2400.jpg" "Desktop wallpaper (dark)" || ((ERRORS++))
check_file "$INSTALL_DIR/wallpapers/SWD_PSP_OS-light/contents/images/3840x2400.jpg" "Desktop wallpaper (light)" || ((ERRORS++))

# Splash backgrounds
check_file "$INSTALL_DIR/plasma/look-and-feel/com.github.KGPSP.SWD_PSP_OS-dark/contents/splash/images/background.jpg" "Splash background (dark)" || ((ERRORS++))
check_file "$INSTALL_DIR/plasma/look-and-feel/com.github.KGPSP.SWD_PSP_OS-light/contents/splash/images/background.jpg" "Splash background (light)" || ((ERRORS++))

# Desktop layout configurations
check_file "$INSTALL_DIR/plasma/look-and-feel/com.github.KGPSP.SWD_PSP_OS-dark/contents/layouts/org.kde.plasma.desktop-layout.js" "Desktop layout (dark)" || ((ERRORS++))
check_file "$INSTALL_DIR/plasma/look-and-feel/com.github.KGPSP.SWD_PSP_OS-light/contents/layouts/org.kde.plasma.desktop-layout.js" "Desktop layout (light)" || ((ERRORS++))

echo
echo "3. SDDM LOGIN THEMES:"
echo "===================="

# SDDM themes need to be checked in system directory
if [ -d "/usr/share/sddm/themes/SWD_PSP_OS-dark" ]; then
    echo -e "${GREEN}✓${NC} SDDM dark theme installed"
else
    echo -e "${YELLOW}!${NC} SDDM dark theme not installed (run: sudo ./sddm-dark/6.0/install.sh)"
fi

if [ -d "/usr/share/sddm/themes/SWD_PSP_OS-light" ]; then
    echo -e "${GREEN}✓${NC} SDDM light theme installed"
else
    echo -e "${YELLOW}!${NC} SDDM light theme not installed (run: sudo ./sddm-light/6.0/install.sh)"
fi

echo
echo "4. SPRAWDZENIE KONFIGURACJI:"
echo "==========================="

# Check if theme is currently applied
CURRENT_THEME=$(kreadconfig5 --file plasmarc --group Theme --key name 2>/dev/null)
if [[ "$CURRENT_THEME" == "SWD_PSP_OS-dark" ]] || [[ "$CURRENT_THEME" == "SWD_PSP_OS-light" ]]; then
    echo -e "${GREEN}✓${NC} Theme is currently active: $CURRENT_THEME"
else
    echo -e "${YELLOW}!${NC} Theme is installed but not active"
    echo "  Current theme: ${CURRENT_THEME:-default}"
    echo "  Run ./apply-theme.sh to activate"
fi

echo
echo "================================================"
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✓ WERYFIKACJA ZAKOŃCZONA POMYŚLNIE${NC}"
    echo "  Wszystkie komponenty są zainstalowane poprawnie!"
    echo
    echo "Aby zastosować theme, uruchom:"
    echo "  ./apply-theme.sh        # dla ciemnego wariantu"
    echo "  ./apply-theme.sh --light # dla jasnego wariantu"
else
    echo -e "${RED}✗ ZNALEZIONO $ERRORS BŁĘDÓW${NC}"
    echo "  Niektóre komponenty nie są zainstalowane."
    echo "  Uruchom ponownie ./install.sh"
fi
echo "================================================"