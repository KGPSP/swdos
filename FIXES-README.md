# 🔧 Poprawki dla motywu SWD_PSP_OS

## 🆕 Wprowadzone zmiany

### 1. **Naprawiony apply-theme.sh**
- ✅ Poprawiona nazwa schematu kolorów (`SWD_PSP_OSDark`)
- ✅ Dodany restart plasmashell po aplikowaniu theme
- ✅ Czyszczenie cache plasma przed restartowaniem
- ✅ Lepsze wykrywanie wersji Plasma (5.x/6.x)
- ✅ Bezpośrednia konfiguracja ikony kickoff
- ✅ Weryfikacja poprawności instalacji
- ✅ Więcej informacyjnych komunikatów

### 2. **Nowy skrypt fix-kickoff.sh**
- 🆕 Specjalistyczny skrypt do naprawy ikony Start/Kickoff
- 🆕 Agresywne czyszczenie cache plasma
- 🆕 Wielokrotne próby konfiguracji kickoff
- 🆕 Restart plasmashell z kontrolowanym opóźnieniem

### 3. **Naprawiony install.sh**
- ✅ Dodane kopiowanie plików z `mod/` do odpowiednich miejsc
- ✅ `logo-start.svg` → `plasma/desktoptheme/*/icons/start.svg`
- ✅ `logo-white.svg` → `splash/images/kde.svg` i SDDM `default-logo.svg`
- ✅ `bacground-log.jpg` → tapety, splash i SDDM backgrounds
- ✅ Dodatkowa weryfikacja instalacji plików PSP

## 🚀 Jak używać

### Standardowa instalacja:
```bash
# 1. Zainstaluj pliki theme
./install.sh

# 2. Zastosuj theme z nowymi poprawkami
./apply-theme.sh
```

### Jeśli ikona Start nadal nie działa:
```bash
# Uruchom specjalny skrypt naprawczy
./fix-kickoff.sh
```

## 🔍 Co zostało naprawione

### Problem 1: Ikona kickoff nie zmieniała się
**Przyczyna:** Brak bezpośredniej konfiguracji kickoff w apply-theme.sh
**Rozwiązanie:** 
- Dodana bezpośrednia konfiguracja przez kwriteconfig
- Restart plasmashell po zmianach
- Dodatkowy skrypt fix-kickoff.sh

### Problem 2: Logo systemu nie zmieniało się na splash
**Przyczyna:** Pliki z mod/ nie były kopiowane podczas instalacji
**Rozwiązanie:**
- Dodane kopiowanie `logo-white.svg` → `kde.svg` w splash
- Dodane kopiowanie do SDDM themes

### Problem 3: Błędna nazwa schematu kolorów
**Przyczyna:** apply-theme.sh używał `${THEME_NAME}Dark` zamiast `SWD_PSP_OSDark`
**Rozwiązanie:**
- Poprawione na `SWD_PSP_OSDark`

## 📋 Weryfikacja

Po zastosowaniu powinno być widoczne:
- ✅ **Czerwone logo PSP** jako przycisk Start/Kickoff
- ✅ **Białe logo PSP** podczas splash screen
- ✅ **Czerwone gradientowe tło** jako tapeta
- ✅ **Logo PSP na ekranie logowania** (po instalacji SDDM)

## 🔄 Jeśli nadal są problemy

1. Sprawdź weryfikację: `./verify-installation.sh`
2. Zainstaluj ponownie: `./install.sh`
3. Zastosuj ponownie: `./apply-theme.sh`
4. Uruchom naprawczy: `./fix-kickoff.sh`
5. Wyloguj się i zaloguj ponownie

## 🛠 Wsparcie techniczne

Skrypty obsługują:
- ✅ Plasma 5.x (kwriteconfig5, kquitapp5)
- ✅ Plasma 6.x (kwriteconfig6, kquitapp6)
- ✅ Automatyczne wykrywanie ścieżek instalacji
- ✅ Instalację użytkownika i systemową 