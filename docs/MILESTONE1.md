# Milestone 1: runtime proof (test on your phone)

Goal: confirm the unmodified Minecraft 1.7.10 client starts on your device with your own account.
This is a test of the build, not a claim that it works.

1. Run the GitHub Actions workflow and download `LegacyCraft-debug-apk`. Install it (allow unknown sources).
2. Log in with your Microsoft account that owns Minecraft: Java Edition.
3. Install version **1.7.10** from the launcher's version list (it downloads from Mojang with your account).
4. Settings: renderer = default (GL4ES), RAM about 1024 MB on low-end phones.
5. Launch. Note exactly where it stops: launcher error, black screen, crash, or main menu.
6. Create a world. Note whether it loads.

## Report back with

- Phone model, RAM, Android version, GPU if known
- Result of step 5 and 6 (one of: main menu reached / world loaded / crash / black screen)
- The latest log from the launcher's log viewer (`latestlog.txt`) and any `hs_err` or crash report file

Failures here are expected and useful: the log shows the exact blocker we patch next.
