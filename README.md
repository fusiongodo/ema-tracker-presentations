# ema-tracker-presentations

Framework, vocabulary and naming for the EMA tracker app (aggregated N-of-1 self-tracking for ME/CFS), plus the presentations built from them.

Open **`index.html`** in a browser. All pages are self-contained HTML (inline CSS, Google Fonts) with a bright light theme.

| Path | Content |
|---|---|
| `index.html` | Hub page |
| `framework/vocabulary.html` | Domain vocabulary in 5 layers (community → study design → data collection → measurement → disease context) |
| `branding/names.html` | App name proposals with status, rationale, risks and availability checks |
| `presentations/<slug>/` | One folder per presentation: PDF + speaker notes |
| `generated/symptom-tree/` | **Read-only** script outputs from the `symptom-tree` repo (theory, poster, tree, mapping explorer) |

## generated/ is read-only

Never edit files in `generated/`. Change the source in `symptom-tree`, then run `scripts/sync-generated.sh ../symptom-tree` and commit with `sync: …`. The CI check `protect-generated` compares every file against `generated/SHA256SUMS` and fails on any hand edit.

## Conventions (for editing, mostly by Claude)

- Stable IDs: terms `V-…`, names `N-…`, instruments `I-…`. Presentations reference IDs instead of copying definitions.
- Term attributes: `data-layer` (1–5), `data-origin` (`standard` | `project`), `data-confidence` (`verified` | `unverified`). Unverified claims get checked before going on a slide.
- Names: change `data-status` and move the patch to its section; never delete. Every availability check records date and method; only App Store Connect is definitive.
