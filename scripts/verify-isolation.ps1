#Requires -Version 5.1
# Static guardrails for the independent CLCL Next fork. This is NOT a runtime smoke test.
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

function Assert-Contains([string]$relative, [string]$pattern) {
    $source = Get-Content -LiteralPath (Join-Path $root $relative) -Raw -Encoding UTF8
    if ($source -notmatch $pattern) {
        throw "Fork identity regression in $relative - missing: $pattern"
    }
}
function Assert-NotContains([string]$relative, [string]$pattern) {
    $source = Get-Content -LiteralPath (Join-Path $root $relative) -Raw -Encoding UTF8
    if ($source -match $pattern) {
        throw "Fork identity regression in $relative - forbidden: $pattern"
    }
}

Assert-Contains 'General.h' 'APP_NAME\s+TEXT\("CLCL Next"\)'
Assert-Contains 'General.h' 'MAIN_WND_CLASS\s+TEXT\("CLCLNextMain"\)'
Assert-Contains 'General.h' 'MAIN_EXE\s+TEXT\("CLCLNext.exe"\)'
Assert-Contains 'General.h' 'OPTION_EXE\s+TEXT\("CLCLNextSet.exe"\)'
Assert-Contains 'main.c' 'TEXT\("_CLCLNext_Mutex_"\)'
Assert-Contains 'main.c' 'TEXT\("CLCLNextData"\)'
Assert-Contains 'main.c' 'TEXT\("CLCLNext"\)'
Assert-NotContains 'main.c' 'copy_old_file'
Assert-Contains 'CLCLSet/CLCLSet.c' 'TEXT\("_CLCLNextSET_Mutex_"\)'
Assert-Contains 'CLCLSet/CLCLSet.c' 'CLCLNextData'
Assert-Contains 'Installer/Installer.h' 'UNINSTALL_SUBKEY\s+TEXT\("CLCLNext"\)'
Assert-Contains 'Installer/Installer.h' 'APP_DATA_FOLDER\s+TEXT\("CLCLNext"\)'
Assert-Contains 'Installer/Installer.c' 'lstrcmpi\(subkey, UNINSTALL_SUBKEY\) == 0'
Assert-Contains 'Installer/Installer.c' 'contains_upstream_install\(install_path\)'
Assert-Contains 'Installer/Installer.c' 'CLCL Next\.lnk'
Assert-Contains 'Installer/prepare.ps1' 'clcl-next-\$major\.\$minor\.\$revision-setup\.exe'
Assert-Contains 'CLCL.vcxproj' '<TargetName>CLCLNext</TargetName>'
Assert-Contains 'CLCLSet/CLCLSet.vcxproj' '<TargetName>CLCLNextSet</TargetName>'
Write-Host 'CLCL Next static identity checks passed.'
