# SWD_PSP_OS Theme - Lista kontrolna instalacji

## Co zawiera theme i gdzie się instaluje

### 1. Pliki z folderu mod/ i ich przeznaczenie:

#### logo-start.svg (czerwone logo z literą G)
- **Używane jako:** Ikona przycisku Start/Kickoff
- **Instalowane do:**
  - `plasma/desktoptheme/SWD_PSP_OS-dark/icons/start.svg`
  - `plasma/desktoptheme/SWD_PSP_OS-light/icons/start.svg`

#### logo-white.svg (białe logo)
- **Używane jako:** Logo podczas uruchamiania systemu i na ekranie logowania
- **Instalowane do:**
  - `plasma/look-and-feel/*/contents/splash/images/kde.svg`
  - `sddm-*/6.0/*/default-logo.svg`

#### bacground-log.jpg (czerwone gradientowe tło)
- **Używane jako:** Tapeta pulpitu, tło ekranu logowania, tło splash screen
- **Instalowane do:**
  - `wallpaper/SWD_PSP_OS-*/contents/images/3840x2400.jpg`
  - `sddm-*/*/*/background.jpg`
  - `plasma/look-and-feel/*/contents/splash/images/background.jpg`

### 2. Komponenty theme:

✅ **Aurorae** (Dekoracje okien)
- Ramki okien w stylu Windows 11
- Przyciski minimalizuj/maksymalizuj/zamknij

✅ **Kvantum** (Style aplikacji Qt)
- Wygląd przycisków, menu, pól tekstowych
- Spójny wygląd aplikacji

✅ **Color Schemes** (Schematy kolorów)
- SWD_PSP_OSDark - ciemny schemat
- SWD_PSP_OSLight - jasny schemat

✅ **Plasma Desktop Theme** (Motyw pulpitu)
- Panel zadań
- Menu systemowe
- Widżety
- Ikony systemowe (w tym przycisk Start z logo PSP)

✅ **Look and Feel** (Kompletny pakiet)
- Łączy wszystkie komponenty
- Splash screen z logo PSP
- Domyślne ustawienia

✅ **Wallpapers** (Tapety)
- Czerwone gradientowe tło PSP

✅ **SDDM** (Ekran logowania)
- Tło logowania z czerwonym gradientem
- Logo PSP na ekranie logowania

### 3. Proces instalacji krok po kroku:

1. **Instalacja plików theme:**
   ```bash
   ./install.sh
   ```
   Kopiuje wszystkie pliki do:
   - `~/.local/share/` (instalacja użytkownika)
   - `/usr/share/` (instalacja systemowa z sudo)

2. **Zastosowanie theme:**
   ```bash
   ./apply-theme.sh
   ```
   Aktywuje:
   - Schemat kolorów
   - Theme Plasma (z przyciskiem Start PSP)
   - Dekoracje okien
   - Kvantum theme
   - Tapetę

3. **Instalacja ekranu logowania (opcjonalne):**
   ```bash
   sudo ./sddm-dark/6.0/install.sh
   ```

### 4. Weryfikacja instalacji:

Uruchom skrypt weryfikacyjny:
```bash
./verify-installation.sh
```

Sprawdzi czy wszystkie komponenty są poprawnie zainstalowane.

### 5. Co zobaczysz po instalacji:

- ✅ **Przycisk Start** - czerwone logo PSP zamiast logo KDE
- ✅ **Tapeta** - czerwone gradientowe tło
- ✅ **Splash screen** - białe logo PSP podczas uruchamiania
- ✅ **Ekran logowania** - czerwone tło z logo PSP
- ✅ **Okna** - dekoracje w stylu Windows 11
- ✅ **Aplikacje** - spójny wygląd dzięki Kvantum

### 6. Rozwiązywanie problemów:

Jeśli coś nie działa:
1. Sprawdź weryfikację: `./verify-installation.sh`
2. Zainstaluj ponownie: `./install.sh`
3. Zastosuj ponownie: `./apply-theme.sh`
4. Wyloguj się i zaloguj ponownie

Wszystkie pliki z mod/ są już wbudowane w odpowiednie miejsca w theme!