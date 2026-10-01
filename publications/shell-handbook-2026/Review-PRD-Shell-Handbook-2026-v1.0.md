<!-- markdownlint-disable MD013 MD029 -->

# Review of the Shell Handbook PRD, v1.0

**Reviewed:** `PRD-Shell-Handbook-2026-v1.0-2026-10-01.md` (Jane-Codex, October 1, 2026)  
**Result:** `PRD-Shell-Handbook-2026-v2.0-2026-10-01.md`  
**Evidence:** `verification/` (scripts and raw results, Bash 5.2.21 and 5.3.20 on Ubuntu 24.04)  
**Reviewer:** Claude Code, for Steve Little, October 1, 2026

## Verdict

v1.0 is an unusually disciplined PRD. Its count governance, safety rules, and Bash 5.3 semantics are mostly correct, and it says plainly what it has not proven. Its main weakness was the 112-page cap. The cap set the density at five entries per page and the entry length at 60–85 words, and it pushed out content readers need: exercises, debugging, error lookup, and reference tables. With the cap removed, v2.0 restores that content, swaps page budgets for completeness criteria and a measured extent model, closes some count loopholes, fixes one technical error, and re-plans schedule, budget, and edition label for a book of roughly 180–260 pages.

## What v1.0 does well

- **Honest counting.** The unit-of-count table, the 10/15 selection standard, the 20 reserves, and the instruction to stop rather than pad all guard the cover's riskiest claim.
- **Correct 5.3 semantics where they matter most.** v1.0 rightly corrects the common misreading of `${| command; }` as capturing stdout. Even the 5.3 NEWS file describes both forms loosely as capturing output.
- **Safety beside the operation.** The single scoped `rm -rf`, graceful-first signaling, and lab ports instead of production listeners are the right defaults for a book readers will copy from.
- **Testable requirements.** Gates, defect classes, and traceability tie each cover promise to evidence.
- **Clear about its own evidence.** It says which checks were done and what remains a release gate.

## What I verified

I built Bash 5.3 from GNU source with all 20 official patches and ran the PRD's claims against it and the distribution's Bash 5.2.21. Details and raw output are in `verification/`.

| v1.0 claim | Result |
| --- | --- |
| 5.3 final release announced July 5, 2025 | Confirmed (announcement dated Saturday, July 5, 2025) |
| Central `${ ...; }` specimen and expected output | Confirmed on 5.3.20; 5.2.21 fails with `bad substitution` |
| `${\| ...; }` keeps newlines, leaves stdout alone, restores `REPLY` | Confirmed |
| `GLOBSORT` keys; assignment harmless on 5.2 but sorting absent | Confirmed. Sharper finding: 5.2 sorts by name **silently**, with no error |
| `compgen -V` stores an indexed array | Confirmed |
| `source -p` searches only the given path | Confirmed, but `. -p` also works, so v1.0's "syntax difference" note for `.` is wrong |
| Version guards are not safe for every parser | Confirmed with a concrete case: a guard protects `${ echo new; }` on 5.2 but not `${ printf '%s ' {a,b}; }`, which fails to parse |
| `test` parsing changed for complex expressions | Confirmed with a realistic case: `v='!'; test \( "$v" = y \) -a -n x` errors on 5.2 and evaluates on 5.3 |
| Ten-line script handles spaces and missing files | Confirmed, plus leading hyphens and tabs. The missing-file case prints **two** error lines, which the PRD should show |

## Findings and fixes

Severity reflects impact on the finished book. Each finding names the v2.0 section that addresses it.

### Major

