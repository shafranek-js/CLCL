# CLCL Next — development roadmap

This is an **independent fork** of [nakkag/CLCL](https://github.com/nakkag/CLCL). Features in this roadmap are proposals, **not implemented functionality**.

## Working principles

1. Keep a responsive native Windows experience and a small footprint.
2. Preserve keyboard-first operation and existing formats (text, images, file lists).
3. Do not break the existing template and plugin systems.
4. Prefer incremental, independently testable changes instead of rewriting the codebase.
5. Add a regression check and a manual acceptance checklist for any user-facing behavior.
6. Treat clipboard history as sensitive local data: never introduce telemetry or cloud sync by default.

## Phase 0 — Reproducible upstream baseline

- [x] Preserve the real upstream fork relationship and MIT attribution.
- [x] Document source layout, x86 toolchain, and local build.
- [x] Add Windows GitHub Actions build pipeline.
- [ ] Confirm CI successfully produces `CLCL.exe`, `CLCLSet.exe`, and installer.
- [ ] Record initial smoke-test results on Windows 10 and Windows 11.
- [ ] Document how to sync upstream changes and resolve conflicts.

**Done when:** repeatable CI succeeds, build artifacts are retained, and existing clipboard / template features pass manual smoke tests.

## Phase 1 — Separate identity and protect existing user data

- [x] Introduce independent application / installer / uninstall registry identity and names (code; testing pending).
- [x] Introduce isolated `%LOCALAPPDATA%\CLCLNext` and portable `CLCLNextData` directories (manual testing pending).
- [x] Remove automatic migration from original CLCL; explicit backup-first import remains future work.
- [ ] Validate coexistence / clipboard watcher conflicts (fork checks if original is running at startup).
- [ ] Add a safe installer / upgrade / uninstall regression checklist.

**Done when:** test-install and uninstall do not modify an original CLCL installation or its data.

## Phase 2 — Fast history search (first feature)

- [ ] Identify history model, popup/Viewer entry points, and Unicode search path.
- [ ] Implement incremental, case-insensitive search, with an explicit empty-query state.
- [ ] Define matching semantics for text vs bitmap and file-list entries.
- [ ] Keyboard navigation: Up/Down, Enter, Escape; preserve focus and paste behavior.
- [ ] Keep history intact while filtering; do not mutate/deduplicate on search.
- [ ] Add performance measurements with 100, 1,000, and 10,000 history entries.
- [ ] Regression-test international Unicode text and clipboard formats.

**Done when:** results update promptly, selecting one pastes correctly, and the original Alt+C workflow remains reliable.

## Phase 3 — History ergonomics and modern UI

- [ ] Pin/favorite entries without affecting ordinary history ordering.
- [ ] Improve previews for long text, images, and copied files.
- [ ] Simplify Viewer navigation and settings discoverability.
- [ ] Polish dark mode and DPI behavior; avoid unnecessary dependencies.

## Phase 4 — Data protection and portability

- [ ] Review clipboard exclusion behavior and application/window filters.
- [ ] Add explicit import/export with robust format/version handling.
- [ ] Implement backup and recovery, including corruption/error handling.
- [ ] Review plugin loading, path handling, and update security boundaries.

## Releases

Do **not** rename upstream version strings or tag a fork release until Phase 1 identity separation is defined and tested. CI build artifacts are unsigned development outputs, not endorsed installers.
