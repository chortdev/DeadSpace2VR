<#
DS2PCVR + MarkerPatch: turns off the MarkerPatch options that conflict with the
VR mod. Run it after installing both.

  powershell -ExecutionPolicy Bypass -File .\MarkerPatch-VR.ps1 "C:\path\to\Dead Space 2"

The first run keeps the original as MarkerPatch.ini.before-ds2pcvr. Running it
again is safe.
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

# Section, key, value. All six conflict with DS2PCVR.
$off = @(
  @('Fixes',    'FixSuitChangeTiming',      '0'),  # VR store/save/bench panels and locator
  @('Fixes',    'FixHazardSuitIcon',        '0'),  # gun laser colour
  @('Input',    'RawMouseInput',            '0'),  # camera/aim after a menu laser click
  @('Input',    'AutoHideMouseCursor',      '0'),  # menu cursor while pointing
  @('Graphics', 'ImprovedAntiAliasingMode', '0'),  # DS2PCVR has its own AA
  @('General',  'AchievementSupport',       '0')   # overlay not visible in VR, HOME grabs input
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


Write-Host "Done. Original MarkerPatch.ini kept as MarkerPatch.ini.before-ds2pcvr in $GameDir"
