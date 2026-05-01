# CHANGELOG — kiro-pkgbuild

> PKGBUILDs for building custom Calamares packages (`calamares` and `calamares-next`).
> Each build directory is versioned after the upstream Calamares git snapshot.

---

## 2026-04-26 — `calamares-3.3.14.r132.g841b478-4`

Latest build — both `calamares` and `calamares-next` variants at version `-4`:

- **`PKGBUILD`** — full build definition (124 lines)
- **`build-calamares`** — build automation script (46 lines)
- **`cal-kiro.desktop`** — launcher (240 lines)
- **`calamares-wrapper`** — launch wrapper (38 lines)
- **`calamares_polkit`** — polkit rule (6 lines)
- **`install`** — post-install hook (40 lines)
- **Patched modules included:**
  - `bootloader/main.py` (966 lines) — custom bootloader logic
  - `packages/main.py` (832 lines) — custom package handling

**Previous builds in repo (newest → oldest):**

| Build dir | Notes |
|---|---|
| `calamares-3.3.14.r132.g841b478-4` | Current — both calamares + calamares-next |
| `calamares-3.3.14.r132.g841b478-3` | Previous iteration |
| `calamares-3.3.14.r132.g841b478-2` | Earlier iteration |
| `calamares-3.3.14.r87.g3f6cd83-1` | Earlier upstream snapshot |
| `calamares-3.3.14.r90.g53c70f8-1` | Earlier upstream snapshot |
| `calamares-3.3.14.r81.g55f0c9e-2` | Earlier upstream snapshot |
| `calamares-git-3.3.14.r51.g3b9ef52-2` | Original `-git` named build |
| `calamares-next-3.3.14.r132.g841b478-2/3/4` | Next-track parallel builds |

---

## Build Structure

Each versioned folder contains:
```
PKGBUILD
build-calamares          # builds and installs the package
cal-kiro.desktop         # Calamares desktop launcher
calamares-wrapper        # shell wrapper for launch
calamares_polkit         # polkit authentication rule
install                  # pacman install hook
modules/
  bootloader/            # patched bootloader module
  packages/              # patched packages module
```
