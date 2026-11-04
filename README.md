# CLCL Next

**An independent development fork of [CLCL](https://github.com/nakkag/CLCL)**, the lightweight Windows clipboard manager by Ohno Tomoaki.

> **Status: early development.** The source currently retains the original CLCL application name, version, storage paths, and installer identity. **Do not install CI builds over an existing CLCL installation** until separation and migration have been implemented and tested.

## Goals

- Preserve CLCL's fast, native, low-overhead clipboard workflow.
- Add fast keyboard-first search across clipboard history.
- Improve history navigation, pinned entries, and clipboard previews.
- Modernize the popup and Viewer incrementally, without a heavyweight UI framework.
- Strengthen privacy controls, backup, and data portability.
- Keep compatibility and prevent regressions with automated Windows builds.

## Current foundation

The upstream application is written primarily in C using the Windows API (with some C++), and includes the native projects `CLCL.vcxproj`, `CLCLSet/CLCLSet.vcxproj`, and `Installer/Installer.vcxproj`. The checked-in solution currently targets **Win32 / x86**, with the **MSVC v143** toolset and the Windows 10 SDK.

The original upstream documentation remains available in `readme_en.txt` and other `readme_*.txt` files.

## Build locally

Requires Windows, Visual Studio 2022 (or Visual Studio Build Tools 2022) with **Desktop development with C++** and a Windows 10/11 SDK.

1. Clone this repository.
2. Open `CLCL.sln` in Visual Studio.
3. Select **Release | x86** and build the solution.

Alternatively, from PowerShell:

```powershell
.\Installer\build.ps1 -Configuration Release -Platform x86
```

Expected outputs:

- `Release/CLCL.exe`
- `Release/CLCLSet.exe`
- `Installer/out/clcl*.exe` (installer; upstream naming/version retained for now)

## Continuous integration

The [Windows CI workflow](.github/workflows/windows-ci.yml) builds the original solution on a Windows runner and uploads **unsigned, untested CI artifacts**. A green build establishes compilation only; it is *not* a functional or security certification.

## Development priorities

See [Roadmap](docs/ROADMAP.md) and [Issues](https://github.com/shafranek-js/CLCL/issues). The first milestone is a repeatable baseline build, followed by isolated application identity and search.

## Upstream and attribution

- Original repository: https://github.com/nakkag/CLCL
- Author: Ohno Tomoaki (Nakka)
- License: [MIT](LICENSE)

All original copyright and license notices are retained. This fork is independent and is not an official release from the upstream author.
