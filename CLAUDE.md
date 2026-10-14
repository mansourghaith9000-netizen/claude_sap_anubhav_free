# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

SAP CAP (Node.js, `@sap/cds` v9) project for a Vacation & Traveller Management app. Currently only the data model exists: `srv/` and `app/` are empty, so no services are exposed yet. There are no tests.

## Commands

- `cds watch` — dev server with live reload (default VS Code build task). Uses an in-memory SQLite DB seeded from `db/data/*.csv`; no `cds.requires.db` config is set in `package.json`.
- `cds serve --with-mocks --in-memory?` — the VS Code debug launch config.
- `npm start` — `cds-serve` (production-style start).
- `cds compile db` / `cds compile srv --to edmx` — validate the model compiles.
- `cds deploy --to sqlite` — writes `db.sqlite` (gitignored).
- `npx eslint .` — lint with `cds.recommended` rules (`eslint.config.mjs`).

## Data model architecture

- Namespace `anubhav.claude` across all CDS files.
- `db/common.cds` is the single source of truth for code lists (`AddressTypes`, `TravellerStatus`, `Roles`, all `sap.common.CodeList`) and the reusable association types pointing at them (`AddressType`, `Status`, `Role`). Business entities in `db/schema.cds` use these types rather than declaring associations to code lists directly.
- `db/schema.cds`: `Travellers` (cuid, managed, `@odata.etag` on `modifiedAt`) is the root and composes `Contacts` and `Vacations`; `Destinations` and `AppUsers` associate to `Travellers`.
- Every element carries `@title: '{i18n>Key}'`. When adding/renaming elements, add the key to **all** of `db/i18n/i18n.properties` (default), `i18n_en.properties`, and `i18n_de.properties`. Inherited elements lacking a title (e.g. `cuid.ID`) are annotated in `common.cds`.

## Test data conventions (`db/data/`)

- Files are named `anubhav.claude-<Entity>.csv` and use `;` as separator.
- Code list texts go in `<Entity>_texts.csv` with columns `locale;code;name;descr` (en + de rows).
- UUIDs are deterministic and prefixed per entity (e.g. Travellers `10000000-…`, Vacations `40000000-…`) so cross-file foreign keys (`traveller_ID`, `currency_code`, `status_code`, …) stay readable; keep this pattern when adding rows.

## Project slash commands (`.claude/commands/`)

- `/cap-add-language <code>` — create a new `i18n_<code>.properties` from the English baseline.
- `/cap-lang-check` — report missing/orphan/empty keys across i18n files.
- `/commit` — conventional-commit message, shown for confirmation before committing and pushing.
