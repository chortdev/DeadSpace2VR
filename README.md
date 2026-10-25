<p align="center">
  <a href="https://www.patreon.com/chortdev/"><img alt="Patreon" src="https://img.shields.io/badge/Patreon-chortdev-FF424D?style=for-the-badge&amp;logo=patreon&amp;logoColor=white"></a>
  <a href="https://boosty.to/chortdev"><img alt="Boosty" src="https://img.shields.io/badge/Boosty-chortdev-F05A2D?style=for-the-badge&amp;logo=boosty&amp;logoColor=white"></a>
  <a href="https://etherscan.io/address/0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1"><img alt="USDT ERC-20 wallet: 0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1" src="https://img.shields.io/badge/USDT-0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1-26A17B?style=for-the-badge&amp;logo=tether&amp;logoColor=white"></a>
  <a href="https://discord.com/channels/747967102895390741/1546924467832225863"><img alt="Discord flat2VR" src="https://img.shields.io/badge/Discord-flat2VR-5865F2?style=for-the-badge&amp;logo=discord&amp;logoColor=white"></a>
  <a href="https://www.youtube.com/@chortdev"><img alt="YouTube" src="https://img.shields.io/badge/YouTube-%40chortdev-FF0000?style=for-the-badge&amp;logo=youtube&amp;logoColor=white"></a>
</p>

# Dead Space 2 VR

Play the PC version of **Dead Space 2** in VR with motion controllers: aim
with your hand, reload by hand, grab things with kinesis, and fly in zero-G.

The mod is a set of files you copy into the game folder. It does not change
the game's own files, so deleting it brings the normal game back.

Unofficial fan project, not affiliated with or endorsed by Electronic Arts.
Dead Space 2 belongs to its owner.

