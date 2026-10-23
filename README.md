<p align="center">
  <a href="https://www.patreon.com/chortdev/"><img alt="Patreon" src="https://img.shields.io/badge/Patreon-chortdev-FF424D?style=for-the-badge&amp;logo=patreon&amp;logoColor=white"></a>
  <a href="https://boosty.to/chortdev"><img alt="Boosty" src="https://img.shields.io/badge/Boosty-chortdev-F05A2D?style=for-the-badge&amp;logo=boosty&amp;logoColor=white"></a>
  <a href="https://etherscan.io/address/0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1"><img alt="USDT wallet: 0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1" src="https://img.shields.io/badge/USDT-0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1-26A17B?style=for-the-badge&amp;logo=tether&amp;logoColor=white"></a>
  <a href="https://discord.com/channels/747967102895390741/1546924467832225863"><img alt="Discord flat2VR" src="https://img.shields.io/badge/Discord-flat2VR-5865F2?style=for-the-badge&amp;logo=discord&amp;logoColor=white"></a>
  <a href="https://www.youtube.com/@chortdev"><img alt="YouTube" src="https://img.shields.io/badge/YouTube-%40chortdev-FF0000?style=for-the-badge&amp;logo=youtube&amp;logoColor=white"></a>
</p>

# Dead Space 2 PC VR

A native VR mod for the original 32-bit PC release of **Dead Space 2**. The mod
loads as a `d3d9.dll` proxy next to `deadspace2.exe`; it does not replace the
game executable or the game's data files.

This repository is the public home for release archives and documentation.
Source code and internal reverse-engineering material are not published here.
This is an unofficial fan project, not affiliated with or endorsed by
Electronic Arts; Dead Space 2 and its assets belong to their respective owner.

## Status

First public release, in active development. The features below are implemented
and exercised in the current build, but VR behavior can still differ by scene,
headset, runtime and controller. Please report problems with a log and the
steps that produced them.

## Features

- Same-frame stereoscopic VR through OpenVR/SteamVR, with SBS and flat output
  modes for desktop testing.
- Head tracking with seated/standing play, snap or smooth turning, movement
  vignette, height calibration and physical room-scale steps.
- Motion-controller hands, tracked weapon model, two-hand weapon grip and
  hand/gun world collision.
- Physical manual reload, telekinesis, stasis, melee, hand HUD and the oxygen
  meter.
- Native RIG inventory, shops, save stations, benches, locator and QTE prompts
  adapted for VR.
- In-game **Settings → VR Settings** pages for play position, controls,
  comfort, display, anti-aliasing and calibration.
- A session log file for support and bug reports.

The release build does not expose developer-only menu entries. Calibration and
advanced controls are available under **VR Settings → Calibration and
controls**.

## Requirements

- Windows 10 or Windows 11, 64-bit.
- The original 32-bit PC release of Dead Space 2. Both the pinned retail build
  and the current Steam build are supported; the installer checks the
  executable SHA-256 before changing anything.
- An OpenVR-compatible runtime and headset (for example SteamVR, or a Quest
  streaming setup that presents OpenVR controllers).
- Two tracked motion controllers.

## Installation

1. Close Dead Space 2 and SteamVR.
2. Back up the game directory.
3. Extract the release ZIP into the game directory, next to `deadspace2.exe`.
4. Either run `install.bat "C:\path\to\Dead Space 2"` (or `install.ps1` from
   PowerShell), or copy the files manually into the game directory.
5. Start SteamVR, then start the game.
6. Open the game's **Settings → VR Settings** page and select your play
   position, hand mode and turning preference.

To remove an automated installation, run:

```bat
install.bat "C:\path\to\Dead Space 2" -Uninstall
```

Keep the generated `ds2stereo.ini`, `ds2twohand.ini`, `ds2vr-settings.ini` and
calibration files if you want to preserve your setup across an update.

## Optional: MarkerPatch

