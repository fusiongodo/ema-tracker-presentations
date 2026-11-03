#!/usr/bin/env bash
# The ONLY sanctioned way to change files in generated/.
# Copies script outputs from the symptom-tree repo and rewrites the checksum manifest.
#
#   scripts/sync-generated.sh [path/to/symptom-tree]     (default: ../symptom-tree)
#
# Then commit with a message starting with "sync:".
set -euo pipefail
cd "$(dirname "$0")/.."
SRC="${1:-../symptom-tree}/out"
DST=generated/symptom-tree
FILES=(mapping-explorer.html mecfs-tree.svg theory-poster.svg theory.html)

for f in "${FILES[@]}"; do
  [ -f "$SRC/$f" ] || { echo "missing: $SRC/$f" >&2; exit 1; }
  cp "$SRC/$f" "$DST/$f"
done
(cd generated && find . -type f ! -name SHA256SUMS -print0 | sort -z | xargs -0 sha256sum) > generated/SHA256SUMS
echo "synced ${#FILES[@]} files from $SRC, manifest updated"