**[⬇ Download DS2PCVR 0.1.8](https://github.com/chortdev/DeadSpace2VR/releases/latest)**

## Known issues (being fixed)

- **Low FPS even on strong PCs.** Gameplay often stays around 40–50 FPS. The
  limit is the CPU work of drawing two eyes, not the graphics card, so
  lowering the resolution does not help. 0.1.6 removes one large part of the
  mod's own CPU cost; we are working on the rest. A log from 0.1.6 or newer
  helps (see [Reporting a bug](#reporting-a-bug)).
- **Zero-G: both triggers never take off.** Possible fix: open
  `ds2stereo.ini` in the game folder with Notepad and check that it says
  `station_vr=1`. Setting it to `0` stops shops, benches and save stations
  from opening by themselves, but it also turns off zero-G take-off and
  landing, video message placement and the locator hold.

## What you need

- **Dead Space 2 for PC** (Windows 10 or 11, 64-bit), from Steam or the EA
  app. Each has its own ZIP: `-steam` for Steam, `-ea` for the EA app. With
  the wrong one the mod stays off.
- A PC VR headset with two controllers, connected through **SteamVR**. Quest
  works through Virtual Desktop, Quest Link / Air Link or ALVR.
- A graphics card with Vulkan support (any recent NVIDIA, AMD or Intel card).
- **Windows 11 only:** also install MarkerPatch ([step 6](#install)).

## Install

1. Close Dead Space 2 and SteamVR.
2. Open the game folder (the one with `deadspace2.exe`). On Steam:
   right-click **Dead Space 2** → **Manage** → **Browse local files**. On the
   EA app it is the folder you picked when installing.
3. Download `DS2PCVR-0.1.8-steam.zip` (Steam) or `DS2PCVR-0.1.8-ea.zip`
   (EA app) and extract it anywhere.
4. Open the extracted `DS2PCVR-0.1.8` folder, select everything
   (**Ctrl+A**), copy (**Ctrl+C**), and paste it into the game folder
   (**Ctrl+V**). If Windows asks, choose **Replace**.
5. Start your headset link and SteamVR, then start Dead Space 2.
6. **Windows 11 only:** set up [MarkerPatch](#windows-11-markerpatch).

In the game, open **Settings → VR Settings** to pick standing or seated play
and how you turn. Left-handed? **VR Settings → Hand features → Hand mode**.

### Update

Copy the new files over the old ones the same way. When Windows says files
already exist, pick **Let me decide for each file** and **keep your old**:
`ds2stereo.ini`, `ds2calibration.ini`, `ds2twohand.ini`, `ds2scene.ini`.
Replace everything else. Your VR Settings choices are kept either way.

The ZIP also has `install.bat`, an optional installer that does the same
copy with backups. You don't need it.

### Uninstall

Delete `d3d9.dll` from the game folder. The game then starts without VR.

## Controls (Quest Touch)

A and B are on the right controller, X and Y on the left. Left-handed mode
swaps the hands. Tutorial tips in the game show these VR controls.

Other controllers (Index, Vive, Windows Mixed Reality, Pico…): if a button
does the wrong thing, open **VR Settings → Controller buttons** (since 0.1.8).
Pick **Left** or **Right** in the first row, select a button (A / X, B / Y,
Grip, Stick click or Stick), confirm, then within 5 seconds press the button on
that controller that should do this job (for **Stick**, push the stick or pad
forward). The change is saved for that controller model only, in
`ds2vr-controllers.ini`. **Reset this controller** goes back to the default.

**Moving**

| Do this | How |
|---|---|
| Walk | Left stick |
| Run | Click the left stick (on/off) |
| Turn | Turn your body, or push the right stick |
| Pause menu | Click both sticks (keep them centred) |

**Fighting**

| Do this | How |
|---|---|
| Aim (weapon or flashlight) | Hold the right grip |
| Shoot | Right trigger while aiming |
| Alternate fire | B while aiming |
| Reload | Click the right stick, or [reload by hand](#reloading-by-hand) |
| Melee | Punch, or swing the gun |
| Change weapon | Right grip over your shoulder or at your hip; each spot gives back the weapon you last used there |
| Kinesis (grab objects) | Point your left hand at something and hold the left grip; pull the left trigger to throw |
| Stasis (slow enemies) | Point your left hand and press Y |
| Heal / refill stasis | Put your left hand on the pack at the front of your hip, grip, then pull the trigger |

**Everything else**

| Do this | How |
|---|---|
| Use, open doors, talk | A |
| Path line (locator) | Hold X; while holding, pull the left trigger or grip to change the destination |
| Inventory (RIG) | Left grip next to your left temple |
| Inventory, shops, benches, saving | Point with your left hand, pull the left trigger to choose |
| Game menus | Either stick to move, A to choose, B to go back |
| Open crates and loot bodies | Punch or shoot them |
| Hacking | Twist your right hand to find the blue spots, then pull the right trigger |
| Zero-G: take off / land | Pull both triggers |
| Zero-G: fly | Left stick; steer with your head |
| Zero-G: boost | Click the left stick while flying (on/off) |

### Reloading by hand

These weapons can be reloaded by hand:

- Plasma Cutter
- Javelin Gun
- Flamethrower
- Line Gun

Put your left hand on the glowing part of the gun and squeeze the left grip.
Other weapons reload with a click of the right stick. To turn hand reloading
off: **VR Settings → Hand features → Manual reload (beta)**.

## Windows 11: MarkerPatch

On Windows 11 the game needs [MarkerPatch](https://github.com/Wemino/MarkerPatch)
by Wemino. It works together with this mod.

1. Download `MarkerPatch.zip` from the
   [MarkerPatch releases](https://github.com/Wemino/MarkerPatch/releases) and
   extract it into the game folder.
2. Open `MarkerPatch.ini` (in the game folder) with Notepad, set these six
   lines to `0`, and save:

   ```ini
   FixSuitChangeTiming = 0
   FixHazardSuitIcon = 0
   RawMouseInput = 0
   AutoHideMouseCursor = 0
   ImprovedAntiAliasingMode = 0
   AchievementSupport = 0
   ```

   (Or run [`MarkerPatch-VR.ps1`](MarkerPatch-VR.ps1) from the game folder in
   PowerShell as administrator; it sets the same lines.)

## Problems?

- **No VR, normal game starts:** make sure SteamVR is running before the
  game, and that the ZIP matches your game (`-steam` for Steam, `-ea` for
  the EA app).
- **Game crashes on start:** open `ds2stereo.ini` in the game folder with
  Notepad, change these two lines, and save:

  ```ini
  real_d3d9=
  vr_transport=cpu
  ```

- **Game shows on a flat screen in SteamVR, or the menus break, after picking
  a very high resolution:** since 0.1.7 the mod lowers a saved resolution above
  8192 at start. Otherwise close the game, open
  `%LOCALAPPDATA%\EA Games\Dead Space 2\settings.txt` with Notepad, set
  `Window.Width = 1920` and `Window.Height = 1080`, and save.
- **Menu cursor creeps up by itself and nothing can be selected** (goes away
  when the mouse is unplugged): fixed in 0.1.7. It happened when the game
  resolution was more than twice your monitor's height or width. On older
  versions, unplug the mouse or pick a lower resolution.
- **Low frame rate or stutter in big rooms:** pick a lower resolution in the
  game's video settings (sizes above about 4500 wide stutter on many PCs). If
  it is still slow, play for a minute where it is slow, then send us the log
  (it records frame timings).
- **Stretched triangles around enemies:** motion blur. Since 0.1.7 the mod
  turns it off at every start. In the game it is under **Settings → Video →
  Advanced**, which unlocks when **Quality** is set to **Customizable**.
- **Something shows in one eye only** (fire, holograms, shadows, a darker
  eye): fixed in 0.1.7; the heat haze above fire in 0.1.8. If you still see
  it, send a screenshot of each eye and the log.
- **Pause menu opens while walking and turning** (Index, Pimax controllers):
  those sticks click when pushed hard. Since 0.1.7 a both-stick click with a
  stick pushed is not a pause. If it still happens, send the log.
- **Dark ring at the edge of the view while moving:** that is the comfort
  vignette. Turn it off in **VR Settings → Turning / vignette → Movement
  vignette**.
- **Zero-G: both triggers do not take off:** first check `station_vr=1` in
  `ds2stereo.ini` (see [Known issues](#known-issues-being-fixed)). If it is
  already `1`, send the log from that room (since 0.1.7 it records why).
- **A button does nothing or does the wrong thing** (Index, Vive, WMR and
  other non-Quest controllers): remap it in **VR Settings → Controller
  buttons** (see [Controls](#controls-quest-touch)).

## Reporting a bug

Send us:

- `ds2stereo.log` from the game folder (a new one is written every launch;
  older ones are kept as `ds2stereo-<date>-<time>.log`; logs from before
  0.1.5 of an `install.bat` install are in the `ds2pcvr-logs` folder);
- on versions before 0.1.8 also `ds2stereo.ini` and `ds2vr-settings.ini`
  from the game folder (since 0.1.8 the log contains every settings file);
- your headset, how it connects (Virtual Desktop, Link, ALVR…) and your
  graphics card;
- what you did when it happened, plus a screenshot or short video if you can.

Post it on [GitHub Issues](https://github.com/chortdev/DeadSpace2VR/issues)
or in the [flat2VR Discord](https://discord.com/channels/747967102895390741/1546924467832225863).

## Support the project

- **Patreon:** https://www.patreon.com/chortdev/
- **Boosty:** https://boosty.to/chortdev
- **USDT (ERC-20, Ethereum network only):** [`0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1`](https://etherscan.io/address/0xB1C5A0da905a198026c813d1FE7C93A08DcEb2e1)
- **YouTube:** https://www.youtube.com/@chortdev

## Thanks

Thanks to the flat2VR community, everyone who sent bug reports with logs, the
Dead Space modding community, and the makers of the open VR and graphics tools
this mod builds on ([DXVK](https://github.com/doitsujin/dxvk),
[OpenVR](https://github.com/ValveSoftware/openvr)).
