# LegacyCraft

An open-source Android launcher project for **Minecraft: Java Edition 1.7.10** with touch controls and Forge 1.7.10 mod support.

> **Status: Milestone 1 (runtime proof) is NOT yet verified.**
> Nothing here has been shown running Minecraft on a device. Do not treat this repo as a working launcher until the milestone table below says so, with logs.

LegacyCraft does not include Minecraft files and does not bypass authentication.
You need a legitimate Minecraft: Java Edition account. Minecraft is a trademark of Mojang Studios / Microsoft; this project is not affiliated with them.

## Approach

We do not rewrite the runtime. LegacyCraft builds on [Amethyst-Android](https://github.com/AngelAuraMC/Amethyst-Android)
(LGPLv3, successor of PojavLauncher), which already provides an Android OpenJDK 8, LWJGL3 + LWJGLX (LWJGL2 compatibility), GL4ES/OpenGL translation, OpenAL, touch input and Forge installer support.

This repo contains only what we add:

| Path | Purpose |
|---|---|
| `UPSTREAM_REF` | Pinned upstream commit |
| `scripts/bootstrap.sh` | Fetches upstream, applies `overlay/` and `patches/` |
| `scripts/build.sh` | Builds the debug APK |
| `overlay/`, `patches/` | Our changes (empty until Milestone 1 shows what is needed) |
| `.github/workflows/build.yml` | CI build, no Android Studio needed |

## Build (GitHub Actions)

Push to `main`, or run **Actions → Build LegacyCraft APK → Run workflow**.
Download the `LegacyCraft-debug-apk` artifact. If the build fails, download `build-logs` and send it along.

## Milestones

| # | Milestone | Status |
|---|---|---|
| 1 | Runtime proof: unmodified 1.7.10 starts with real assets and login | Not verified |
| 2 | Vanilla gameplay: load, move, save, exit, relaunch | Not started |
| 3 | Touch controls usable on a phone | Not started |
| 4 | Forge 1.7.10 + a small mod | Not started |
| 5 | Public release, docs, notices | Not started |

See [docs/MILESTONE1.md](docs/MILESTONE1.md) for how to test Milestone 1 on a device.

## Licenses

See [NOTICE.md](NOTICE.md). The LWJGLX license is listed upstream as "unknown" and must be checked before any public release.
