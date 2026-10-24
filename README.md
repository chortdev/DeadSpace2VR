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

### What's new in 0.1.3

- **Zero-G fix:** pulling both triggers now answers every take-off or landing
  the game waits for, including while the first zero-G tutorial tip ("Pull
  both triggers") is on screen. Before, that tip could leave both triggers
  doing nothing. If take-off still fails for you, please send
  `ds2stereo.log`: it now records each both-trigger press in zero-G areas.
- **Simpler install:** copy the files into the game folder; no scripts needed.
- A full controller reference ([Controls](#controls-quest-touch)).
- From 0.1.2: shadow maps are drawn once for both eyes and the hand filter is
  cheaper, which raises the frame rate on CPU-limited PCs.

## Features

- Same-frame stereoscopic VR through OpenVR/SteamVR, with SBS and flat output
  modes for desktop testing.
- Head tracking with seated/standing play, snap or smooth turning, movement
  vignette, height calibration and physical room-scale steps.
- Motion-controller hands ([controls](#controls-quest-touch)), tracked weapon model, two-hand weapon grip and
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
  Dead Space 2. The mod checks the executable at startup and stays off on
  any other build.
- An OpenVR-compatible runtime and headset (for example SteamVR, or a Quest
  streaming setup that presents OpenVR controllers).
- Two tracked motion controllers.
- A Vulkan-capable GPU and driver. The release ships the 32-bit DXVK 2.7.1
  renderer and renders through it by default.

| Your game | Download | `deadspace2.exe` SHA-256 |
|---|---|---|
| Steam | [DS2PCVR-0.1.3-steam.zip](DS2PCVR-0.1.3-steam.zip) | `f72f15b8a6aced7970569e66e4eaabf322a5fdd7b58e9030fdea268d770d1d7f` |

Not sure which you have? In PowerShell:

```powershell
Get-FileHash "C:\path\to\Dead Space 2\deadspace2.exe"
```

Other versions of `deadspace2.exe` are not supported.

## Installation

No scripts are needed: copy the files into the game folder.

1. Close Dead Space 2 and SteamVR.
2. Find the game folder: in Steam, right-click **Dead Space 2** →
   **Manage** → **Browse local files**. It is the folder that contains
   `deadspace2.exe`.
3. Extract the ZIP anywhere, for example to `Downloads`, and open the
   `DS2PCVR-<version>` folder inside it.
4. Select all files in that folder (**Ctrl+A**), copy them (**Ctrl+C**) and
   paste them into the game folder (**Ctrl+V**). If Windows asks about a
   `dxvk.conf` that is already there, replace it.
5. Start your headset link (Virtual Desktop, Quest Link/Air Link or ALVR) and
   SteamVR, then start Dead Space 2 from Steam.
6. In the game, open **Settings → VR Settings** and choose your play position
   (standing or seated) and turning. Left-handed players: **VR Settings →
   Hand features → Hand mode**.

The game loads the mod by itself from `d3d9.dll` in the game folder. The mod
checks `deadspace2.exe` at startup and stays off on an unsupported version.
`install.bat`, `install.ps1`, `profile.json`, `SHA256SUMS`, `README.md`,
`THIRD-PARTY-NOTICES.txt` and `vr-settings-native-abi.json` are not used by
the game; copying them along does no harm.

### Updating

Copy the new files over the old ones the same way. When Windows says files
already exist, choose **Let me decide for each file** and keep your copies of
these settings files (skip them):

- `ds2stereo.ini`
- `ds2calibration.ini`
- `ds2twohand.ini`
- `ds2scene.ini`

Replace everything else. Your VR Settings choices (`ds2vr-settings.ini`,
`ds2hud.ini`) are not in the ZIP, so they always stay.

If you installed an earlier version with `install.bat`, remove it first with
the old folder's `install.bat "C:\path\to\Dead Space 2" -Uninstall`, or
just copy over it and from then on remove the mod by hand (below).

### Removing

Delete `d3d9.dll` from the game folder; the game then starts without VR. To
remove everything, also delete `dxvk_d3d9.dll`, `dxvk.conf`,
`openvr_api.dll`, `ds2hands.exe` and the `ds2*.ini`, `ds2*.bin` and
`ds2stereo*.log` files.

### Installer (optional)

`install.bat` does the same copy with extra checks: it verifies
`deadspace2.exe`, backs up any file it replaces, keeps logs in a
`ds2pcvr-logs` folder and can undo the install. Run it from the extracted
folder (it uses PowerShell internally):

```bat
install.bat "C:\path\to\Dead Space 2"
install.bat "C:\path\to\Dead Space 2" -Uninstall
```

## Controls (Quest Touch)

Right-handed layout. Left-handed mode (**VR Settings → Hand features → Hand
mode**) swaps the two hands. A/B are on the right controller, X/Y on the left.

| Action | Control |
|---|---|
| Move | Left stick |
| Run | Click left stick (toggles) |
| Turn | Turn your body, or the right stick (45° snap; options on **VR Settings → Turning**) |
| Aim weapon or flashlight | Hold right grip |
| Fire | Right trigger while aiming |
| Alternate fire | B while aiming |
| Reload | Click right stick, or grab the glowing part of the gun with the left grip (manual reload) |
| Melee | Punch, or swing the gun |
| Switch weapon | Right grip over your shoulder (top) or at your hip (low); each spot gives back the weapon you last used there |
| Use, open, talk | A |
| Kinesis (TK) | Point the left hand at an object and hold left grip; pull the left trigger to throw it |
| Stasis | Point the left hand and press Y |
| Heal / refill stasis | Left hand on the front hip pack: grip, then pull the trigger. Y with an empty stasis meter also uses a stasis pack |
| Locator (path line) | Hold X; while holding, pull the left trigger or grip to change the target |
| RIG (inventory) | Left grip next to your left temple |
| RIG, shops, benches, save stations | Point with the left hand, pull the left trigger to select |
| Pause menu | Click both sticks |
| Game menus | Either stick to move, A to confirm, B to go back |
| Loot crates and corpses | Punch or shoot them |
| Hacking | Twist the right hand to find the blue weak points, then pull the right trigger |
| Zero-G take off / land | Pull both triggers |
| Zero-G flight | Left stick; steer with your head |
| Zero-G boost | Click left stick while flying (toggles) |

The in-game tutorial tips show these VR controls instead of the gamepad
buttons.

## Renderer

The package includes `dxvk_d3d9.dll` (DXVK 2.7.1, 32-bit), which goes next to
`deadspace2.exe`, and `ds2stereo.ini` defaults to:

```ini
real_d3d9=dxvk_d3d9.dll
vr_transport=dxvk
```

The release also ships `dxvk.conf` with `d3d9.maxFrameRate = 120` and
`d3d9.presentInterval = 0` (120 FPS cap, vsync disabled); without it DXVK caps
Dead Space 2 at 60 FPS. `install.bat` backs up an existing `dxvk.conf` and
restores it on uninstall.

DXVK is the tested launch renderer and the direct Vulkan eye transport avoids
the CPU readback path. If the game does not start on your GPU or you prefer the
system renderer, close the game and change those two lines to:

```ini
real_d3d9=
vr_transport=cpu
```

Your graphics driver must support Vulkan. DXVK writes its own `dxvk.log` in the
game folder when it hits a driver problem.

Since 0.1.2 the spot-light shadow maps are drawn once per frame and shared by
both eyes. If the two eyes ever show different shadows, set `shadow_once=0` in
`ds2stereo.ini` and report it. For a performance report, set `stereo_perf=1`
before the run and attach the log.

## MarkerPatch (required for Windows 11)

[MarkerPatch](https://github.com/Wemino/MarkerPatch) by Wemino is required for
Windows 11. It loads as `dinput8.dll` next to DS2PCVR's `d3d9.dll`, so both run
from the game folder.

Setup:

1. Install DS2PCVR (above).
2. Download `MarkerPatch.zip` from the
   [MarkerPatch releases](https://github.com/Wemino/MarkerPatch/releases) and
   extract it into the game folder, next to `deadspace2.exe`.
3. Open `MarkerPatch.ini` in the game folder with Notepad and set these six
   options to `0` (they conflict with VR), then save:

   ```ini
   FixSuitChangeTiming = 0
   FixHazardSuitIcon = 0
   RawMouseInput = 0
   AutoHideMouseCursor = 0
   ImprovedAntiAliasingMode = 0
   AchievementSupport = 0
   ```

   Or let [`MarkerPatch-VR.ps1`](MarkerPatch-VR.ps1) do it: open PowerShell as
   administrator, go to the game folder, then run the script:

   ```powershell
   cd "C:\path\to\Dead Space 2"
   powershell -ExecutionPolicy Bypass -File .\MarkerPatch-VR.ps1 "C:\path\to\Dead Space 2"
   ```

   The release already ships the DXVK frame-cap settings in `dxvk.conf`.

## Logs and bug reports

The log is `ds2stereo.log` in the game folder. If you used `install.bat`,
it is in a log folder instead:

```text
<game folder>\ds2pcvr-logs\<install id>\ds2stereo.log
```

The log path is `out_dir` in `ds2stereo.ini` (empty = the game folder). Each launch
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
