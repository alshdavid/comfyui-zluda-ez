# Minimal ComfyUI Zluda Setup for Windows

This sets up ComfyUI Zluda for AMD devices without a system Python installation, venvs or magic scripts.

It assumes you're using up to date Windows development tools and know your way around a terminal

## Prereqs

- Enable "Developer Mode" in Windows
  - https://learn.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development
  - Just type "developer" in start menu, enable and enable all the features
- PowerShell Core
  - https://github.com/PowerShell/PowerShell
- Git for Windows
  - https://git-scm.com/downloads/win
  - Ensure commands are available in your $PATH
- HIP SDK for Windows
  - https://www.amd.com/en/developer/resources/rocm-hub/hip-sdk.html
  - Add to $PATH
- (optional) HIP support for your GPU
  - 9070xt: https://github.com/brknsoul/ROCmLibs/blob/main/rocm%20gfx1201%20for%20rocm%206.2.4-no-optimized.7z

Run all commands from PowerShell Core

## Clone ComfyUI-ZLUDA

```powershell
# PowerShell Core
# Whatever root path you want
cd ~
git clone "https://github.com/patientx/ComfyUI-Zluda.git" comfyui
```

Ignore changes we will make to repo

```powershell
# PowerShell Core
cd ~\comfyui
"`n.local" | Out-File -Append .gitignore
mkdir .local
cd .local
# Download scripts in this repo here
```

Download the scripts in this repo to `comfyui/.local`

Make sure you see `comfyui/.local/main.ps1`

## Download Python 3.11

Download python standalone/portable from here:

Find the latest standalone python release for windows here:
https://github.com/astral-sh/python-build-standalone/releases

At the time of writing, that this one:
https://github.com/astral-sh/python-build-standalone/releases/download/20250807/cpython-3.11.13+20250807-x86_64-pc-windows-msvc-install_only.tar.gz

_Note, check the releases for the latest one. They rebuild them frequently_

Extract it to `comfyui/.local/python`

Make sure `comfyui/.local/python/python.exe` exists

## Download Zluda

Download Zluda from here:

https://github.com/lshqqytiger/ZLUDA/releases

Extract it to `comfyui/.local/zluda`

Make sure `comfyui/.local/zluda/zluda.exe` exists


## Run Install Script

Run this once to setup

```powershell
# PowerShell Core
cd comfyui
.\.local\install.ps1
```

## Start Comfyui

Simple Preconfigured

```powershell
# PowerShell Core
cd comfyui
.\.local\start.ps1
```

Or a proxy to `main.py` with custom args

```powershell
# PowerShell Core
.\.local\main.ps1 --disable-auto-launch --use-quad-cross-attention --reserve-vram 0.9
```
