#!/bin/bash

SRC_DIR=$(cd $(dirname $0) && pwd)
ROOT_UID=0

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  AURORAE_DIR="/usr/share/aurorae/themes"
  SCHEMES_DIR="/usr/share/color-schemes"
  PLASMA_DIR="/usr/share/plasma/desktoptheme"
  LAYOUT_DIR="/usr/share/plasma/layout-templates"
  LOOKFEEL_DIR="/usr/share/plasma/look-and-feel"
  KVANTUM_DIR="/usr/share/Kvantum"
  WALLPAPER_DIR="/usr/share/wallpapers"
else
  AURORAE_DIR="$HOME/.local/share/aurorae/themes"
  SCHEMES_DIR="$HOME/.local/share/color-schemes"
  PLASMA_DIR="$HOME/.local/share/plasma/desktoptheme"
  LAYOUT_DIR="$HOME/.local/share/plasma/layout-templates"
  LOOKFEEL_DIR="$HOME/.local/share/plasma/look-and-feel"
  KVANTUM_DIR="$HOME/.config/Kvantum"
  WALLPAPER_DIR="$HOME/.local/share/wallpapers"
fi

THEME_NAME=SWD_PSP_OS

[[ ! -d ${AURORAE_DIR} ]] && mkdir -p ${AURORAE_DIR}
[[ ! -d ${SCHEMES_DIR} ]] && mkdir -p ${SCHEMES_DIR}
[[ ! -d ${PLASMA_DIR} ]] && mkdir -p ${PLASMA_DIR}
[[ ! -d ${LOOKFEEL_DIR} ]] && mkdir -p ${LOOKFEEL_DIR}
[[ ! -d ${KVANTUM_DIR} ]] && mkdir -p ${KVANTUM_DIR}
[[ ! -d ${WALLPAPER_DIR} ]] && mkdir -p ${WALLPAPER_DIR}