1. **The page cap distorted the whole plan.** Five entries per page needed the 60–85-word cap. Four pages of front matter could not hold a scope note, a three-axis legend, conventions, and setup. Eight reference pages could not hold complete indexes. The cap also led to a planning rule that cautions and prerequisites must not be cut "to fit," a rule only needed because fitting was a pressure. **Fix:** extent is an output. Components carry "complete when" criteria; extent is measured at the sample gate and re-projected twice; growth over 15% triggers an audit, not a cut. (v2.0 sections 1 and 4)
2. **The cover's "practical assessment" had no reader-facing form.** The cover contract cites a practical assessment for each competency, but the chapters had only worked deliverables, and the trial is a production check. **Fix:** every chapter ends with four to six exercises mapped to outcomes, with solutions in print and in the bundle. (6.0, 4.4, G-03, G-04)
3. **No debugging content in the scripting chapter.** "Create custom scripts" taught how scripts succeed and fail, not how to find out why they fail. **Fix:** `bash -n`, `set -x` with a useful `PS4`, `trap ... ERR`, reading Bash's error messages (including 5.3's start-line report), ShellCheck as an optional tool, and the Windows line-ending failure. (6.4)
4. **No route from an error message.** Readers often start with an error message, not a task name. **Fix:** a fourth reading pattern ("Recover"), outcome O-08, and an error-message index whose entries are captured verbatim on both versions. (2.1, 3, 4.4, 6.6)
5. **Trial design did not match the reader definitions.** v1.0 required four of five readers, mostly novices, to pass O-06, the 5.3 compatibility decision meant for experienced scripters. Retrieval tasks could also be worded like index entries, which tests matching rather than findability. **Fix:** at least four primary and two secondary readers with separate thresholds; at least half the retrieval tasks use wording absent from the index, and two start from an error message. (3)
6. **The schedule puts the "2026 Edition" into 2027.** Even v1.0's eight weeks from a mid-October kickoff ended in mid-December. With the larger book, about twelve weeks ends in January 2027. **Fix:** an explicit edition-label decision before cover design. (11.1, 13, 14.2)

### Moderate

7. **Count loopholes.** The rules did not say whether `2>` counts apart from `>`, whether `&>` and `&>>` are two entries, or how many assignment forms are allowed. The "purposeful assignment form" category could turn every shell variable into an entry. **Fix:** descriptor prefixes stay inside the base entry; duplication is one entry; combined output is one entry; assignment forms need a rationale and a soft ceiling of about a dozen; special parameters are grouped by job. (5.2)
8. **`source`/`.` row was wrong.** Both names accept `-p` in 5.3 (verified). **Fix:** corrected. (5.2, 7)
9. **5.3 coverage stopped at the headline features.** Users will notice `trap -P`, `BASH_MONOSECONDS`, `BASH_TRAPSIG`, six-digit `TIMEFORMAT`, `%#q`, better regex and syntax errors, and the `jobs` list change. **Fix:** a tiered chapter (headline, smaller changes, incompatibilities, build context), with a verified candidate list. (6.5, 7.5)
10. **The new-substitution matrix left out its sharpest edges.** `exit` inside `${ ...; }` ends the calling shell; `return` ends only the substitution; `shift` persists. **Fix:** added to the matrix with a child-shell demonstration. (7, 7.2)
11. **The `REPLY` specimen was described but not written.** **Fix:** a verified specimen with expected output. (7.2)
12. **Strict-mode traps were incomplete.** Two classic surprises were missing: `local x=$(cmd)` masks the status, and `errexit` is ignored inside a function called from `if`. `pipefail` with an early consumer also reports 141. All three verified. **Fix:** added. (6.2, 6.4)
13. **Process chapter gaps.** No `timeout` (despite the bounded-wait rule), no `pkill` caution, no PID-reuse warning, no `wait -n`/`wait -p`. **Fix:** added. (6.3)
14. **PDF code check sampled only "selected" examples.** **Fix:** extract every code block, diff it against the bundle, and rerun. Single-source code from the bundle so nobody retypes it. (8.1, 9.3, 12)
15. **Separate number index was mostly redundant.** If the catalog is in numeric order with entry-range running heads, the numbers already work like dictionary guide words. **Fix:** replace it with "The 301 at a glance" in the front matter, which also proves the cover count in one place. (4, 4.4)
16. **Selection scoring had one scorer.** **Fix:** editor and technical reviewer score independently and reconcile gaps over two points. (5.3)
17. **"Best" and numbering invited a ranking reading.** **Fix:** the scope note says numbers are addresses and "best" means passing the selection standard. (1.2)

