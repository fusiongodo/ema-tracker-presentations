#!/usr/bin/env bash
# Fails if any file in generated/ differs from the checksum manifest.
set -euo pipefail
cd "$(dirname "$0")/../generated"
sha256sum --quiet -c SHA256SUMS || {
  echo "generated/ was edited by hand. Revert it and change the source in the symptom-tree repo, then run scripts/sync-generated.sh." >&2
  exit 1
}
untracked=$(find . -type f ! -name SHA256SUMS | sed 's|^\./||' | sort | comm -23 - <(awk '{print $2}' SHA256SUMS | sed 's|^\./||' | sort))
[ -z "$untracked" ] || { echo "files in generated/ not in manifest: $untracked" >&2; exit 1; }
echo "generated/ matches manifest"
