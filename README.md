# PriorExtinctionFramework

A focused Roblox auto-farm framework for **Prior Extinction**, built by
NameHub.

## Status

- Build: `v0.1.0` — initial release after pivoting away from the
  JurassicBlocky framework.
- Scope is intentionally **auto-farm only**. ESP, combat helpers, fly /
  noclip etc. are not included; they can be added later as separate
  modules once the auto-farm is proven stable.

## Supported games

| PlaceId | Name |
| --- | --- |
| 6698800091 | Prior Extinction (main) |
| 5558588689 | Prior Extinction - Retro |
| 8603641600 | Prior Extinction - Cretaceous Archipelago |

The script refuses to run on any other PlaceId.

## Loadstring

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/kyronshaw912-collab/PriorExtinctionFramework/main/PriorExtinctionFramework.lua"))()
```

## What it does

- **Auto-farm** — picks the nearest AI dinosaur matching the chosen
  target name (Compsognathus, Dryosaurus, Tenontosaurus, etc), moves to
  it, swings, and auto-eats the carcass.
- **Three movement modes** — `Teleport` (instant CFrame, fast but often
  flagged by anti-cheat), `Fly` (BodyVelocity chase, default), `Walk`
  (Humanoid:MoveTo, anti-cheat friendly but slow).
- **Hybrid attack** — simulates a real left-click via `mouse1press` /
  `VirtualUser` AND fires the discovered attack remote in parallel,
  whichever the server actually accepts.
- **Diagnostics tab** — live status, last target / distance, attack
  remote, last fire result, loop tick + phase, plus a `Copy Diagnostics
  + Remote Dump` button so you can paste a full state snapshot.

## Tuning workflow

1. Run the loadstring inside Prior Extinction.
2. Spawn as a dinosaur capable of hunting your target (a juvenile carnivore
   for Compsognathus, etc).
3. Open the **Main** tab, pick a Target, switch Movement Mode to `Fly` if
   the server kicks on teleport, and toggle **Autofarm** on.
4. If kills aren't registering, open the **Diagnostics** tab, hit `Copy
   Diagnostics + Remote Dump`, and share the result. The dump shows which
   attack remote was discovered, what shape last fired, and every remote
   the script can see.

## Build pipeline

`source.lua` is the readable Luau source; `PriorExtinctionFramework.lua`
is the darklua-processed build that ships via loadstring. The
`obfuscate.js` script (run automatically on every `git commit` via the
pre-commit hook) strips Luau type annotations, minifies, removes
comments, and renames locals.

## Files

- `source.lua` — the readable source (gitignored; the build is what ships).
- `PriorExtinctionFramework.lua` — the build that gets `HttpGet`'d.
- `obfuscate.js` — the build pipeline.
- `.darklua.json` — darklua rules.
- `.tools/darklua.exe` — the darklua binary (Windows).
- `README.md` — this file.

## License

Personal use. Not affiliated with Prior Extinction or Jacys Studios.