install() {
  local name=${1}

  echo "Installing components..."
  echo -n "  - Aurorae themes... "
  cp -r ${SRC_DIR}/aurorae/* ${AURORAE_DIR} && echo "OK" || echo "FAILED"
  
  echo -n "  - Color schemes... "
  cp -r ${SRC_DIR}/color-schemes/*.colors ${SCHEMES_DIR} && echo "OK" || echo "FAILED"
  
  echo -n "  - Kvantum themes... "
  cp -r ${SRC_DIR}/Kvantum/* ${KVANTUM_DIR} && echo "OK" || echo "FAILED"
  
  echo -n "  - Plasma desktop themes... "
  cp -r ${SRC_DIR}/plasma/desktoptheme/* ${PLASMA_DIR} && echo "OK" || echo "FAILED"
  
  echo -n "  - Look and Feel packages... "
  cp -r ${SRC_DIR}/plasma/look-and-feel/* ${LOOKFEEL_DIR} && echo "OK" || echo "FAILED"
  
  echo -n "  - Wallpapers... "
  cp -r ${SRC_DIR}/wallpaper/* ${WALLPAPER_DIR} && echo "OK" || echo "FAILED"
  
  # Copy and integrate mod/ files
  echo -n "  - PSP branding files... "
  if [[ -f "${SRC_DIR}/mod/logo-start.svg" ]] && [[ -f "${SRC_DIR}/mod/logo-white.svg" ]] && [[ -f "${SRC_DIR}/mod/bacground-log.jpg" ]]; then
    # Copy start icon (red PSP logo) to plasma themes
    cp "${SRC_DIR}/mod/logo-start.svg" "${PLASMA_DIR}/SWD_PSP_OS-dark/icons/start.svg" 2>/dev/null
    cp "${SRC_DIR}/mod/logo-start.svg" "${PLASMA_DIR}/SWD_PSP_OS-light/icons/start.svg" 2>/dev/null
    
    # Copy white logo to splash screens
    cp "${SRC_DIR}/mod/logo-white.svg" "${LOOKFEEL_DIR}/com.github.KGPSP.SWD_PSP_OS-dark/contents/splash/images/kde.svg" 2>/dev/null
    cp "${SRC_DIR}/mod/logo-white.svg" "${LOOKFEEL_DIR}/com.github.KGPSP.SWD_PSP_OS-light/contents/splash/images/kde.svg" 2>/dev/null
    
    # Copy white logo to SDDM themes
    cp "${SRC_DIR}/mod/logo-white.svg" "${SRC_DIR}/sddm-dark/6.0/SWD_PSP_OS-dark/default-logo.svg" 2>/dev/null
    cp "${SRC_DIR}/mod/logo-white.svg" "${SRC_DIR}/sddm-light/6.0/SWD_PSP_OS-light/default-logo.svg" 2>/dev/null
    cp "${SRC_DIR}/mod/logo-white.svg" "${SRC_DIR}/sddm-dark/5.0/SWD_PSP_OS-dark/default-logo.svg" 2>/dev/null
    cp "${SRC_DIR}/mod/logo-white.svg" "${SRC_DIR}/sddm-light/5.0/SWD_PSP_OS-light/default-logo.svg" 2>/dev/null
    
    # Copy background to wallpapers
    cp "${SRC_DIR}/mod/bacground-log.jpg" "${WALLPAPER_DIR}/SWD_PSP_OS-dark/contents/images/3840x2400.jpg" 2>/dev/null
    cp "${SRC_DIR}/mod/bacground-log.jpg" "${WALLPAPER_DIR}/SWD_PSP_OS-light/contents/images/3840x2400.jpg" 2>/dev/null
    
    # Copy background to splash screens
    cp "${SRC_DIR}/mod/bacground-log.jpg" "${LOOKFEEL_DIR}/com.github.KGPSP.SWD_PSP_OS-dark/contents/splash/images/background.jpg" 2>/dev/null
    cp "${SRC_DIR}/mod/bacground-log.jpg" "${LOOKFEEL_DIR}/com.github.KGPSP.SWD_PSP_OS-light/contents/splash/images/background.jpg" 2>/dev/null
    
    # Copy background to SDDM themes
    cp "${SRC_DIR}/mod/bacground-log.jpg" "${SRC_DIR}/sddm-dark/6.0/SWD_PSP_OS-dark/background.jpeg" 2>/dev/null
    cp "${SRC_DIR}/mod/bacground-log.jpg" "${SRC_DIR}/sddm-light/6.0/SWD_PSP_OS-light/background.jpeg" 2>/dev/null
    cp "${SRC_DIR}/mod/bacground-log.jpg" "${SRC_DIR}/sddm-dark/5.0/SWD_PSP_OS-dark/background.jpg" 2>/dev/null
    cp "${SRC_DIR}/mod/bacground-log.jpg" "${SRC_DIR}/sddm-light/5.0/SWD_PSP_OS-light/background.jpg" 2>/dev/null
    
    echo "OK"
  else
    echo "FAILED - mod/ files not found"
  fi
  
  # Verify critical files
  echo
  echo "Verifying installation..."
  if [[ -f "${WALLPAPER_DIR}/SWD_PSP_OS-dark/contents/images/3840x2400.jpg" ]]; then
    echo "  ✓ Dark wallpaper installed"
  else
    echo "  ✗ Dark wallpaper NOT found at: ${WALLPAPER_DIR}/SWD_PSP_OS-dark/contents/images/3840x2400.jpg"
  fi
  
  if [[ -f "${WALLPAPER_DIR}/SWD_PSP_OS-light/contents/images/3840x2400.jpg" ]]; then
    echo "  ✓ Light wallpaper installed"
  else
    echo "  ✗ Light wallpaper NOT found at: ${WALLPAPER_DIR}/SWD_PSP_OS-light/contents/images/3840x2400.jpg"
  fi
  
  # Verify PSP branding files
  if [[ -f "${PLASMA_DIR}/SWD_PSP_OS-dark/icons/start.svg" ]]; then
    echo "  ✓ PSP Start icon installed (dark)"
  else
    echo "  ✗ PSP Start icon NOT found"
  fi
  
  if [[ -f "${LOOKFEEL_DIR}/com.github.KGPSP.SWD_PSP_OS-dark/contents/splash/images/kde.svg" ]]; then
    echo "  ✓ PSP Splash logo installed (dark)"
  else
    echo "  ✗ PSP Splash logo NOT found"
  fi
}

echo "Installing '${THEME_NAME} kde themes'..."
echo "Installation directory: $([ "$UID" -eq "$ROOT_UID" ] && echo "System (/usr/share)" || echo "User ($HOME/.local/share)")"
echo

install "${name:-${THEME_NAME}}"

echo
echo "Install finished..."
echo
echo "========================================="
echo "IMPORTANT: Theme installed but NOT applied!"
echo "========================================="
echo
echo "To apply the theme, run:"
echo "  ./apply-theme.sh        # For dark theme"
echo "  ./apply-theme.sh --light # For light theme"
echo
echo "Or manually:"
echo "1. Go to System Settings → Appearance → Global Theme"
echo "2. Select 'SWD_PSP_OS-dark' or 'SWD_PSP_OS-light'"
echo "3. Click 'Apply'"
echo
echo "If wallpaper doesn't apply, run:"
echo "  ./apply-wallpaper.sh        # For dark wallpaper"
echo "  ./apply-wallpaper.sh --light # For light wallpaper"
echo
echo "For SDDM login theme, run:"
echo "  sudo ./sddm-dark/6.0/install.sh  # For dark variant"
echo "  sudo ./sddm-light/6.0/install.sh # For light variant"
echo
echo "To verify installation, run:"
echo "  ./verify-installation.sh"
echo "========================================="
