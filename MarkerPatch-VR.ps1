<#
DS2PCVR + MarkerPatch: turns off the MarkerPatch options that conflict with the
VR mod and sets the DXVK frame cap. Run it after installing both.

  powershell -ExecutionPolicy Bypass -File .\MarkerPatch-VR.ps1 "C:\path\to\Dead Space 2"

The first run keeps the originals as MarkerPatch.ini.before-ds2pcvr and
dxvk.conf.before-ds2pcvr. Running it again is safe.
#>
param([Parameter(Mandatory = $true)][string]$GameDir)
$ErrorActionPreference = 'Stop'

$GameDir = $GameDir.Trim('"')
if (-not (Test-Path -LiteralPath (Join-Path $GameDir 'deadspace2.exe'))) {
  throw "deadspace2.exe not found in '$GameDir'. Pass the folder that contains it."
}
$ini = Join-Path $GameDir 'MarkerPatch.ini'
if (-not (Test-Path -LiteralPath $ini)) {
  throw "MarkerPatch.ini not found. Install MarkerPatch first: https://github.com/Wemino/MarkerPatch/releases"
}

# Section, key, value. All six conflict with DS2PCVR (see README).
$off = @(
  @('Fixes',    'FixSuitChangeTiming',      '0'),  # VR store/save/bench panels and locator
  @('Fixes',    'FixHazardSuitIcon',        '0'),  # gun laser colour
  @('Input',    'RawMouseInput',            '0'),  # camera/aim after a menu laser click
  @('Input',    'AutoHideMouseCursor',      '0'),  # menu cursor while pointing
  @('Graphics', 'ImprovedAntiAliasingMode', '0'),  # DS2PCVR has its own AA
  @('General',  'AchievementSupport',       '0')   # overlay not visible in VR, HOME grabs input
)
# DXVK only (Linux/Proton/Steam Deck or DXVK on Windows). Overrides DXVK's
# built-in Dead Space 2 profile (60 FPS cap, forced vsync).
$dxvkKeys = @(
  @('d3d9.maxFrameRate',    '120'),
  @('d3d9.presentInterval', '0')
)

# First run only. A file that did not exist gets an empty backup, so a later
# run never mistakes this script's own output for the original.
function Backup([string]$path) {
  $copy = "$path.before-ds2pcvr"
  if (Test-Path -LiteralPath $copy) { return }
  if (Test-Path -LiteralPath $path) { Copy-Item -LiteralPath $path -Destination $copy }
  else { New-Item -ItemType File -Path $copy | Out-Null }
}

# MarkerPatch.ini: replace values in place, keep comments, BOM and line endings.
Backup $ini
$bytes = [IO.File]::ReadAllBytes($ini)
$bom = $bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF
$text = [IO.File]::ReadAllText($ini)
$nl = if ($text.Contains("`r`n")) { "`r`n" } else { "`n" }
foreach ($o in $off) {
  $section, $key, $value = $o
  $line = "(?m)^([ \t]*$key[ \t]*=[ \t]*)[^\r\n]*"
  if ($text -match $line) {
    $text = [regex]::Replace($text, $line, "`${1}$value")
  } elseif ($text -match "(?m)^\[$section\]") {
    $text = ([regex]"(?m)^\[$section\][ \t]*").Replace($text, "`$0$nl$key = $value", 1)
  } else {
    $text += "$nl[$section]$nl$key = $value$nl"
  }
  Write-Host "MarkerPatch.ini  $key = $value"
}
[IO.File]::WriteAllText($ini, $text, (New-Object Text.UTF8Encoding($bom)))

# dxvk.conf: set our keys, keep every other line.
$conf = Join-Path $GameDir 'dxvk.conf'
Backup $conf
$lines = @()
if (Test-Path -LiteralPath $conf) { $lines = @(Get-Content -LiteralPath $conf) }
foreach ($k in $dxvkKeys) {
  $key, $value = $k
  $pattern = '^\s*' + [regex]::Escape($key) + '\s*='
  if ($lines -match $pattern) { $lines = $lines -replace ($pattern + '.*$'), "$key = $value" }
  else { $lines += "$key = $value" }
  Write-Host "dxvk.conf        $key = $value"
}
[IO.File]::WriteAllLines($conf, [string[]]$lines, (New-Object Text.ASCIIEncoding))

Write-Host "Done. Originals kept as *.before-ds2pcvr in $GameDir"
