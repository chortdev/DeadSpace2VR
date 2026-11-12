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

**[⬇ Download DS2PCVR 0.3.0](https://github.com/chortdev/DeadSpace2VR/releases/latest)**

## Known issues (being fixed)

- **Low FPS even on strong PCs.** Gameplay often stays around 40–50 FPS. The
  limit is the CPU work of drawing two eyes, not the graphics card, so
  lowering the resolution does not help. 0.1.6 removes one large part of the
  mod's own CPU cost; we are working on the rest. A log from 0.1.6 or newer
  helps (see [Reporting a bug](#reporting-a-bug)). Since 0.1.12 the log also
  shows whether the CPU or the graphics card is the limit: stay about 30
  seconds where FPS drops before you send it. If FPS recovers while you hold
  an object with kinesis, also try `native_tk_preview=off` in `ds2stereo.ini`.
- **Zero-G: the trigger never takes off.** Possible fix: open
  `ds2stereo.ini` in the game folder with Notepad and check that it says
  `station_vr=1`. Setting it to `0` stops shops, benches and save stations
  from opening by themselves, but it also turns off zero-G take-off and
  landing, video message placement and the locator hold.
- **Beta features** (marked *beta* in VR Settings) are new in 0.2.0 and were
  tested by only a few players: teleport, stomp gesture, Full body (IK) and
  the Force Gun's one shot per pump. Tell us on Discord how they work for you.

## What you need

- **Dead Space 2 for PC** (Windows 10 or 11, 64-bit), from Steam, the EA
  app, or the original non-Steam retail release. Each has its own ZIP:
  `-steam` for Steam, `-ea` for the EA app, `-pinned` for the original retail
  version. With the wrong one the mod stays off. Not sure which one you have?
  Check the size of `deadspace2.exe` (right-click → Properties):

  | `deadspace2.exe` size | ZIP |
  |---|---|
  | 48,444,416 bytes | `-steam` |
  | 32,033,696 bytes | `-ea` |
  | 63,201,280 bytes | `-pinned` |
- A PC VR headset with two controllers, connected through **SteamVR**. Quest
  works through Virtual Desktop, Quest Link / Air Link or ALVR.
- A graphics card with Vulkan support (any recent NVIDIA, AMD or Intel card).
- **Windows 11 only:** also install MarkerPatch ([step 6](#install)).

## Install

1. Close Dead Space 2 and SteamVR.
2. Open the game folder (the one with `deadspace2.exe`). On Steam:
   right-click **Dead Space 2** → **Manage** → **Browse local files**. For the
   EA app or the retail version it is the folder you picked when installing.
3. Download `DS2PCVR-0.3.0-steam.zip` (Steam), `DS2PCVR-0.3.0-ea.zip`
   (EA app) or `DS2PCVR-0.3.0-pinned.zip` (original retail) and extract it
   anywhere.
4. Open the extracted `DS2PCVR-0.3.0` folder, select everything
   (**Ctrl+A**), copy (**Ctrl+C**), and paste it into the game folder
   (**Ctrl+V**). If Windows asks, choose **Replace**.
5. Start your headset link and SteamVR, then start Dead Space 2.
6. **Windows 11 only:** set up [MarkerPatch](#windows-11-markerpatch).
7. **Steam Frame or Valve Index controllers:** import the SteamVR binding
   ([steps below](#steam-frame-and-valve-index-controllers)).

In the game, open **Settings → VR Settings** to pick standing or seated play
and how you turn. Left-handed? **VR Settings → Hands and weapons → Hand mode**.

### Steam Frame and Valve Index controllers

Beta. SteamVR's default bindings for older games don't fit these
controllers. On the Frame, the right X and Y don't work as X and Y. On the
Index, A acts as grip. The ZIP has a SteamVR binding for each:
`ds2pcvr-binding-frame.json` and `ds2pcvr-binding-index.json`. SteamVR
does not read them from the game folder; import the one you need once:

1. In your **Documents** folder, open `steamvr\input` and create a folder
   named `import` there if it doesn't exist.
2. Copy the file for your controller into `Documents\steamvr\input\import`.
3. Start SteamVR and Dead Space 2. In SteamVR open **Settings →
   Controllers → Manage controller bindings → Dead Space 2 → Custom →
   Choose another**. Under **Bindings in the import directory**, pick
   **Dead Space 2 VR - Steam Frame** or **Dead Space 2 VR - Valve Index**
   and import it.

With the Frame binding, A, B, X and Y on the right controller are A, B, X
and Y in the game. On the left controller, **D-pad down** is X and the other
D-pad directions are Y. The bumpers act as the triggers.

With the Index binding, A and B on the right controller are A and B; A and B
on the left controller are X and Y. Grip is squeezing the handle. Without a
binding on the Index, the trigger confirms in game menus.

These bindings are new. Tell us on Discord if one doesn't work for you.

### Update

Copy the new files over the old ones the same way. When Windows says files
already exist, pick **Let me decide for each file** and **keep your old**:
`ds2stereo.ini`, `ds2calibration.ini`, `ds2twohand.ini`, `ds2scene.ini`.
Replace everything else. Your VR Settings choices are kept either way.

The ZIP also has `install.bat`, an optional installer that does the same
copy with backups. You don't need it. Since 0.1.13, running it over an
installed build updates it: your `ds2stereo.ini` and the backups from the
first install are kept.

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

- **Steam Frame and Valve Index:** import the SteamVR binding from the ZIP,
  see [Steam Frame and Valve Index controllers](#steam-frame-and-valve-index-controllers).
- **Vive wands:** press the lower edge of the trackpad for A / X; the menu
  button is B / Y; the trackpad centre click is the stick click.
- **Other controllers without an A button:** the trigger confirms in game menus,
  so you can always reach **Controller buttons**.

**Moving**

| Do this | How |
|---|---|
| Walk | Left stick |
| Run | Click the left stick (on/off). Run speed: **VR Settings → Movement and turning → Run speed** (x1.1 is the speed of earlier versions) |
| Turn | Turn your body, or push the right stick |
| Recenter the view | Use your headset's own recenter: hold the Oculus / Meta button on Quest, or **Reset view** in SteamVR (since 0.2.1). F8 on the keyboard also works |
| Teleport (beta) | Turn it on in **VR Settings → Movement and turning → Teleport (beta) → Teleport**. Push the left stick forward to aim the arc from your left hand, let go to go there |
| Pause menu | Click both sticks (keep them centred) |

**Fighting**

| Do this | How |
|---|---|
| Aim (weapon or flashlight) | Hold the right grip |
| Shoot | Right trigger while aiming |
| Alternate fire | B while aiming |
| Reload | Click the right stick, or [reload by hand](#reloading-by-hand) |
| Melee | Punch, or swing the gun |
| Stomp (beta) | Look down and drive both hands down fast, together. On by default since 0.3.0; switch it off in **VR Settings → Abilities, RIG and store → Stomp gesture (beta)** |
| Change weapon | Right grip over your shoulder or at your hip; each spot gives back the weapon you last used there. Or pull the right trigger with the right grip open: the game's weapon hologram appears; point either hand at a weapon and let go of the trigger to take it (squeezing the grip closes it) |
| Kinesis (grab objects) | Point your left hand at something and hold the left grip; pull the left trigger to throw |
| Stasis (slow enemies) | Point your left hand and pull the left trigger, or press Y. A thin aim ray can show where it goes: **VR Settings → Abilities, RIG and store → Stasis aim ray (left hand)** |
| Heal / refill stasis | Put your left hand on the pack at the front of your hip, grip, then pull the trigger. With your hand on a pack the grip takes the pack, even if kinesis points at an object |

**Everything else**

| Do this | How |
|---|---|
| Use, open doors, talk | A, or reach quickly toward the door panel, store, bench or item |
| Path line (locator) | Hold X; while holding, pull the left trigger or grip to change the destination |
| Inventory (RIG) | Left grip next to your left temple |
| Inventory, shops, benches, saving | Point with your left hand, pull the left trigger to choose |
| Use your gun hand in the inventory, shops, benches and save stations | Point the right hand at the panel and pull its trigger once: that ray becomes the bright one and the other turns faint. Pull again to choose. Pull the other hand's trigger on the panel to switch back |
| Store items in the safe | In a store, hold the grip on an item in the **Inventory** tab and let go over the **Safe** tab (and back the same way). In the Sell tab a grip tap on an item moves it to the safe |
| Buy or sell with one click, or confirm first | **VR Settings → Abilities, RIG and store → Store: buy/sell in one click** |
| A / B at shops and benches | A confirms, B goes back. A also closes "schematic downloaded" / new item |
| Game menus | Either stick to move, A to choose, B to go back |
| Open crates and loot bodies | Punch or shoot them |
| Hacking | Twist your right hand to find the blue spots, then pull the right trigger |
| Shake off creatures, break free | Shake the controllers hard (A still works) |
| Crawl through vents | Grip with either hand and pull yourself along, like holding a handrail. The left stick still works |
| Zero-G: take off / land | Pull the right trigger with the right grip open |
| Zero-G: fly | Left stick; steer with your head. The right stick turns you in any direction |
| Zero-G: boost | Click the left stick while flying (on/off) |

### Reloading by hand

Since 0.2.0 every gun can be reloaded by hand: Plasma Cutter, Pulse Rifle,
Ripper, Line Gun, Flamethrower, Javelin Gun, Seeker Rifle, Force Gun, Contact
Beam, Detonator and Rivet Gun.

Put your left hand on the glowing part of the gun and squeeze the left grip.
Some guns show a label at that part:

- **Pulse Rifle:** push the part with your open hand, or flick the gun down
  and up (FLICK DOWN / FLICK UP).
- **Contact Beam:** pull the part and keep holding while the reload plays
  (PULL AND HOLD). Letting go cancels it.
- **Detonator:** punch the clip out (PUNCH); the new clip seats as soon as it
  touches the socket.
- **Force Gun:** pump it with your left hand (PUMP). By default it fires once
  per pump, turn that off in **VR Settings → Hands and weapons → Force Gun:
  pump after each shot (beta)**.
- **Flamethrower:** turn your wrist to turn the canister.

Since 0.1.13:

- When the clip is empty, the part that starts the reload blinks until your
  left hand is near it. With a new clip in your hand, the place it goes
  blinks too, and glows steadily when the clip is close enough to push in.
  The last step (if the gun has one) blinks until you reach it.
- A full clip can be reloaded by hand too. The motion plays and no ammo is
  used.
- Let go of the part you are pulling out before it is done, and the reload
  ends at once: the gun is ready.
- Aim and pull the trigger during a reload: the reload stops and the gun
  fires with that same pull. Hold the trigger to keep firing.

A click of the right stick still reloads every gun. To turn hand reloading
off: **VR Settings → Hands and weapons → Manual reload (beta)**.

### New in 0.3.0

**Combat**
- Alternate fire works again (B while aiming), including the Plasma Cutter's
  rotate. Before, it only worked while kinesis held an object.
- Fast punches one right after another all land, and you can punch during a
  manual reload.
- Stomp (beta) is on by default. The view no longer shakes during the stomp,
  your legs show, and the gun stays in your hand. Switch it in **VR Settings →
  Abilities, RIG and store → Stomp gesture (beta)**.
- Gun recoil (**Hands and weapons → Gun inertia and recoil (beta)**): new
  strength per gun; the gun also kicks back, not only up; half as strong with
  two hands. A shot gives a medium vibration on the gun hand.

**Weapon hologram (D-pad weapons)**
- Pull the right trigger with the right grip open: the game's weapon hologram
  appears. Point either hand at a weapon and let go of the trigger to take it;
  squeezing the grip closes it. A green ring and a short vibration mark the
  weapon you point at. The hologram does not turn with your head.

**Kinesis and stasis**
- Objects held with kinesis stay at your hand while you walk.
- A no longer drops the held object. Holding an object gives a medium
  vibration.
- With your left hand on a stasis or health pack, the grip takes the pack,
  even if kinesis points at something.
- Train hang: the left trigger fires stasis.

**Reloading by hand**
- The ammo clip grab zone at the hip is half the size.
- Pulse Rifle: reload only with the down/up flick of the gun. A flick needs a
  quick snap and counts only straight up/down moves.
- Flamethrower: the fuel canister glows, and the hand turns anticlockwise with
  the twist.

**Inventory (RIG)**
- The RIG opens while you aim or reload.
- With the RIG open the right grip no longer re-opens it; grip and trigger on
  the panel go to the inventory only.

**Calibrate game**
- The T-pose step runs only with Arm coverage "Full body (IK, beta)".
- New step: ammo clip position at the hip (when manual reload is on).
- Height calibration no longer locks your view height. The game keeps its
  automatic eye height and uses your measured height as a reference. If you
  calibrated with an older version, run Calibrate game again or set Eye height
  back to Automatic.

**Full body (IK, beta)**
- The chest faces forward when you stand still, and the body no longer jumps
  when you start or stop walking.
- The helmet sits higher and a little further back. To adjust it yourself:
  **Hands and weapons → Arm coverage** (set to Full body), press A.
- The legs move in the straitjacket section.

**Movement**
- Teleport (beta) goes to the farthest spot you can reach instead of showing
  a red path.
- Straitjacket section: teleport works and its path is drawn; stick walking
  has no stock movement inertia.
- Vents: the helmet collides with walls and ceiling.

**Other**
- Shake off / break free: the prompt shows the controllers with up/down
  arrows.
- Video messages appear further left.
- VR Settings: "Telekinesis, stasis, stomp" and "RIG and store" are one page,
  **Abilities, RIG and store**.

Updating from 0.2.x keeps your `ds2stereo.ini`: stomp and the weapon hologram
stay off there. Turn stomp on in VR Settings; for the hologram set
`thumbrest_weapon_select=native` in `ds2stereo.ini`.

### New in 0.2.2

- **Fast RIG actions** (VR Settings → Telekinesis, stasis, stomp, since 0.3.0 Abilities, RIG and store; both off by
  default). **RIG weapons: trigger equips, grip moves:** in the RIG, pull the
  trigger on a weapon to take it in your hand, or squeeze the grip to start
  moving it, with no Equip / Move menu. **RIG items: trigger uses, grip
  drops:** pull the trigger on an item to use it, or squeeze the grip to drop
  it, with no Use / Drop menu.
- **Stasis fires on:** the trigger pull, or the trigger release with the aim
  ray shown while you hold the trigger.
- **Gun recoil:** part of **Hands and weapons → Gun inertia and recoil (beta)**.
- VR Settings are regrouped: Turning and comfort, Hands and weapons,
  Telekinesis/stasis/stomp, Teleport (beta), Display and anti-aliasing,
  Controller buttons. The 0.2.0 list below uses the old page names.
- The helmet visor effects (dark rim, breath fog, cracks at low health) are
  off by default. Add `helmet_visor=0.5` to `ds2stereo.ini` to bring them back
  (0 = off, 1 = strongest).

### New VR Settings in 0.2.0

- **VR features** (Settings → VR Settings → VR features): teleport (beta) with
  fade time, speed, range and "Stick also walks"; stasis aim ray (Never /
  finger on the left trigger / while holding the kinesis grip / Always); stomp
  gesture (beta); finger tracking (from the controller's trigger, grip and thumb
  touch, or from Quest hand tracking).
- **Hand features → Gun and TK lasers / color:** turn the gun and kinesis
  lasers on or off and pick their colour.
- **Hand features → Arm coverage → Full body (IK, beta):** the whole body
  follows your head and hands.

### Subtitles

Since 0.1.13, spoken dialogue subtitles are placed for the headset: at the
bottom of the view, at 75% size.

## Windows 11: MarkerPatch

On Windows 11 the game needs [MarkerPatch](https://github.com/Wemino/MarkerPatch)
by Wemino. It works together with this mod. Use it on Windows 10 too if Dead
Space 2 does not start at all, even without this mod. That happens on CPUs with
many cores, for example Intel 12th–14th gen.

1. Download `MarkerPatch.zip` from the
   [MarkerPatch releases](https://github.com/Wemino/MarkerPatch/releases) and
   extract it into the game folder.
2. Since 0.1.9 the mod sets these six lines to `0` in `MarkerPatch.ini` at
   every start (the original is kept as `MarkerPatch.ini.before-ds2pcvr`).
   On older versions open `MarkerPatch.ini` with Notepad, set them to `0`,
   and save:

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
  the EA app, `-pinned` for the original retail version; see the size table
  under [What you need](#what-you-need)).
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
- **Frame rate falls to about 30 once you hold a gun, and comes back while
  holding something with kinesis or at a save station** (some non-Steam
  copies): fixed in 0.1.13. The mod re-checked its game files every frame.
- **Game needs closing twice:** the "Are you sure you want to quit?" box
  opens on the desktop, not in the headset. Since 0.1.13 the mod answers it
  for you.
- **Heavy full-screen blur or depth-of-field lines** (final boss): turn them
  off in **VR Settings → Display and comfort → Gameplay blur**.
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
  vignette. Turn it off in **VR Settings → Movement and turning → Movement
  vignette**.
- **Zero-G: the right trigger does not take off** (since 0.2.0 it is the right
  trigger with the right grip open, not both triggers): first check `station_vr=1` in
  `ds2stereo.ini` (see [Known issues](#known-issues-being-fixed)). If it is
  already `1`, send the log from that room (since 0.1.7 it records why).
- **A button does nothing or does the wrong thing** (Index, Vive, WMR and
  other non-Quest controllers): remap it in **VR Settings → Controller
  buttons** (see [Controls](#controls-quest-touch)).
- **Manual reload never starts** (the glow does not show and the left grip does
  nothing at the gun): fixed in 0.1.11. Earlier packages were missing the
  reload setup files (`ds2reload-*.profile`); copy all files of 0.1.11 into
  the game folder. Other weapons still reload with a right-stick click.
- **Melee hits (hand or gun) do nothing above 60 Hz:** fixed in 0.1.10. On older
  versions set the headset's refresh rate to 60 Hz.
- **VR Settings says "(save failed)" and values do not change, or no
  `ds2stereo.log` appears:** the game folder is read-only (EA's default
  `C:\Program Files\EA Games`). Since 0.1.10 the mod then keeps its settings
  and log in `%LOCALAPPDATA%\DS2PCVR`. On older versions set `out_dir=` in
  `ds2stereo.ini` to a folder you can write, for example
  `out_dir=C:\Users\<you>\Documents\DS2PCVR` (create the folder first).

## Reporting a bug

Send us:

- `ds2stereo.log` from the game folder, or from `%LOCALAPPDATA%\DS2PCVR` when
  the game folder is read-only (0.1.10+) (a new one is written every launch;
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
