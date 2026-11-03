# Rules for this repo

## generated/ is read-only

Files under `generated/` are script outputs from other repos (currently `symptom-tree`, folder `out/`).

- **Never edit, reformat, restyle or "fix" anything in `generated/`**, not even typos or broken links.
- Changes belong in the source repo. To refresh: `scripts/sync-generated.sh ../symptom-tree`, then commit with a message starting `sync:`.
- `generated/SHA256SUMS` is written only by the sync script. CI (`protect-generated`) fails if a file differs from it.
- Link to these files from other pages; do not copy their content into new files.

## Everything else

- Docs are bright, self-contained `.html` pages (see README.md for conventions and stable IDs).
- Claude may commit and push in this repo.
