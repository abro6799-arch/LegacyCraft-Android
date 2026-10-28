#!/usr/bin/env bash
# Fetch pinned upstream Amethyst-Android (LGPLv3) into ./upstream and apply our overlay + patches.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
UPSTREAM_URL="https://github.com/AngelAuraMC/Amethyst-Android.git"
REF="${UPSTREAM_REF_INPUT:-}"
[ -n "$REF" ] || REF="$(tr -d '[:space:]' < "$ROOT/UPSTREAM_REF")"

echo "== Upstream ref: $REF"
rm -rf "$ROOT/upstream"
mkdir -p "$ROOT/upstream"
cd "$ROOT/upstream"
git init -q
git remote add origin "$UPSTREAM_URL"
git fetch --depth 1 origin "$REF"
git checkout -q FETCH_HEAD

# Upstream lists one submodule over SSH; CI has no SSH key, so force HTTPS.
git config --global url."https://github.com/".insteadOf "git@github.com:"
git submodule update --init --recursive --depth 1

echo "== Applying overlay (files copied over upstream)"
if [ -d "$ROOT/overlay" ]; then
  cp -a "$ROOT/overlay/." "$ROOT/upstream/"
fi

echo "== Applying patches"
shopt -s nullglob
for p in "$ROOT"/patches/*.patch; do
  echo "-- $p"
  git apply --whitespace=nowarn "$p"
done

echo "== Bootstrap done: $(git -C "$ROOT/upstream" rev-parse HEAD)"
