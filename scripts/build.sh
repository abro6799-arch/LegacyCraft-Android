#!/usr/bin/env bash
# Build the debug APK from ./upstream (after bootstrap + JRE download). Mirrors upstream CI.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT/upstream"

if [ ! -d app_pojavlauncher/src/main/assets/components/jre ] || \
   [ -z "$(ls -A app_pojavlauncher/src/main/assets/components/jre 2>/dev/null)" ]; then
  echo "ERROR: JRE 8 is missing in app_pojavlauncher/src/main/assets/components/jre" >&2
  echo "The 'Get JRE 8' workflow step must run before this script." >&2
  exit 1
fi

bash scripts/languagelist_updater.sh
gradle :app_pojavlauncher:assembleDebug --stacktrace

mkdir -p "$ROOT/dist"
APK="$(ls app_pojavlauncher/build/outputs/apk/debug/*.apk | head -n1)"
cp "$APK" "$ROOT/dist/LegacyCraft-debug.apk"
( cd "$ROOT/dist" && sha256sum LegacyCraft-debug.apk > LegacyCraft-debug.apk.sha256 )
echo "== Built: $ROOT/dist/LegacyCraft-debug.apk"