### Minor

18. The publication was called "issue," "handbook," "guide," and "publication." v2.0 uses "the handbook."
19. The 44-character code measure forced line breaks that cause copy errors. v2.0 targets 60 characters or more, allowing full-width code or a single-column catalog when needed. (9.2)
20. "Avoid an entry split across a page turn" did not say whether column and spread breaks were acceptable. v2.0 allows them and forbids only page turns. (9.2)
21. The ten-line script's "1 lines" output and noisy `${1:?}` message were not mentioned. v2.0 prints the verified outputs and leaves the wording choice to copyedit. (6.4)
22. No policy on drafting tools. v2.0 states that AI-assisted drafting carries the same evidence standard. (8.4)
23. No license for example code. Readers who may not reuse the examples get less from a permanent reference. v2.0 recommends a permissive code license as an owner decision. (14.2)
24. Older Bash releases on long-term-support systems were out of view. v2.0 adds a Should requirement to mark examples that need anything newer than 4.4. (8.3)
25. Em dashes throughout, contrary to house preference. v2.0 removes them.

## Removing the page restriction: what changes and why

**What it changes.** The 112-page plan, the 90–120-page target, five entries per page, the 60–85-word entry budget, fixed page allocations for front matter and reference, the "moving to 120 needs a revised plan" rule, the traceability row for 90–120 pages, and the next action framed around "the 112-page promise."

**What replaces it.**

- *Completeness criteria* per component instead of page allocations (4.1).
- *A five-step extent model:* measure the sample, project, re-project at about 150 entries and at first proof, review growth over 15%, freeze and round to the binding increment (4.2).
- *A projection for quotes only:* roughly 180–260 interior pages, built bottom-up from front matter 12–16, chapters 66–96, catalog 70–100, and reference 32–48. The catalog figure assumes 3.5–4.5 standard entries per A4 page, which follows from the eight required entry fields and the keep-together rule.
- *Feature entries* up to a page for cover-critical or safety-critical constructs.
- *Format consequences:* saddle stitching is out. PUR perfect binding is the plan, with a quoted lay-flat option for a desk reference. The gutter must grow with page count. A spine needs designing after extent freeze. A smaller trim becomes a real option, at roughly a third more pages (4.3).
- *Budget and schedule:* effort rises from 81–117 to 109–158 person-days, and the illustrative schedule from eight to about twelve weeks. Printer quotes are requested at the low, central, and high projections (11).

**What it does not change.** The count stays at 301. Scope boundaries stay. The typography floor stays. The cheat card stays one page, because that limit serves the photograph, not a budget. v2.0 also forbids padding outright: no duplicate examples, no decorative spreads, no filler, and a growth audit whenever the projection jumps.

## Decisions for you

1. **Edition label.** Keep "2026 Edition" only if release lands in 2026. On a twelve-week schedule from mid-October, it lands in January 2027, and "2027 Edition" is the usual label for a late-year release.
2. **Binding.** Approve quoting a lay-flat option alongside PUR perfect binding.
3. **Example-code license.** A permissive license such as 0BSD or MIT-0 is recommended; prose stays under the publisher's terms.
4. **Tier B scope** for the 5.3 chapter, and whether to adopt the older-version markers. Both can wait until commissioning freeze.

## Limits of this review

I did not test interactive behavior (`read -E`, `search-ignore-case`, job notifications), a second package ecosystem, or link resolution for `www.gnu.org` manual pages, whose server reset connections from the test container. Manual wording was checked against the manual source in the 5.3 release tarball instead. The extent projection and effort figures are reasoned estimates; the PRD requires replacing them with measured figures at the sample gate.
