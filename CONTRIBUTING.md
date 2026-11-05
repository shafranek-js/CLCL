# Contributing to CLCL Next

CLCL Next is an independent fork of [CLCL](https://github.com/nakkag/CLCL). It prioritizes lightweight, native Windows functionality and keyboard-first operation.

Read the [roadmap](docs/ROADMAP.md) before proposing a new feature. Keep changes focused and preserve the MIT license and original copyright notices.

## Build

Requires Visual Studio 2022, the C++ desktop workload, and Windows SDK.

```powershell
.\Installer\build.ps1 -Configuration Release -Platform x86
```

GitHub Actions builds Windows executables and an unsigned installer. A green CI status proves only that the source compiled and artifacts were generated: install/uninstall, history persistence and clipboard behavior require manual Windows acceptance.

## Issues and pull requests

- Report bugs with a minimal reproduction using dummy, nonsensitive clipboard content.
- Do not publish passwords, secrets, confidential files, or private clipboard history in an issue.
- Include test evidence and link related issues for PRs.
- Check interoperability with original CLCL before merging installer, registry, storage, or window-class changes.
- Keep original upstream updates separate from fork-specific behavior changes, and inspect conflicts with changes to identity, installer, and storage paths.

The fork's first milestone is isolated installation without modifying original CLCL data.
