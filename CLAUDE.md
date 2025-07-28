# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Win11OS-kde is a Windows 11-inspired theme package for KDE Plasma desktop. It provides both light and dark theme variants across multiple KDE components.

## Installation and Testing Commands

```bash
# Install the theme (installs to user directory by default)
./install.sh

# Install as root (installs system-wide to /usr/share/)
sudo ./install.sh

# Uninstall the theme
./uninstall.sh

# Install SDDM themes separately (requires root)
sudo ./sddm-dark/5.0/install.sh  # For Plasma 5
sudo ./sddm-dark/6.0/install.sh  # For Plasma 6
sudo ./sddm-light/5.0/install.sh # For Plasma 5
sudo ./sddm-light/6.0/install.sh # For Plasma 6
```

## Architecture and Component Structure

### Theme Components

The repository contains six main KDE theme components:

1. **Aurorae Themes** (`aurorae/`) - Window decoration themes
   - Win11OS-dark/ - Dark variant configuration and SVG assets
   - Win11OS-light/ - Light variant configuration and SVG assets

2. **Kvantum Themes** (`Kvantum/`) - Application widget style engine themes
   - Win11OS-dark/ - Contains .kvconfig and .svg for dark theme
   - Win11OS-light/ - Contains .kvconfig and .svg for light theme

3. **Color Schemes** (`color-schemes/`) - System-wide color definitions
   - Win11OSDark.colors
   - Win11OSLight.colors

4. **Plasma Desktop Themes** (`plasma/desktoptheme/`) - Plasma panel and widget themes
   - Each variant contains: icons/, widgets/, dialogs/, translucent/, solid/
   - SVG assets for UI elements (panel backgrounds, tooltips, buttons, etc.)

5. **Look-and-Feel Packages** (`plasma/look-and-feel/`) - Complete theme packages
   - com.github.yeyushengfan258.Win11OS-dark/
   - com.github.yeyushengfan258.Win11OS-light/
   - Includes splash screens, defaults, and metadata

6. **SDDM Login Themes** (`sddm-dark/`, `sddm-light/`) - Login screen themes
   - Separate versions for Plasma 5.0 and 6.0
   - Contains QML files, assets, and theme configuration

### Installation Paths

The install script detects if running as root and installs to appropriate locations:

**User Installation:**
- Aurorae: `~/.local/share/aurorae/themes/`
- Color Schemes: `~/.local/share/color-schemes/`
- Plasma Themes: `~/.local/share/plasma/desktoptheme/`
- Look-and-Feel: `~/.local/share/plasma/look-and-feel/`
- Kvantum: `~/.config/Kvantum/`
- Wallpapers: `~/.local/share/wallpapers/`

**System Installation (root):**
- Aurorae: `/usr/share/aurorae/themes/`
- Color Schemes: `/usr/share/color-schemes/`
- Plasma Themes: `/usr/share/plasma/desktoptheme/`
- Look-and-Feel: `/usr/share/plasma/look-and-feel/`
- Kvantum: `/usr/share/Kvantum/`
- Wallpapers: `/usr/share/wallpapers/`

### Key Design Decisions

1. **Dual Theme Support**: Every component has both -dark and -light variants
2. **Modular Installation**: Main install.sh handles all components except SDDM themes
3. **SDDM Separation**: SDDM themes have separate installers due to requiring root access
4. **Plasma Version Support**: SDDM themes support both Plasma 5 and 6 with different implementations
5. **SVG-Based Assets**: Most visual elements use SVG format for scalability
6. **Adaptive Transparency**: Desktop themes have adaptive transparency enabled by default

### File Naming Conventions

- Theme variants use suffix: `-dark` or `-light`
- SDDM themes: `Win11OS-dark`, `Win11OS-light`
- Look-and-Feel packages: `com.github.yeyushengfan258.Win11OS-[variant]`
- Color scheme files: `Win11OS[Dark|Light].colors`
- Config files: `[theme]rc` for Aurorae, `.kvconfig` for Kvantum

### Important Files for Theme Customization

- `*/metadata.desktop` - Theme metadata and configuration
- `*/*.kvconfig` - Kvantum theme parameters
- `*/theme.conf` - SDDM theme configuration
- `*/colors` - Plasma theme color definitions
- `color-schemes/*.colors` - System color scheme definitions