[MarkerPatch](https://github.com/Wemino/MarkerPatch) by Wemino is a fix pack
for the PC version of Dead Space 2: physics and weapon fire rate at high frame
rates, stutter and loading fixes, and more. It works together with DS2PCVR
(MarkerPatch loads as `dinput8.dll`, DS2PCVR as `d3d9.dll`), but six of its
options conflict with VR and must be turned off:

| MarkerPatch option | Problem when left on |
|---|---|
| `FixSuitChangeTiming` | Store, save station and bench VR panels and the VR locator are disabled |
| `FixHazardSuitIcon` | The gun laser colour setting stops working |
| `RawMouseInput` | Can take over camera and aim after a menu click with the controller laser |
| `AutoHideMouseCursor` | Hides the menu cursor while you point with a controller |
| `ImprovedAntiAliasingMode` | DS2PCVR has its own anti-aliasing (**VR Settings → Comfort → Display and anti-aliasing**); MarkerPatch's SSAA changes the render size the VR image relies on |
| `AchievementSupport` | The overlay is not visible in the headset and the HOME key takes over input |

Setup:

1. Install DS2PCVR (above).
2. Download `MarkerPatch.zip` from the
   [MarkerPatch releases](https://github.com/Wemino/MarkerPatch/releases) and
   extract it into the game folder, next to `deadspace2.exe`.
3. Download [`MarkerPatch-VR.ps1`](MarkerPatch-VR.ps1) from this repository
   and run it from PowerShell:

   ```powershell
   powershell -ExecutionPolicy Bypass -File .\MarkerPatch-VR.ps1 "C:\path\to\Dead Space 2"
   ```

   It turns the six options off in `MarkerPatch.ini` and sets the DXVK frame
   cap in `dxvk.conf`. The first run keeps the originals as
   `MarkerPatch.ini.before-ds2pcvr` and `dxvk.conf.before-ds2pcvr`; running it
   again is safe.

The `dxvk.conf` settings (`d3d9.maxFrameRate = 120`,
`d3d9.presentInterval = 0`) apply only when the game runs through DXVK (Linux,
Proton, Steam Deck, or DXVK on Windows); native Direct3D 9 on Windows ignores
the file. They replace DXVK's built-in Dead Space 2 limits (60 FPS and forced
vsync), which exist because of the high-frame-rate physics problems that
MarkerPatch fixes.

To remove MarkerPatch, delete `dinput8.dll`, `MarkerPatch.ini` and the
`achievements` folder from the game folder, and rename
`dxvk.conf.before-ds2pcvr` back to `dxvk.conf`.

Tested with MarkerPatch 3.0.6 on the Steam version.

## Logs and bug reports

The installer creates a per-install log directory:

```text
<game directory>\ds2pcvr-logs\<install id>\ds2stereo.log
```

For a manual installation, the log is written to `out_dir` from
`ds2stereo.ini`, or next to `d3d9.dll` when `out_dir` is empty. Each launch
starts a fresh `ds2stereo.log`; previous sessions are kept as
`ds2stereo-YYYYMMDD-HHMMSS.log`. The `log_sessions` key controls how many
sessions are retained (default 10).

When reporting a bug, attach:

- the newest `ds2stereo.log`;
- `ds2stereo.ini` and `ds2vr-settings.ini`;
- your headset, runtime (SteamVR/ALVR/Virtual Desktop/etc.), GPU and driver;
- the exact steps that reproduce the problem, and a screenshot or short video
  when the problem is visual.

**Known workaround:** keep the game's **Motion Blur** setting off. It prevents
long stretched triangles around enemies in both eyes.

## Release files and updates

Release archives contain the runtime files, the installer helpers, the
documentation and a SHA-256 manifest. They do not contain source code, tests or
developer packages; the installer scripts are the only command-line helpers.
Release DLLs are stripped, and the developer settings entry and its
developer-only rows are not compiled into the release menu.

## Support the project

- **USDT:** [`0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1`](https://etherscan.io/address/0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1)
- **Patreon:** https://www.patreon.com/chortdev/
- **Boosty:** https://boosty.to/chortdev
- **Discord (flat2VR):** https://discord.com/channels/747967102895390741/1546924467832225863
- **YouTube:** https://www.youtube.com/@chortdev

## Thanks

Thanks to the flat2VR community, everyone who reported bugs with logs, the
Dead Space modding community, and the maintainers of the open VR, graphics and
streaming tools this project builds on.
