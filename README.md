<p align="center">
  <a href="https://www.patreon.com/chortdev/"><img alt="Patreon" src="https://img.shields.io/badge/Patreon-chortdev-FF424D?style=for-the-badge&amp;logo=patreon&amp;logoColor=white"></a>
  <a href="https://boosty.to/chortdev"><img alt="Boosty" src="https://img.shields.io/badge/Boosty-chortdev-F05A2D?style=for-the-badge&amp;logo=boosty&amp;logoColor=white"></a>
  <a href="https://etherscan.io/address/0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1"><img alt="USDT ERC-20 wallet: 0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1" src="https://img.shields.io/badge/USDT-0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1-26A17B?style=for-the-badge&amp;logo=tether&amp;logoColor=white"></a>
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

The release build omits the Developer settings page and its developer-only
calibration menu. The public **Calibrate game** flow remains available.

## Requirements

- Windows 10 or Windows 11, 64-bit.
- The current release supports the original 32-bit Steam PC version of
  Dead Space 2. The installer verifies the executable before changing
  anything and rejects unsupported builds.
- An OpenVR-compatible runtime and headset (for example SteamVR, or a Quest
  streaming setup that presents OpenVR controllers).
- Two tracked motion controllers.
- A Vulkan-capable GPU and driver. The release ships the 32-bit DXVK 2.7.1
  renderer and renders through it by default.

| Your game | Download | `deadspace2.exe` SHA-256 |
|---|---|---|
| Steam | [DS2PCVR-0.1.1-steam.zip](DS2PCVR-0.1.1-steam.zip) | `f72f15b8a6aced7970569e66e4eaabf322a5fdd7b58e9030fdea268d770d1d7f` |

Not sure which you have? In PowerShell:

```powershell
Get-FileHash "C:\path\to\Dead Space 2\deadspace2.exe"
```

Other versions of `deadspace2.exe` are not supported.

## Installation

1. Close Dead Space 2 and SteamVR.
2. Back up the game folder.
3. Extract the ZIP anywhere outside the game folder, for example to
   `Downloads`. It creates a `DS2PCVR-<version>` folder.
4. In that folder, double-click `install.bat` and paste the game folder path
   when asked (the folder that contains `deadspace2.exe`). From a command
   prompt you can also run `install.bat "C:\path\to\Dead Space 2"`.
5. Start SteamVR, then start the game.
6. Open the game's **Settings → VR Settings** page and select your play
   position and turning preference; hand mode is on the **Hand features**
   page.

To remove the mod, run:

```bat
install.bat "C:\path\to\Dead Space 2" -Uninstall
```

To update, uninstall the old version, then install the new one. Your settings
and calibration stay in the game folder (`ds2stereo.ini`, `ds2vr-settings.ini`,
`ds2calibration.ini`, `ds2twohand.ini`, `ds2scene.ini`, `ds2hud.ini`). The
installer keeps them and only refreshes the folder paths in `ds2stereo.ini`.

Uninstall also removes the bundled renderer and restores a
`dxvk_d3d9.dll` that was already in the folder before installation.

## Renderer

The installer places `dxvk_d3d9.dll` (DXVK 2.7.1, 32-bit) next to
`deadspace2.exe` and `ds2stereo.ini` defaults to:

```ini
real_d3d9=dxvk_d3d9.dll
vr_transport=dxvk
```

The release also installs `dxvk.conf` with `d3d9.maxFrameRate = 120` and
`d3d9.presentInterval = 0` (120 FPS cap, vsync disabled). An existing
`dxvk.conf` is backed up during installation and restored on uninstall.

DXVK is the tested launch renderer and the direct Vulkan eye transport avoids
the CPU readback path. If the game does not start on your GPU or you prefer the
system renderer, close the game and change those two lines to:

```ini
real_d3d9=
vr_transport=cpu
```

Your graphics driver must support Vulkan. DXVK writes its own `dxvk.log` in the
game folder when it hits a driver problem.

## MarkerPatch (required for Windows 11)

[MarkerPatch](https://github.com/Wemino/MarkerPatch) by Wemino is required for
Windows 11. It loads as `dinput8.dll` next to DS2PCVR's `d3d9.dll`, so both run
from the game folder.

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

   It turns off the MarkerPatch options that conflict with VR. The release
   already ships the DXVK frame-cap settings in `dxvk.conf`.

## Logs and bug reports

The installer creates a log folder:

```text
<game folder>\ds2pcvr-logs\<install id>\ds2stereo.log
```

The log path is written as `out_dir` in `ds2stereo.ini`. Each launch
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

Release archives contain the runtime files, default calibration, the installer
helpers, the documentation, third-party notices and a SHA-256 manifest that
the installer verifies. They do not contain source code, tests or
developer packages; the installer scripts are the only command-line helpers.
Release DLLs are stripped, and the developer settings entry and its
developer-only rows are not compiled into the release menu.

## Support the project

- **USDT (ERC-20, Ethereum network only):** [`0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1`](https://etherscan.io/address/0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1)
- **Patreon:** https://www.patreon.com/chortdev/
- **Boosty:** https://boosty.to/chortdev
- **Discord (flat2VR):** https://discord.com/channels/747967102895390741/1546924467832225863
- **YouTube:** https://www.youtube.com/@chortdev

## Thanks

Thanks to the flat2VR community, everyone who reported bugs with logs, the
Dead Space modding community, and the maintainers of the open VR, graphics and
streaming tools this project builds on.
