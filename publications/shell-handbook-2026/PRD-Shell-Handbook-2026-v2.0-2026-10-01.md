<!-- markdownlint-disable MD013 -->

# Publication PRD: Shell Handbook, 2026 Edition

**Document version:** 2.0, revised commissioning baseline  
**Prepared:** October 1, 2026 (v1.0 and v2.0)  
**Prepared by:** Jane-Codex for Steve Little, Codex Desktop (v1.0); revised with Claude Code for Steve Little (v2.0)  
**Source task:** `01a0f981-b845-7dd0-bc0d-32e0920dc63c`  
**Source transcript:** `C:\Users\jstep\.codex\sessions\2026\10\01\rollout-2026-10-01T18-07-03-01a0f981-b845-7dd0-bc0d-32e0920dc63c.jsonl`  
**Basis:** Steve's supplied assignment, reconstructed from cover claims; official GNU documentation checked on October 1, 2026. v2.0 adds checks against the Bash 5.3 release announcement, the 5.3 NEWS file, and the manual source shipped in the 5.3 release, plus tests on GNU/Linux with Bash 5.2.21 and 5.3.20 (section 14.3). Publisher identity, proprietary house style, commercial terms, and the contents of any existing publication are not inferred.  
**Status:** Complete requirements proposal. The handbook, its 301-item manifest, and its production proofs remain to be commissioned and produced. Internal provenance above is excluded from reader-facing files.  
**Companion files:** `Review-PRD-Shell-Handbook-2026-v1.0.md` (critique and rationale for every change); `verification/` (test scripts and results behind the v2.0 technical claims).

## What changed in v2.0

1. **Extent is set by content.** By product-owner decision on October 1, 2026, the 112-page plan and the 90–120-page target are withdrawn. The handbook runs to the length its content requires. Section 4 replaces page budgets with completeness criteria, a measured extent model, a planning projection of roughly 180–260 interior pages, and guardrails against padding.
2. **Content the page cap squeezed out is restored.** End-of-chapter exercises with published solutions (the cover contract's "practical assessment" had no reader-facing form), a debugging section, an error-message index, quick-reference tables, a glossary, and a front-of-book list of all 301 entries.
3. **Bash 5.3 coverage is tiered and tighter.** The version chapter now covers smaller user-visible changes. The technical matrix adds verified semantics for `exit`, `return`, `local`, and positional parameters inside `${ ...; }`, a written `REPLY` specimen, a concrete `test` parsing difference, and a demonstrated failure of version guards on 5.2.
4. **Count governance closes loopholes.** New rules cover descriptor-prefixed redirections, assignment forms, special parameters, and builtins that shadow utilities. The `source`/`.` row is corrected. Entry numbers are declared addresses, not ranks. Candidates are scored by two people.
5. **Trial, schedule, budget, and edition label are re-planned.** The trial roster matches the reader definitions, the retrieval test uses unprompted wording, effort and schedule are re-estimated for the larger book, and the "2026" label is checked against a realistic release date.

## 1. Product decision

Produce a single-topic print and digital handbook that helps terminal users build reliable pipelines, inspect and control processes, and write small Bash scripts. Its principal product is an exactly counted, numbered catalog of **301 practical commands and shell constructs**, supported by worked chapters and three routes into the reference: name, number, and task. A fourth route, by error message, serves readers who arrive with a problem rather than a task.

**Let content set the extent.** The handbook has no page target, ceiling, or floor. Each component is complete when it meets its requirements in this PRD, and it stops there. Extent is measured from a representative sample and the catalog manifest rather than allocated in advance (section 4). The current projection, roughly 180–260 interior pages, exists so production can request printer and binding quotes. It is not a goal.

Supply a print-ready PDF with its cover and spine, an accessible reading PDF, and an offline examples package. The reading PDF is the required digital edition; EPUB and a hosted website remain optional later products with separate budgets.

The 2026 label identifies the edition. Bash 5.3 is its version focus, not a claim that Bash 5.3 first appeared in 2026: the final release was announced on July 5, 2025. [GNU Bash 5.3 release announcement](https://lists.gnu.org/archive/html/bash-announce/2025-07/msg00000.html). Confirm the label against the realistic release date before cover approval (section 14.2).

### 1.1 Cover contract

| Element | Required wording or meaning | Body evidence |
| --- | --- | --- |
| Working title | Shell Handbook, 2026 Edition | Edition metadata and colophon agree |
| Count line | 301 Best Bash Commands | Exactly 301 accepted numbered entries, with an explanatory scope note and a front-of-book list of all 301 |
| Promise | Supercharge your Linux skills | Demonstrated improvements in the three named competencies |
| Retention | Keep this guide as a permanent reference | Offline usability; task, error-message, and general indexes; quick-reference tables; cheat card; stable entry numbers |
| Version hook | Includes Bash 5.3: new features and updates | Dedicated behavior-and-compatibility chapter |
| Competency 1 | Pipe and redirect output | Worked chapter, catalog tags, task index, end-of-chapter exercises with published solutions |
| Competency 2 | Monitor processes | Worked chapter, catalog tags, task index, end-of-chapter exercises with published solutions |
| Competency 3 | Create custom scripts | Worked chapter, catalog tags, task index, end-of-chapter exercises with published solutions |
| Spine | Title and edition | Designed after extent freeze, because spine width depends on final page count and paper |

Keep publisher names omitted throughout this PRD. Cover imagery, including the nautilus, is an art-direction choice. Do not carry it into a prose metaphor or imitate an unidentified publisher's layout.

### 1.2 Editorial refinements to the supplied assignment

Adopt these refinements as part of the proposed baseline:

1. **Explain the count honestly.** Builtins, external utilities, and typed shell syntax are different things. Expand the catalog's permitted syntax to include control words, expansions, and purposeful assignment forms as well as operators. Give each its correct type. The opening scope note must say that "commands" on the cover includes these Bash constructs; external tools are run from Bash. If the editor will not accept that qualification, revise the cover wording before commissioning.
2. **Remove the separate quota of 15 Bash 5.3 entries.** Integrate genuinely distinct new constructs into their natural categories. Update existing entries for new modes of `read`, `source`, `compgen`, and `trap`. Apply a version tag without counting the same entry again.
3. **Correct the `REPLY` description.** The pipe-prefixed substitution expands a temporary local `REPLY`; it does not capture stdout or leave that temporary value in the caller's `REPLY`. Note that the 5.3 NEWS file itself describes both forms loosely as capturing output; the manual is authoritative. See section 7.
4. **Qualify the pipeline rule.** Explain the usual subshell behavior, then the `lastpipe` exception. Avoid an absolute statement that assignments in every possible pipeline must disappear.
5. **Treat strict options as choices.** Teach explicit status checks alongside `set -euo pipefail`; do not advertise that line as an automatic safety guarantee.
6. **Define "installed by default" against tested environments.** No single installation profile covers every Linux system. Optional and ecosystem-specific tools require visible dependency labels.
7. **Make numbers addresses, not ranks.** The scope note says that entries are grouped by job and numbered for lookup. "Best" means every entry passed the selection standard in section 5.3; it does not mean entry 001 outranks entry 301.
8. **Let length follow need, not opportunity.** Removing the page target does not widen scope. The boundaries in section 2.3 stand, and every added page must trace to a requirement in this PRD.
9. **Teach recovery as well as success.** Readers often arrive holding an error message, not a task name. Debugging, exit statuses, and verbatim error messages get first-class coverage.

These are requirements proposals, not claims that the original cover's publisher has endorsed them.

## 2. Reader, problem, and intended use

### 2.1 Primary reader

You can log in, open a terminal, navigate directories, and edit a file. You still interrupt your work to look up syntax, assemble a pipeline by trial and error, or discover that a script breaks on a filename containing spaces. You may know a command's name without knowing whether Bash provides it or executes an external program.

The handbook must serve four reading patterns:

- **Find:** identify the right tool or construct for a task in under a minute.
- **Apply:** copy a small verified example, adapt the clearly identified inputs, and check its result.
- **Understand:** follow a worked chapter when an isolated command is insufficient.
- **Recover:** start from an error message or an unexpected result and reach its cause.

### 2.2 Secondary reader

You already script and need to judge whether a Bash 5.3 feature improves your work, changes behavior, or breaks a deployment still running 5.2. Provide a short delta route through the version chapter, its compatibility tables, and version-tagged entries. The front matter names this route explicitly.

Some readers maintain long-term-support systems whose Bash predates 5.2. The manifest's minimum-version field supports a Should requirement to mark examples that need anything newer than Bash 4.4 (section 8.3).

### 2.3 Scope boundaries

Include GNU/Linux command-line work, Bash's execution model, modest text processing, process inspection, read-only system and package queries, diagnosis of the shell's own errors, and small scripts that integrate these tasks. Assume Bash 5.2 as the ordinary example baseline; clearly label 5.3-only material.

Exclude first-install guidance, distribution rankings, kernel tuning, comprehensive language instruction, disk partitioning, firewall administration, penetration testing, service deployment, and exhaustive manuals for tools such as `awk`. Do not turn network and system-query coverage into a second administration book. Open extent does not relax these exclusions.

Remote examples use a named lab host or are visibly marked as fragments with prerequisites. Local examples do not require a paid account, real credentials, public infrastructure, or root access.

## 3. Outcomes and measures

The publication succeeds when readers can complete the tasks below using the handbook. Memorization is not required.

| Outcome ID | Reader capability | Observable result |
| --- | --- | --- |
| O-01 | Build a pipeline and separate its streams | Transform stdout while stderr reaches a distinct log; explain append versus overwrite |
| O-02 | Explain execution scope | Demonstrate a variable lost in an ordinary pipeline and preserved with a suitable alternative |
| O-03 | Find and signal the intended process | Identify a lab process by PID and command, request termination, then verify its state |
| O-04 | Diagnose CPU or port use | Attribute a CPU observation or listening socket to a process, including permission limitations |
| O-05 | Ship a ten-line script | Include a Bash shebang, a quoted variable, a checked status, and observable success/failure behavior |
| O-06 | Make a Bash 5.3 compatibility decision | Demonstrate persistent side effects in current-shell substitution and identify the 5.2 cost |
| O-07 | Retrieve an answer quickly | Find the relevant numbered entry for at least 8 of 10 prepared tasks within 60 seconds each |
| O-08 | Recover from a shell error | Starting from a verbatim error message, reach its cause and a fix through the error-message index |

**Usability trial.** Before final proof, run a trial with at least six representative readers: at least four primary readers and at least two secondary readers (experienced scripters). Thresholds:

- At least 75% of primary readers (three of four in the minimum roster) complete O-01, O-02, O-03, O-05, and O-08 without facilitator instruction beyond locating the exercise.
- Every secondary reader completes O-06.
- All but one reader in the minimum roster, and at least 80% in a larger one, meet O-07's retrieval threshold.

Prepare O-07's ten tasks so that at least five are phrased in words that do not appear in the task index and two start from an error message. A task worded exactly like its index entry tests matching, not findability. O-04 depends on host permissions; verify it in technical review and include it in the trial where the lab allows.

Record completion, wrong turns, and ambiguity; repair failures and retest affected tasks. This is a practical release check, not a population-level research claim.

Post-release indicators may include errata volume, reported lookup problems, and download success. Sales targets, pricing, and conversion measures belong to the publisher's commercial plan; do not invent them here.

## 4. Architecture, extent, and density

Use this reading order: front matter → Part I, five worked chapters → Part II, the grouped catalog → Part III, permanent reference. The sixth required chapter is the permanent-reference section that forms Part III. Chapter cross-references point forward to entry numbers; catalog entries point back to chapter sections and pages.

Display entry numbers with three digits everywhere (`001`–`301`). In running text write "entry 117"; in compact cross-reference lines write "See 117, 204". Running heads in the catalog show the entry range on each page so numbers work like dictionary guide words.

### 4.1 Components and completeness

Each component is complete when it satisfies the last column. The projected pages are forecasts for quoting and scheduling. No writer receives a page or word quota.

| Component | Required contents | Complete when | Projected pages (planning only) |
| --- | --- | --- | ---: |
| Front matter | Title, colophon and edition record, contents, how to use this handbook (scope note, reading routes for primary and secondary readers), legend, example conventions, workspace setup, "The 301 at a glance" | A reader can set up the workspace and decode every label without reading ahead | 12–16 |
| 1. Power at your fingertips | Section 6.1 | Worked deliverable and exercises pass on both baseline versions | 8–12 |
| 2. Pipe and redirect output | Section 6.2 | Same | 14–20 |
| 3. Monitor processes | Section 6.3 | Same | 12–18 |
| 4. Create custom scripts | Section 6.4 | Same | 18–26 |
| 5. Bash 5.3, new features and updates | Section 6.5 and section 7 | Every Tier A and Tier C item has verified before/after evidence | 14–20 |
| The 301: grouped catalog | 301 entries meeting section 5.5, plus seven category openers with subgroup maps | G-01 and G-04 pass | 70–100 |
| 6. Permanent reference | Section 4.4 components | G-07 passes | 32–48 |
| **Total interior** | | | **About 180–260** |

Cover pages and spine are additional. No advertising pages are assumed.

### 4.2 Extent model

Extent is an output of the content, measured in five steps:

1. **Measure at the sample gate.** Lay out the first sample (section 11.1) in the approved design. Measure entries per page for short, standard, and feature entries, including space lost to the keep-together rule; words per page in a chapter spread; and lines per page for index records.
2. **Project.** Catalog pages equal the manifest's entries in each length class divided by the measured density for that class, plus category openers. Chapter pages come from outline word estimates divided by measured words per page, plus figures and exercises. Reference pages come from manifest record counts and measured lines per page.
3. **Re-project** when about 150 entries are drafted and again at first full proof.
4. **Review growth, do not cap it.** If a projection exceeds the previous one by more than 15%, the managing editor runs a duplication and scope audit before writing continues. Growth that traces to requirements is accepted and recorded.
5. **Freeze extent** after first-proof corrections. Round the final count to the printer's binding increment. Spare pages become labeled Notes pages or approved reference content, never advertising or filler.

**Planning density.** Until the sample is measured, estimate 3.5–4.5 standard entries per two-column A4 page. That figure follows from the entry contract's eight required fields and the keep-together rule. The v1.0 figure of five entries per page depended on a 60–85-word cap and is withdrawn.

**Entry length.** A standard entry is as long as its contract requires; most need 50–120 prose words plus syntax, example, and result blocks. The commissioning editor may designate **feature entries**, up to a full page, for constructs that are cover-critical or safety-critical, such as the new substitution forms, `set`, `trap`, `kill`, `rm`, and `find -exec`. Record the length class in the manifest.

**Word projections, for scheduling only:** catalog 21,000–33,000 prose words; chapters 22,000–32,000; front matter and reference 6,000–9,000. Measure code, tables, and indexes in layout.

**What open extent forbids.** Removing the page target removes any excuse to hide cautions, drop runnable prerequisites, or shrink type below the floor. It equally forbids padding: no example repeated between a chapter and an entry where a cross-reference serves, no decorative spreads without a navigational job, no motivational filler, and no extra numbered commands.

### 4.3 Format consequences of open extent

- **Binding.** At the projected extent, saddle stitching is impractical. Plan for PUR perfect binding, and obtain a quote for a lay-flat option (PUR lay-flat or wire binding), because a desk reference stays open beside a keyboard. Decide after the sample projection.
- **Gutter.** Inner margins must grow with page count in perfect binding. Code near the gutter of a thick A4 book is hard to read and harder to photograph. The designer sets the inner margin from the printer's specification for the projected extent and proves it on a bound dummy.
- **Trim.** A4, 210 × 297 mm, remains the baseline: it suits the two-column catalog and the photographable cheat card. A smaller trim is now a legitimate choice. A trim such as 189 × 246 mm would raise the page count by roughly a third for the same content.
- **Spine.** Perfect binding adds a spine whose width depends on page count and paper caliper. Design it after extent freeze.
- **Cost and weight.** Unit cost, weight, and distribution cost scale with extent. The budget formula in section 11.2 carries these explicitly.
- **Digital navigation.** At this extent, bookmarks for every chapter section and every catalog subgroup are mandatory.

### 4.4 Permanent-reference components

Part III contains the following. None has a page allocation; each is complete when its rule is met.

| Component | Completeness rule |
| --- | --- |
| General index | Covers entry names, aliases, option letters taught, concepts (for example "subshell", "exit status"), and shell variables discussed; every locator checked against final folios |
| Task index | Reader-language tasks, each pointing to entry numbers, pages, and a chapter section when the answer needs context; includes the minimum vocabulary in section 6.6 |
| Error-message index | Verbatim error text as Bash and the baseline utilities print it, its usual cause, and the entry or chapter section with the fix; every message captured by triggering it on both baseline versions |
| Quick-reference tables | The tables listed in section 6.6, each verified against the manual for both baseline versions |
| Glossary | Every term in section 9.1, defined consistently with first use in the text |
| Exercise solutions | A worked solution and expected output for every end-of-chapter exercise; identical files in the examples bundle |
| Cheat card | One page, by design (section 9.2). Its one-page limit is a usability constraint for photographing, not a page budget |

"The 301 at a glance" sits in the front matter: number, name, kind, and page for every entry. It proves the cover count in one place, serves as a compact table of contents for the catalog, and replaces v1.0's separate number-to-name index.

## 5. The 301: selection and count governance

### 5.1 Proposed allocation

The allocation relocates the original 15-entry version quota into shell-language coverage. Ranges below are planning ranges; assign final numbers only at catalog freeze.

| Category | Entries | Planning range | Browse subgroups |
| --- | ---: | --- | --- |
| Files, navigation, permissions | 55 | 001–055 | Navigation, file operations, inspection, archives, ownership and access |
| Text and filters | 45 | 056–100 | Viewing, searching, selecting, transforming, comparing, summarizing |
| Redirection, pipes, command grouping | 30 | 101–130 | Streams, descriptors, pipelines, substitutions, grouping |
| Processes, signals, jobs | 35 | 131–165 | Inspection, resource observations, signals, interactive jobs, child management |
| Shell language and scripts | 85 | 166–250 | Variables, expansion, tests, loops, arrays, functions, arguments and builtins |
| Networking, remote, system query | 36 | 251–286 | Sockets, name lookup, transfer, remote execution, package/system inspection |
| History, completion, configuration | 15 | 287–301 | Recall, completion, startup behavior, terminal editing |
| **Total** | **301** | **001–301** | No additional numbered version section |

The commissioning editor may transfer slots between categories when accepted candidates justify it. Record transfers in the manifest. The total, quality rules, and coverage obligations remain fixed. Do not preserve an allocation by admitting filler.

Within each category, order entries by subgroup and then in teaching order (simpler and more common first). The general index provides alphabetical lookup, so catalog order can serve learning.

### 5.2 Unit of count

One entry is one independently useful command or typed shell construct with a distinct job. A utility appears once even if the chapters use it repeatedly. A syntax family may have separate entries when readers must choose between materially different behavior, such as overwrite and append.

| Case | Count treatment |
| --- | --- |
| `ls` and its ordinary display options | One entry; options belong within it |
| `find` and `find -exec` | A second entry is permitted for safe command execution on discovered paths; document the distinct job |
| `>` and `>>` | Separate operator entries: overwrite and append differ materially |
| `2>`, `2>>`, `3<` | Descriptor-number prefixes do not create entries. Teach them in the base operator entry and index them under task terms such as "redirect stderr" |
| `2>&1`, `>&2` | One duplication entry (`n>&m`, `n<&m`), separate from file redirection, because it copies a descriptor rather than opening a file. Teach order effects there and in chapter 2 |
| `&>` and `&>>` | One Bash-specific combined-output entry; the overwrite/append choice was already taught by `>` and `>>` |
| `read` and `read -E` | One builtin entry with a 5.3 mode and a chapter cross-reference |
| `compgen` and `compgen -V` | One builtin entry with a 5.3 result-storage mode |
| `trap` and `trap -P` | One builtin entry with a 5.3 printing mode |
| `source` and `.` | One entry with both names indexed. `.` is the POSIX name and `source` the Bash synonym. The 5.3 `-p` option works with both names and is Bash-specific |
| `mapfile` and `readarray` | One entry with a synonym |
| `$(...)`, `${ command; }`, `${\| command; }` | Separate expansion entries because execution scope and output channels differ |
| `$1`…`$9`, `$#`, `"$@"`, `"$*"` | One positional-parameters entry; `shift` and `set --` are separate builtins |
| `$?`, `$!`, `$$`, `PIPESTATUS` | One status-and-process-ID parameters entry |
| `GLOBSORT=value` | One purposeful assignment-form entry; sort keys and directions do not multiply the count |
| `printf` as builtin and external utility | One entry identifying the implementation used and relevant differences |
| `time` keyword and the external `time` utility | One entry labeled as a keyword, noting the external utility and how to invoke it by path |
| Several examples of one task | Examples are not entries |
| Readline settings or keystrokes | Teach under the relevant builtin/configuration entry; do not manufacture numbered commands from each setting |

Plain variable names, isolated flags, duplicate spellings, recipes assembled from already counted components, and explanatory headings do not create extra entries. Use one dedicated entry for parameter defaulting rather than separate entries for each minor modifier unless the editor records a distinct task case.

**Assignment forms.** Admit an assignment form only when readers type the assignment deliberately to change Bash's behavior, such as `GLOBSORT=-mtime` or `PS4='+ ${LINENO}: '`. Expect about a dozen at most across the catalog; each needs a recorded rationale, and more than a dozen needs a recorded editorial decision. This closes the route by which every shell variable could become an entry.

### 5.3 Selection standard

Score each candidate from 0–3 on five factors: recurring use, contribution to the cover competencies, clarity within the entry format, availability in the declared environments, and distinctness from accepted entries. Ordinarily require at least 10/15. Record any exception for a cover-critical construct; novelty alone never qualifies.

The commissioning editor and the technical reviewer score independently. Where their totals differ by more than two points, they resolve the difference and record the reasoning in the manifest.

Prepare **301 accepted candidates plus at least 20 unnumbered reserves** before full commissioning. Reserves allow replacement of an example that proves unsafe, obsolete, duplicative, or too large. All candidates require a verified documentation source and an example plan. Do not claim that this PRD itself proves the feasibility of 301 high-quality entries.

When tools overlap, prefer the broadly available tool in the baseline environments. Mention an alternative briefly without counting it. Exceptions require a genuinely distinct job or a different system ecosystem; package-query tools for different ecosystems must be labeled accordingly. Prefer `top` for the main walkthrough if installed; an enhanced monitor may be mentioned without creating a parallel tutorial.

If the inventory cannot support 301 under these rules, stop count-line approval and present the shortfall. The editor may revise scope or propose a different count; writers may not pad or quietly weaken the rules. Open extent does not change this: more pages cannot rescue a weak candidate.

### 5.4 Entry classification

Every entry carries three independent labels:

- **Kind:** Bash builtin; external utility; or shell syntax, with subtype operator, keyword/compound construct, expansion, or assignment.
- **Portability:** POSIX-defined form; Bash-specific form; GNU-specific form; or Linux/ecosystem-specific form. Label the printed example, not merely the command's name.
- **Availability:** shell-provided; baseline package; or additional package/system prerequisite. Give the package or provider where needed.

Use a separate **Requires Bash 5.3** tag where applicable. A POSIX utility using a GNU-only flag needs a GNU-specific example label. `grep` is external. `if` is syntax. `GLOBSORT` is not a builtin. When Bash provides a builtin or keyword with the same name as an external utility (`echo`, `printf`, `kill`, `test`/`[`, `pwd`, `time`), the label names what Bash runs by default and notes the external program. The legend must make these distinctions legible without requiring the reader to learn the production database.

### 5.5 Entry contract and manifest

Each reader-facing entry contains, in order:

1. A unique number and searchable name or exact token.
2. The short classification labels and any version/prerequisite label.
3. A one-line statement of purpose.
4. A syntax line, clearly distinguished from runnable code.
5. One working example with all required fixture setup, or an explicit link to the shared setup.
6. An expected result, or a stated variable result for process/network observations.
7. One concrete failure mode or portability note.
8. Chapter/related-entry cross-references where they materially help.

Store canonical entry records in a structured manifest, such as JSON validated against a schema, and generate editorial tables from it. Required fields: stable internal ID; final number; canonical display name; aliases; category; subgroup; kind; portability; provider; minimum Bash version; length class; competency tags; purpose; syntax; example ID and source-file path; expected result; caution; error messages the entry resolves; documentation URL and section; checked date; both selection scores; reviewer; verification state; chapter links; task terms; and final folio.

Stable internal IDs survive reordering. Final numbers become immutable at count freeze. A replacement inherits the removed entry's slot only after all text, index terms, and tests are updated. Removed candidates remain in the editorial history but never in the release count. Indexes, "The 301 at a glance", and chapter references are built from this manifest, then checked against the final PDF.

### 5.6 Specimen entry

**Number:** assigned at count freeze. **Name:** `printf`. **Kind:** Bash builtin (an external `printf` also exists). **Portability:** POSIX-defined example. **Availability:** shell-provided. **Length class:** standard.

**Purpose:** Print text with an explicit format rather than depending on `echo` option handling.

**Syntax fragment:** `printf FORMAT [ARGUMENT ...]`

**Runnable example:**

```bash
name='Ada Lovelace'
printf 'Hello, %s\n' "$name"
```

**Result:** `Hello, Ada Lovelace`, followed by a newline.

**Caution:** Keep data in arguments: using variable content as the format can interpret percent sequences as formatting instructions. Link to the quoting section and the script's output/error conventions.

## 6. Worked-chapter briefs

Chapters use continuous prose, short runnable examples, and a small number of diagrams or tables. They explain decisions and execution behavior; the catalog supplies compact recall. Do not convert chapters into 301-entry commentary or numbered feature lists.

### 6.0 Requirements common to all worked chapters

- Open with a short list of what the reader will be able to do, mapped to outcome IDs.
- Mark the secondary reader's delta route where a section covers 5.2/5.3 differences.
- End with **Check yourself**: four to six exercises, each with a checkable result, mapped to outcomes. Solutions appear in Part III and as files in the examples bundle. At least one exercise per chapter asks the reader to predict a result before running it.
- Close with a one-paragraph summary that lists the entry numbers the chapter relied on.

### 6.1 Power at your fingertips

**Purpose:** establish the mental model and a reliable way to explore commands.

Teach the shell as a command interpreter, the terminal as its interface, interactive use versus scripts, and the practical difference between a builtin, a keyword, a function, an alias, and an external utility. Show command discovery with `type -a`, `command -V`, and `help`; introduce `man`, man-page sections, `man -k`, synopsis notation, and the fact that some commands do not implement a GNU-style help flag. Show how `PATH` lookup and hashing decide which program runs, and warn that an empty `PATH`, or an empty element in it, makes Bash search the current directory.

Create a disposable workspace with a printed, verified path and fixtures. Explain prompts, comments, syntax fragments, expected output, working-directory assumptions, and privilege labels. Show how to inspect a snippet before running it and how to stop a foreground command. Name the interpreter requirement before the reader tries Bash syntax through another shell.

**Worked deliverable:** identify the implementation of three commands, including one name that is both a builtin and an external utility; read a relevant help section; create a fixture; and run a harmless command that prints its result.

**Required diagram:** command line → Bash parsing and expansion → builtin or external program → streams and status.

### 6.2 Pipe and redirect output

**Purpose:** let the reader predict where data goes and where state lives.

Teach descriptors 0/1/2; input, overwrite, append, stderr-only output, combined output, descriptor duplication, and the left-to-right effect of redirection order. Compare separate logs with merged streams. Include `/dev/null`, `noclobber` with `>|`, here-documents with quoted and unquoted delimiters, here-strings, process substitution, `|&`, `exec` redirections that apply to the rest of a script, named descriptors such as `{fd}>file`, and `tee` for retaining a stream while passing it onward. [GNU redirection reference](https://www.gnu.org/software/bash/manual/html_node/Redirections.html).

Build a short pipeline from a fixture that deliberately emits both streams. Show a loop losing its assignment under ordinary pipeline execution, then preserve state by feeding the loop through redirection or process substitution. Include the `lastpipe` exception when job control is inactive. Explain pipeline status, `PIPESTATUS`, `pipefail`, and why preserving individual statuses must happen immediately. [GNU pipeline reference](https://www.gnu.org/software/bash/manual/html_node/Pipelines.html).

Explain `SIGPIPE` with an early consumer: under `pipefail`, `yes | head -n 1` reports status 141 (128 + 13) although nothing went wrong from the reader's point of view. Show how to recognize and handle that case rather than disabling `pipefail` wholesale.

Discuss buffering, early consumers, and the difference between a program waiting for input and a pipeline that has not reached end-of-file. Process substitution is not a free substitute for pipeline status handling; its producer's failure needs separate consideration.

**Worked deliverable:** a small log-summary pipeline, separate error log, and a repeat run that proves append behavior.

**Required diagrams:** two streams through a pipeline; the two different orders of stream duplication; ordinary pipeline scope versus a redirected loop.

### 6.3 Monitor processes

**Purpose:** identify the right process before changing it.

Use `ps`, `pgrep`, `pstree`, and `top` to distinguish a PID, parent, process group, command, state, and CPU observation. Show filters that avoid mistaking the search command for the target. Show `/proc/PID` as a read-only source for a process's command line and status. Treat resource output as time-dependent; one snapshot does not prove a sustained problem.

Teach `jobs`, `fg`, `bg`, `disown`, `kill`, and `wait` with a lab child process, including `wait -n` and `wait -p` (Bash 5.1 and later). Distinguish the interactive job table from PID-based script management, stopping from terminating, and a termination request from confirmed exit. Explain that `disown` changes shell job handling rather than providing a general service supervisor. Note two 5.3 behavior changes that alter job demonstrations: running `jobs` now removes reported completed jobs from the list, and interactive shells defer completed-job notices while sourcing a script.

Teach `timeout` for bounded waits and `nice`/`renice` for priority. Introduce `pkill` only after `pgrep`, with the caution that pattern matching can signal more processes than intended. Explain PID reuse: a PID recorded earlier may belong to a different process later, so verify before signaling and prefer the shell's own `$!` for children it started.

For port diagnosis, inspect a local listening socket, identify the owning process where permissions allow, and inspect its command before signaling. The task label may mention port 443, but the runnable exercise uses an unprivileged lab port such as 8443. Never have the reader kill an unidentified production listener to complete an exercise.

Show a diagnostic order for a stuck pipeline: inputs and EOF → process state and parentage → resource observations → intended signal → verified result. Explain when a supervisor may restart a process.

**Worked deliverables:** controlled background child with status collection; CPU observation; lab socket attribution. Provide permission and missing-tool alternatives without assuming root.

### 6.4 Create custom scripts

**Purpose:** package useful shell work so it behaves predictably on success and failure.

Teach a Bash shebang, file execution, argument handling, quoting, functions, local variables, return versus exit, stderr diagnostics, and checked exit status. Use positional arguments for the shortest script and `getopts` for a later small utility. Keep user data out of format strings and evaluation. Use arrays for argument lists where appropriate; do not teach splitting arbitrary command output as a universal loop pattern.

Include `set -euo pipefail`, with worked exceptions and an explanation of expected nonzero results. Cover conditions, AND/OR lists, and command substitution. Show that `errexit` is ignored inside a function called from an `if` condition, so a failing command inside it does not stop the script. Show that `local x=$(cmd)` reports the status of `local`, not of `cmd`; declare first, then assign. Mention `inherit_errexit` for command substitutions. Explicit checks remain necessary for critical operations. Do not silently discard the original status through negation or a subsequent command. [GNU shell-option reference](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html).

Teach temporary files/directories, ownership of cleanup, an exit trap that preserves the intended result, missing dependencies, filenames containing spaces or leading hyphens, and a reproducible cleanup path. Explain that a shebang does not control the interpreter when a reader explicitly invokes a different shell. Explain the exit-status conventions readers will meet: 0, 1, 2 for usage errors, 126, 127, and 128 plus a signal number.

**Debugging.** Teach a short, repeatable method: `bash -n` to check syntax without running; `bash -x` or `set -x`/`set +x` around a suspect region; a `PS4` that shows file and line (`PS4='+ ${BASH_SOURCE}:${LINENO}: '`); a `trap ... ERR` that reports the failing line; and reading Bash's own error messages, including the 5.3 improvement that reports where an unterminated compound command began. Present ShellCheck as an optional external tool with an availability label, and show how to read and adjudicate one of its warnings. Explain that trace output can expose sensitive arguments.

Explain line endings: a script saved with Windows line endings fails with messages such as `/usr/bin/env: 'bash\r': No such file or directory`. Show how to detect and fix it with baseline tools.

**Worked deliverables:** the ten-line line-count script below; a small pipeline-based report; a bounded process helper that records and waits for its own children; and a debugging walkthrough that finds a planted defect. Longer examples may be 15–30 lines; ten lines is the minimum competency exercise, not a universal script limit.

**Ten-line acceptance specimen:** save as a script before execution. This example chooses explicit error handling with `set -u`; the chapter separately teaches the full strict-option line and its trade-offs.

```bash
#!/usr/bin/env bash
set -u
file=${1:?Usage: line-count FILE}
if count=$(wc -l < "$file"); then
  printf '%s: %s lines\n' "$file" "$count"
else
  status=$?
  printf 'Cannot count %s (status %s)\n' "$file" "$status" >&2
  exit "$status"
fi
```

Test with a two-line fixture whose filename contains spaces, a filename with a leading hyphen, a missing file, and a missing argument. Print the verified results, which are identical on Bash 5.2.21 and 5.3.20 with GNU coreutils 9.4:

| Input | Output | Status |
| --- | --- | ---: |
| `'two lines.txt'` | `two lines.txt: 2 lines` | 0 |
| `-leading.txt` | `-leading.txt: 1 lines` (redirection means `wc` never sees the name as an option) | 0 |
| `missing.txt` | Two lines on stderr: Bash's own `./line-count: line 4: missing.txt: No such file or directory`, then the script's `Cannot count missing.txt (status 1)` | 1 |
| No argument | `./line-count: line 3: 1: Usage: line-count FILE` | 1 |

Explain three teaching points the results expose: the missing-file case prints two messages because Bash reports the failed redirection before the script reports its own error; the `${1:?}` message includes Bash's line and parameter prefix; and the script counts newline characters, so a final unterminated line is a deliberate edge case rather than an invisible defect. Decide in copyedit whether "1 lines" stays as a visible simplification or the format becomes `line(s)`; either way, print the output the code actually produces.

### 6.5 Bash 5.3, new features and updates

**Purpose:** help an experienced reader decide what to adopt and where it can run.

Open with a concise version check (`$BASH_VERSION`, `BASH_VERSINFO`, `bash --version`) and a compatibility summary. Organize the chapter in four tiers:

- **Tier A, headline features (full treatment):** both new substitution forms, `GLOBSORT`, `compgen -V`, `read -E`, `source -p`, and Readline's `search-ignore-case`. Each gets a before/after example, observable result, minimum version, a literal **"Safe on 5.2?"** line, and a fallback or migration note, using the matrix in section 7.
- **Tier B, smaller user-visible changes (compact table):** one line of purpose, one short example, and availability for each item the editor selects from section 7.5.
- **Tier C, incompatible changes:** the changed parsing of complex `test` expressions, deferred job notifications while sourcing, and the `jobs` list change. Each needs a before/after example executed on both actual versions.
- **Tier D, build and packaging context:** C23 conformance, linking against an external Readline (8.1 or later), and loadable builtins such as `fltexpr` whose availability depends on how a distribution packages them. Keep this separate from reader features.

New syntax must live in separately versioned examples or files. Do not promise that placing an unsupported construct behind a runtime condition makes it safe for every older parser; section 7.3 shows a case that fails. Check the version in a compatible launcher before loading 5.3-only code.

Prefer simpler explicit tests over clever multiargument expressions. [GNU release announcement and compatibility notes](https://lists.gnu.org/archive/html/bash-announce/2025-07/msg00000.html).

### 6.6 Permanent reference

**Purpose:** make the handbook useful after the tutorial is finished.

Provide the components in section 4.4. Each task identifies entry numbers, page numbers, and a relevant chapter when the answer needs context. Recipes do not add entries to the 301.

**Minimum task vocabulary:** separate stdout from stderr; append stderr to a log; save and display output; handle a filename with spaces; find a CPU-heavy process; identify the listener on port 443; stop your own child process; collect a background exit status; preserve a variable while reading a stream; process discovered filenames safely; check an argument; clean up temporary files; trace a failing script; fix a script that fails with Windows line endings; and choose a 5.2-compatible alternative to a 5.3 feature.

The port task must lead to "identify, inspect, then signal the verified process," not indiscriminate termination.

**Minimum error-message vocabulary**, each captured verbatim from both baseline versions: `command not found`; `No such file or directory`; `Permission denied`; `bad substitution`; `unbound variable`; `ambiguous redirect`; `syntax error near unexpected token`; `syntax error: unexpected end of file`; `unary operator expected`; `too many arguments`; `integer expression expected`; `cannot overwrite existing file`; `Argument list too long`; `not a valid identifier`; `readonly variable`; `event not found`; `bad interpreter`; the `'bash\r'` line-ending failure; `invalid option`; `Operation not permitted` and `No such process` from `kill`; and `invalid regular expression` (new in 5.3 for `[[ =~ ]]`). Where wording differs between versions, index both.

**Quick-reference tables:** quoting contexts; expansion order; parameter-expansion forms; redirection operators; `[ ]` versus `[[ ]]` operators; special parameters and key Bash variables; glob patterns, `extglob`, `globstar`, `nullglob`, `failglob`, and `GLOBSORT`; signals with numbers for the tested architecture; exit-status conventions; startup files by shell type; essential Readline key bindings; and a feature-by-version table for every Bash feature the book uses that arrived after 4.4.

Design the one-page cheat card for a full-page photograph: single/double/unquoted context, safe argument quoting, literal versus expanded here-documents, standard descriptors, overwrite/append, stream separation/merging, redirection order, and the Bash-specific markings. Label syntax fragments. The card introduces no unreviewed shorthand.

## 7. Bash 5.3 technical requirements

The table is a writing and verification contract. The alternative substitution forms must not be described as interchangeable wrappers around ordinary command substitution. Rows marked "verified" were tested for v2.0 (section 14.3).

| Item | Required behavior and comparison | Safe on 5.2? / fallback |
| --- | --- | --- |
| `${ command; }` | Capture stdout in the current shell environment; strip trailing newlines; demonstrate a persistent assignment. Compare with `$(...)`. Explain that a space, tab, or newline must follow `{` and that `}` must follow a command terminator. Demonstrate that `exit` ends the calling shell, `return` ends only the substitution, `local` creates variables scoped to the substitution, and positional parameters are shared (a `shift` inside persists). The assignment's status is the command's status. Avoid claiming that external commands cease creating processes. Verified. | **No.** On 5.2 a simple use fails when evaluated with `bad substitution` (status 1); some contents fail when parsed (section 7.3). Use ordinary substitution when isolation is desired, or a function that assigns a caller-visible result when persistence is required. |
| `${\| command; }` | Expand the locally scoped `REPLY`, preserve its trailing newlines, leave stdout on its existing channel, and demonstrate that the caller's previous `REPLY` is restored. No space is required after `\|`. Verified. | **No.** Use an explicit function/result variable; discuss scope and the chosen output channel. |
| `GLOBSORT` | Compare ordinary lexical order with a numeric or size-based result. Cover `name`, `size`, `blocks`, `mtime`, `atime`, `ctime`, `numeric`, and `nosort`; a leading `-` reverses order, a leading `+` is ignored, and `nosort` ignores `-`. Explain numeric all-digit names, name as the secondary key, inode-change time, locale, and the lack of order guarantees under `nosort`. Teach `local GLOBSORT` inside a function to limit its reach. It affects pathname expansion only, not the output order of `ls` or other programs. Verified. | Assignment runs on 5.2 **without error but silently sorts by name**, the most dangerous kind of fallback. Check the version before relying on order, or use a task-specific external sort; do not promise a single universal replacement for all keys. |
| `compgen -V` | Store generated completions in an **indexed array**, rather than printing them. Compare with capturing line-oriented output; preserve element boundaries in the new example. Verified. | **No** for the new option (`invalid option`). Show a 5.2 approach and state its delimiter limitations. |
| `read -E` | Contrast `read -e` filename completion with Bash completion, including programmable completion, under `-E`. Exercise real terminal input. | **No** for the new option. Use `read -e` with reduced completion behavior. |
| `source -p PATH` and `. -p PATH` | Use the supplied colon-separated directory list for a slashless filename; show a controlled fixture and absence of the usual current-directory fallback under this option. Both names accept `-p`. Sourcing executes the file. Verified. | **No** for the new option (`invalid option`). Source an explicit trusted path when its location is known. |
| Readline 8.3 case-insensitive history search | Teach `search-ignore-case`, initially off, with incremental and non-incremental search. Contrast search with filename completion; reset the setting after the demo. | **Depends on the linked Readline library**, not only the Bash number. Verify the actual build; omit the setting when unsupported. |
| `test` with parentheses and more than four arguments | Show that the parse changed for compatibility with coreutils `test`, using the specimen in section 7.4. Teach that such expressions remain ambiguous in both versions. Verified. | **Behavior differs.** Avoid the form; use `[[ ]]` or separate tests joined by `&&`/`\|\|`, which agree on both versions. |
| Job notifications and `jobs` | Interactive shells no longer print completed-job notices while sourcing a script; running `jobs` removes reported completed jobs from the list. Requires terminal tests. | **Behavior differs.** Describe both behaviors; do not script against notification timing. |
| C23 conformance | One build-context paragraph: source conformance and the loss of K&R compiler support. Do not call this a new scripting capability or infer a blanket requirement for a C23-only compiler. | A user-feature compatibility comparison is **not applicable**. |

The substitution requirements follow the [GNU command-substitution reference](https://www.gnu.org/software/bash/manual/html_node/Command-Substitution.html). The sort keys follow the [GNU `GLOBSORT` definition](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html). New completion storage follows the [GNU completion-builtin reference](https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html). Interactive input follows the [GNU `read` reference](https://www.gnu.org/software/bash/manual/html_node/Bash-Builtins.html). Explicit source lookup follows the [GNU dot/source reference](https://www.gnu.org/software/bash/manual/html_node/Bourne-Shell-Builtins.html). History behavior follows the [GNU Readline setting reference](https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File-Syntax.html) and [Readline 8.3 release announcement](https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00004.html).

### 7.1 Central behavior specimen

Run this complete example in a fresh **Bash 5.3** session. The first block shows the older form; the second uses new syntax. It changes only its own shell variables.

```bash
x=before
result=$(x=after; printf 'value\n')
printf 'ordinary: x=%s, result=%s\n' "$x" "$result"

x=before
result=${ x=after; printf 'value\n'; }
printf 'current: x=%s, result=%s\n' "$x" "$result"
```

Expected output (verified on 5.3.20):

```text
ordinary: x=before, result=value
current: x=after, result=value
```

On 5.2.21 the first line prints and the second assignment fails with `${ x=after; printf "value\n"; }: bad substitution`.

### 7.2 `REPLY` specimen

```bash
REPLY=outer
value=${| REPLY=$'line1\n'; echo 'stdout message'; }
printf 'value=%q REPLY=%s\n' "$value" "$REPLY"
```

Expected output (verified on 5.3.20):

```text
stdout message
value=$'line1\n' REPLY=outer
```

The stdout message is printed, not captured; the expansion keeps the trailing newline; and the outer `REPLY` is restored. Do not suggest that the caller should read a lingering new result from `REPLY` afterward.

Also demonstrate, in a child shell so the reader's session survives, that `exit` inside the current-shell form ends the calling shell: `bash -c 'x=${ exit 7; }; echo not reached'; echo "$?"` prints `7`.

### 7.3 Version-guard specimen

A runtime version check cannot protect every older parser. Save each block as its own script. On Bash 5.2.21, the first runs and takes the fallback branch; the second fails to parse, so its guard never gets a chance to run.

```bash
if (( BASH_VERSINFO[0] > 5 || (BASH_VERSINFO[0] == 5 && BASH_VERSINFO[1] >= 3) )); then
  r=${ echo new; }
else
  r=$(echo old)
fi
echo "r=$r"
```

```bash
if false; then r=${ printf '%s ' {a,b}; }; fi
echo "survived parse"
```

On 5.2.21 the second script stops at line 1 with ``syntax error near unexpected token `}'`` and status 2; `survived parse` never prints. On 5.3.20 both scripts run. This is why 5.3-only code lives in separate files loaded after a version check.

### 7.4 `test` parsing specimen

```bash
v='!'
test \( "$v" = y \) -a -n x
echo "status=$?"
```

Bash 5.2.21 prints ``test: `)' expected, found y`` and status 2; Bash 5.3.20 prints status 1. Data that looks like an operator changes the parse. Both `[[ $v = y && -n x ]]` and `[ "$v" = y ] && [ -n x ]` return status 1 on both versions; teach those forms.

### 7.5 Tier B candidates

The editor selects from this list for the chapter's compact table. Every item is in the 5.3 NEWS file; "verified" items were also tested for v2.0.

| Change | Short demonstration | Notes |
| --- | --- | --- |
| `trap -P SIGNAL` prints the trap action | `trap 'echo hi' USR1; trap -P USR1` prints `echo hi` | Verified; 5.2 reports `invalid option` |
| `BASH_MONOSECONDS` | Elapsed-time measurement immune to clock changes | Verified; unset on 5.2 |
| `BASH_TRAPSIG` | Signal number inside a trap action | Verified; numbers vary by architecture |
| `TIMEFORMAT` precision up to six digits | `TIMEFORMAT=%6R; time sleep 0.01` | Verified; 5.2 caps at three digits |
| `printf` alternate form `%#q` forces single quoting | `printf '%#q\n' 'a b'` prints `'a b'` | Verified; 5.2 ignores `#` and prints `a\ b` |
| `[[ =~ ]]` reports an invalid regular expression | `re='('; [[ a =~ $re ]]` | Verified; both return 2, only 5.3 prints a message |
| Unterminated compound command reports its start line | Missing `fi` names `if` and its line | Verified; feeds the debugging section |
| `type -a -P` reports hashed path and `PATH` results | `hash ls; type -a -P ls` | Verified |
| `array_expand_once` replaces `assoc_expand_once` | `shopt array_expand_once` | Option name verified; behavior to test |
| `bash_source_fullpath` | Full paths in `BASH_SOURCE` | Option name verified; behavior to test |
| `wait -n` changes | Returns terminated process substitutions and already-notified jobs | Needs job-control tests |
| Readline `execute-named-command` (M-x in emacs mode), `export-completions`, `force-meta-prefix` | Interactive demonstration | Names verified with bundled Readline 8.3; behavior needs a terminal |
| `fltexpr` loadable builtin | `enable -f PATH/fltexpr fltexpr; fltexpr -p '1.5 * 2'` prints `3` | Verified from a source build; distribution packaging of loadables varies, so label availability |

**Performance.** Explain performance as avoidance of the ordinary substitution's subshell overhead for suitable work, especially builtins/functions. A numerical speed claim requires a reproducible benchmark, recorded workload and environment, and both versions' results. No promised multiplier belongs on the cover or in the chapter without that evidence.

## 8. Example, safety, and portability standards

### 8.1 Example contract

Every code block is one of: **runnable example**, **syntax fragment**, **expected output**, or **interactive procedure**. Do not leave the reader to infer which. Omit shell prompt characters from copyable code. Interactive procedures may show a prompt to separate input from output, and are visibly not copy-and-run blocks. Use plain ASCII punctuation in commands; typesetting must not substitute smart quotes, ligatures, or altered minus signs.

Each runnable example specifies its shell/version, dependencies, working directory, fixtures, privileges, side effects, expected result or assertion, and cleanup/reset. Include setup in the printed example when short; otherwise provide a precise named setup available both in print and the offline bundle. No essential fixture may exist only behind a QR code.

**Single-source the code.** The examples bundle is canonical. Layout pulls each runnable example and expected output from its bundle file by example ID; nobody retypes code into the manuscript or layout.

Prefer self-contained examples using `printf` and locally created files. Label machine-dependent output, avoid pretending fixed PIDs or CPU percentages are reproducible, and use bounded waits rather than indefinite hangs. Include a stop/reset instruction for interactive demonstrations.

Print paths and replacement values unambiguously. A placeholder in angle brackets belongs in a syntax fragment, not in an allegedly copy-and-run command. Network and remote fixtures require a stated lab environment.

### 8.2 Safety beside the operation

Use disposable fixtures for deletion, overwrite, permissions, and process signals. Print preview/check, operation, and restoration or restart instructions adjacent to one another. For operations without undo, say so and provide a backup/fixture restoration route before the operation.

The exact pattern `rm -rf` appears **once** in the handbook, beside a tightly scoped disposable-directory demonstration. Require a nonempty validated target under the known lab root, quoted operands, an end-of-options marker where supported, a visible preview, and fixture recreation. Do not imply these checks make arbitrary paths or untrusted races safe. All other examples use the least powerful cleanup operation that serves the fixture. Verify GNU removal options against the [GNU `rm` documentation](https://www.gnu.org/software/coreutils/manual/html_node/rm-invocation.html).

Do not include disk-wiping commands, broad recursive ownership changes, indiscriminate force-kill recipes, or download-and-execute pipelines. Start process control with a graceful termination request; discuss escalation only with verified target ownership and the consequence for unsaved work. Real system configuration stays outside exercise scope.

History and debug examples use artificial data. Explain that recorded command lines and expanded debug output can contain sensitive arguments; do not require real secrets to demonstrate the feature.

### 8.3 Compatibility environments

Production must test two pinned Bash builds, **5.2.x and 5.3.x**, on a GNU/Linux environment with declared utility versions. Pin the patch level current at technical freeze; on October 1, 2026, GNU had published 5.3 patches through `bash53-020`. Record patch levels, image/build identifiers, locale, shell options, Readline linkage, and package lists. Run with clean startup files, then separately exercise the documented interactive configuration.

Use a second Linux environment with a different package ecosystem for claims about package/system tools. Treat optional tools as additional dependencies rather than "generic Linux." Test BusyBox or macOS only for entries that make an explicit comparison; do not add a blanket compatibility claim or an untested divergence note.

Core examples must pass on both baseline versions. New-feature examples must pass on 5.3 and produce the documented incompatibility or reduced behavior on 5.2. Readline completion and job control require terminal-based tests; piping input is not equivalent. A container test alone does not prove physical terminal or supervisor behavior.

**Should:** where an entry's printed example needs a Bash release newer than 4.4, show a small "Bash 5.x+" marker driven by the manifest's minimum-version field, and verify the minimum on the named older release.

Include hostile-but-valid filenames in relevant fixture tests: spaces, tabs, leading hyphens, wildcard characters, and newlines. Use locale-specific tests where ordering matters. Do not promise that line-oriented examples can safely transport every possible filename.

### 8.4 Drafting tools

Drafting tools, including AI assistants, do not change the evidence standard. Every factual claim, flag, and example must pass the same verification as hand-written material, and the manifest records the verifier, not the drafting method.

## 9. Editorial and design requirements

### 9.1 Voice and teaching

Address the reader as "you." Use the imperative for a concrete action. Keep sentences short where possible. Explain a decision before multiplying alternatives. Give entries factual purposes rather than motivational introductions.

Use terms consistently: terminal, shell, builtin, utility, keyword, operator, expansion, file descriptor, process, job, signal, and exit status. Define each at first relevant use and in the glossary. Call the publication "the handbook" throughout. Avoid distribution rivalry and novelty-led recommendations.

Chapters may use continuous teaching prose; entries use compact, repeated fields. Preserve the difference between a shell-language fragment and a complete command. A tool's man page and verified implementation govern flags; a familiar-looking example is insufficient evidence.

### 9.2 Layout and navigation

Use one main text face, one code face, and a restrained hierarchy. Proposed minimum sizes at final trim: 10.5-point body and 9-point monospaced code; with no page target, prefer 9.5-point code if the sample shows it improves legibility. Prove legibility on a full-size bound print.

Target a code measure of at least 60 characters. In a two-column catalog, allow code blocks to span both columns, or use a single-column catalog, if the sample shows that more than one example in ten would otherwise need a continuation break. Never insert an unsafe command break to fit a measure.

Display each entry number prominently. Running heads identify chapter or category and, in the catalog, the entry range on the page; page feet retain legible folios. Keep headings, code, expected output, and the adjacent caution together. An entry may break across columns or across a facing-page spread, but never across a page turn. Do not place essential warnings only in colored sidebars or decorative icons.

Use color plus text labels, not color alone, for version and portability. Diagrams should explain streams, scope, or process relationships. Screenshots are limited to cases where the interface itself matters; executable text must remain text.

The cheat card occupies one page with high contrast, readable token examples, and no ornamental background. Test a phone photograph at ordinary viewing size, including on a bound copy where the gutter curves. It must remain understandable in grayscale and in the digital PDF.

### 9.3 Digital edition

The reading PDF must have selectable code, correct reading order, tagged headings and tables, bookmarks, linked contents/indexes, descriptive links, and text alternatives for explanatory diagrams. Navigation must work offline within the document. Design toward PDF/UA, but specify any accessibility conformance claim only after a competent audit verifies it.

Extract **every** code block from the final reading PDF, diff it against the bundle source, and rerun the runnable examples in the test environment. Check spaces, line continuations, quoted characters, and here-document delimiters. Code correctness in the manuscript does not prove code correctness after layout.

Print and digital editions share entry numbers and content. The digital edition may add links and download instructions but no extra numbered commands. Essential teaching and reference content must survive loss of a download host.

## 10. Deliverables and ownership

| Deliverable | Required contents | Accountable role |
| --- | --- | --- |
| Approved commissioning brief | This PRD, locked scope, commercial/production decisions | Managing editor/product owner |
| Catalog manifest | 301 accepted entries, reserves, both selection scores, taxonomy, length classes, references, example links | Commissioning editor |
| Manuscript | Six required sections, catalog, front matter, exercises, source/rights notes | Lead writer and section writers |
| Example bundle | Plain-text scripts, fixtures, setup/reset instructions, version labels, expected results, exercise solutions | Technical editor |
| Verification record | Per-example results and environment IDs; interactive receipts; error-message captures; issue disposition | Technical reviewer |
| Extent record | Sample measurements, each projection, growth reviews, final extent, spine width | Production editor |
| Design source | Editable layout, styles, fonts/asset licensing records, linked illustrations | Designer |
| Print master | Printer-approved PDF specification, cover and spine, preflight report, bound-dummy approval | Production editor |
| Reading edition | Accessible offline PDF with tested links and code extraction | Digital production editor |
| Reference assets | General, task, and error-message indexes; quick-reference tables; glossary; "The 301 at a glance"; cheat card | Indexer/editor |
| Release record | Edition/build ID, hashes, sign-offs, source freeze, known limits, errata route | Managing editor |

Roles may be combined for cost, but the author of an example cannot be its sole final technical reviewer. Assign named owners at kickoff. This PRD defines production roles; it does not initiate hiring, purchases, publication, or external messaging.

The examples package uses a simple offline structure: a README; environment/version notes; fixtures; core examples; separately labeled 5.3 examples; exercise solutions; and expected results. Preserve edition-specific filenames and release hashes. Give the README clear per-example setup and reset instructions rather than one dangerous catch-all cleanup command. License the example code so readers may reuse it in their own scripts (section 14.2).

## 11. Workflow, schedule, and budget

### 11.1 Dependency-led production plan

Use an illustrative **twelve-week schedule from approved kickoff** (ten to fourteen weeks depending on staffing and printer lead times). The larger extent adds writing, verification, indexing, and proofing time that v1.0's eight weeks did not carry. This is a production estimate, not a release-date commitment.

| Stage | Indicative timing | Required output and gate |
| --- | --- | --- |
| Commission and feasibility | Weeks 1–2 | 301 accepted candidates, 20 reserves, pinned environments, representative test examples, sample pages, first measured extent projection |
| Commissioning freeze | End of week 2 | Count and taxonomy approved; sample passed; extent projection and binding approach discussed with the printer; outline and roles locked |
| Writing and rolling verification | Weeks 3–7 | Chapters, exercises, and entries delivered in batches; examples reviewed before copyediting; re-projection at about 150 entries |
| Technical and copy freeze | Week 8 | All required tests pass; source checks complete; error messages captured; terminology and cross-references stable |
| Layout and indexes | Weeks 8–10 | First full proof; final re-projection; extent freeze; spine width; indexes generated using actual folios; print/digital checks |
| Reader trial and final proof | Weeks 10–12 | Usability repairs, PDF-extraction tests, bound-dummy check, proof corrections, preflight and release sign-off |

The first sample comprises 12–16 entries spanning short, standard, feature, risky, Bash-specific, optional-tool, and 5.3 cases; one representative chapter spread with its exercises; a page each of the general, task, and error-message indexes; and a draft cheat card. Passing this sample precedes full writing. Density evidence must include realistic cautions and prerequisites.

Freeze entry numbers after catalog selection, before final chapter cross-references. Freeze folios after layout. Any late substantive change reopens the affected tests, indexes, and proofs; a typesetting correction that changes a command is substantive.

### 11.2 Budget method

Build the quote from separately stated labor, production, and fulfillment assumptions. Track accepted entries rather than rewarding word count. Include time for verification and index repair; these are part of the product.

Use these provisional effort allowances for quoting, then recalibrate from the sample's measured hours per entry and per chapter page:

| Work | v1.0 allowance | v2.0 allowance |
| --- | --- | --- |
| Writing and revision | 26–38 person-days | 34–50 person-days |
| Technical editing and independent verification | 21–30 person-days | 28–40 person-days |
| Copyediting and indexing | 10–14 person-days | 14–20 person-days |
| Design and digital production | 12–18 person-days | 16–24 person-days |
| Proofreading and accessibility/preflight checks | 4–6 person-days | 7–10 person-days |
| Managing editorial production | 6–8 person-days | 8–11 person-days |
| Rights, assets, and release administration | 2–3 person-days | 2–3 person-days |
| **Total provisional labor** | **81–117 person-days** | **109–158 person-days** |

The elapsed schedule assumes several roles work concurrently. These are estimates, not vendor quotes. Specify day length and each role's rate.

Budget = agreed labor × rates + asset/licensing costs + print setup + print quantity × landed unit cost at the projected extent and chosen binding + distribution/storage costs at the projected weight + an explicit contingency allowance, provisionally 15% before the sample. Request printer quotes at the low, central, and high ends of the extent projection so the commercial plan sees the range.

Resolve print quantity, binding, currency, tax, retail price, sales channels, and contributor payment terms before commercial commitment. Do not cut technical verification to achieve an arbitrary unit price; reduce optional formats, choose a different binding, or revisit trim first.

## 12. Acceptance gates and release checklist

Use **Must**, **Should**, and **Could** explicitly. All rows below are Must requirements. A known failure in a Must requirement prevents release; an approved deferral must revise the requirement and associated public claim rather than relabel a failing issue as complete.

| Gate / requirement | Evidence required | Sign-off |
| --- | --- | --- |
| G-01: count integrity | Manifest contains exactly 301 released entries, contiguous numbers, no duplicates; final catalog, "The 301 at a glance", and the general index agree | Commissioning editor + production editor |
| G-02: no padding | Distinct-job audit, documented exceptions, reserve disposition, no flag/synonym/assignment inflation; every growth review recorded, with no page lacking a traceable requirement | Managing editor |
| G-03: chapter coverage | All six sections, their exercises, and the cover competencies mapped to outcomes and entry IDs | Lead editor |
| G-04: example integrity | Every runnable example and exercise solution tested in each claimed environment; fragments/procedures labeled; every entry has a caution | Technical reviewer |
| G-05: version accuracy | Before/after records and "Safe on 5.2?" lines; terminal tests; official sources; corrected substitution semantics; Tier C items executed on both versions | Technical editor + independent reviewer |
| G-06: operation safety | Destructive/state-changing fixtures have adjacent checks and restoration/reset; deletion-pattern count checked | Technical reviewer |
| G-07: reference integrity | Every index target resolves to the correct entry and folio; task terms answer the actual task; every indexed error message matches captured output | Indexer + proofreader |
| G-08: reader capability | Trial thresholds in section 3 met; affected repairs retested | Managing editor |
| G-09: visual integrity | Full-size bound print and digital proof show legible code, no clipping, no misleading wrap, no separated caution, adequate gutter | Designer + proofreader |
| G-10: digital integrity | Full code extraction, diff, and rerun passed; offline links work; reading order/tags checked; accessibility claims justified | Digital production editor |
| G-11: rights and release | Original text/assets or cleared licenses; example-code license stated; colophon; printer specification; edition hashes; approval record | Publisher/product owner |
| G-12: extent and binding | Final extent recorded with projection history; spine and binding approved on a bound dummy | Production editor |

Automated checks must cover numbering, category totals, missing fields, duplicate names/aliases, unresolved IDs, missing folios, required chapter/version labels, broken internal links, the restricted deletion-pattern occurrence, and drift between bundle code and code extracted from the PDF. Static shell analysis should flag questionable quoting and control flow; record and adjudicate warnings rather than treating a tool's clean result as proof of behavior.

Technical reviewers verify **all** runnable examples, not a sample. Sample-based visual inspections may focus first on dense or hazardous pages, but final proofreading covers every page. Classify defects: critical for unsafe/wrong executable behavior, missing count integrity, or materially false version claims; major for broken reference routes, unrunnable setup, or unreadable code; minor for copy/layout issues that do not change meaning. Release requires zero unresolved critical or major defects and documented disposition of minor defects.

### 12.1 Requirement traceability

| Cover/assignment promise | Production requirements | Acceptance evidence |
| --- | --- | --- |
| 301 best commands | Section 5 selection, manifest, and count rules; "The 301 at a glance" | G-01, G-02, G-07 |
| Pipe and redirect output | Chapter 2, exercises, tagged entries, stream/scope fixtures | O-01, O-02; G-03, G-04 |
| Monitor processes | Chapter 3, exercises, lab processes and socket task | O-03, O-04; G-04, G-06 |
| Create custom scripts | Chapter 4, exercises, ten-line and integrated scripts, debugging | O-05, O-08; G-04, G-06 |
| Bash 5.3 delta | Section 7 matrix, specimens, and tiered chapter | O-06; G-05 |
| Permanent reference | Offline edition, four lookup routes, quick-reference tables, cheat card | O-07, O-08; G-07, G-09, G-10 |
| Print and digital editions | Paired production files; extent set by content (section 4) | G-09, G-10, G-11, G-12 |

## 13. Risks and change control

| Risk | Early signal | Required response |
| --- | --- | --- |
| 301 drives filler | Repeated flags, synonyms, assignment forms, or weak candidates | Enforce feasibility gate; transfer slots or revise the count claim |
| Open extent invites bloat | Projection grows more than 15% between checkpoints | Duplication and scope audit before writing continues; accept only traceable growth |
| Extent strains cost, weight, or binding | Printer quote at the high projection exceeds the commercial plan | Revisit binding and trim, reduce optional formats; never cut verification or safety content |
| Schedule pushes release into 2027 | Kickoff slips or staffing is thin | Decide the edition label early (section 14.2) rather than at cover approval |
| New syntax breaks older systems | 5.2 parse failure in mixed-version files | Isolate new files, use compatible launch checks, document fallback |
| Upstream change during production | New Bash patch or release before technical freeze | Re-pin at freeze, rerun the suite, record the version in the colophon |
| Distribution assumptions hide dependencies | A baseline image lacks a supposedly standard tool | Add availability labels and update environment manifest |
| Strict options conceal failures | A demo succeeds despite an unhandled error | Rewrite with explicit checks and regression tests |
| Screen output obscures attribution | CPU/port example cannot identify the target | Use controlled fixtures, permissions notes, and bounded observations |
| PDF corrupts executable text | Extracted code differs from bundle source | Fix production styles and rerun extracted examples |
| Exercises drift from examples | Solution files fail after an entry changes | Generate solutions from the bundle; rerun on every substantive change |
| Late replacement breaks references | Manifest, folios, and chapter IDs diverge | Rebuild affected references and reopen proof gates |
| Reference expires with its host | Essential setup is available only online | Embed minimal setup and deliver offline fixtures |

The managing editor owns the change log. A request records reason, affected requirements, count/extent impact, verification impact, cost/schedule impact, and approving owner. Count-line changes, new formats, added privileges, new technical baselines, binding or trim changes, and scope beyond the three competencies are material changes. Extent growth by itself is not a material change; it is governed by the growth review in section 4.2. Correct factual errors immediately and propagate the correction through examples, indexes, cheat card, and digital files.

**Change log entry, October 1, 2026:** product owner removed the fixed page target and the 90–120-page range; extent is set by content under section 4. Recorded as a material change to v1.0.

## 14. Release, maintenance, and open decisions

### 14.1 Release and errata

Record an edition identifier, technical cutoff date, tested versions with patch levels, and download revision in the colophon. Keep the print edition's entry numbers stable in corrected digital builds. If an entry is withdrawn, preserve its index location with a correction notice; do not renumber the remaining 300 items in a silent update.

Provide a durable errata route and downloadable corrections. Archive original release files and publish correction dates. Notify readers of unsafe executable errors promptly through the publisher's chosen channels; the route and owner must be established before release. A future edition may change the catalog with an explicit old-to-new number map.

Deliver a final package that can be read and used offline. Hosting may improve convenience, but the permanent-reference claim rests on the publication itself.

### 14.2 Decisions needed for commissioning

These do not prevent completion of this PRD. The proposed editorial baseline above supplies working defaults; the commercial items remain owner decisions.

| Decision | Proposed baseline / unresolved choice | Decision owner and deadline |
| --- | --- | --- |
| Catalog meaning on cover | Retain supplied line with explicit scope note; adopt expanded syntax taxonomy; numbers are addresses, not ranks | Product owner before count-line approval |
| Extent | **Resolved October 1, 2026:** no page target; content sets extent under section 4 | Product owner (decided) |
| Edition label | "2026 Edition" if release lands in 2026; otherwise consider "2027 Edition", a common label for late-year releases. A twelve-week schedule from a mid-October kickoff ends in January 2027 | Product owner before cover design |
| Formats | Print and accessible PDF; examples ZIP | Product owner before commissioning |
| Trim and binding | A4 baseline; PUR perfect binding with a quoted lay-flat option; decide after the sample projection | Production editor before design freeze |
| Tier B scope | Which section 7.5 items enter the 5.3 chapter | Technical editor at commissioning freeze |
| Older-version markers | Adopt the section 8.3 Should requirement or defer it | Commissioning editor at commissioning freeze |
| Contributor ownership | Named lead writer, technical reviewer, editor, designer, indexer, proofreader | Managing editor at kickoff |
| Test builds | Pinned Linux Bash 5.2.x/5.3.x and recorded Readline; second package ecosystem | Technical editor during feasibility |
| Commercial model | Price, quantity, channels, budget ceiling, and payment terms unspecified | Publisher/product owner before commitments |
| Rights and examples license | Original commissioned prose/code. Recommend a permissive license for example code (for example 0BSD or MIT-0) so readers can reuse it in their own scripts; prose stays under the publisher's terms | Product owner before contracts/release |
| Correction hosting | Durable download/errata route and named maintenance owner | Publisher before release |
| Publication date | Set after feasibility and supplier scheduling, consistent with the edition label | Managing editor/product owner |

### 14.3 Verification status of this PRD

**v1.0 checks.** Official GNU documentation was checked for the named 5.3/Readline changes and the central pipeline, redirection, and error-handling requirements. Local Git for Windows Bash 5.3.9(1)-release was used to test persistent versus isolated substitution, temporary `REPLY` restoration and newline preservation, `compgen -V` array storage, numeric glob ordering, and the history-search setting. The ten-line script was tested with a spaced filename and missing-file failure.

**v2.0 checks**, run on October 1, 2026 on Ubuntu 24.04.4 LTS (GNU coreutils 9.4, procps-ng 4.0.4) against Bash 5.2.21 (distribution build) and Bash 5.3.20 (GNU source with official patches 001–020), each case in a fresh shell without startup files. Scripts and raw results are in `verification/`.

- Confirmed: both specimens in sections 7.1 and 7.2; `exit`, `return`, `local`, shared positional parameters, and status inside `${ ...; }`; `GLOBSORT` numeric, reverse, and size ordering, and its silent name-order fallback on 5.2; `compgen -V`; `source -p` and `. -p`, including no current-directory fallback; `trap -P`; `BASH_MONOSECONDS`; `BASH_TRAPSIG`; six-digit `TIMEFORMAT`; `%#q`; the new regex and unterminated-compound error messages; `type -a -P`; the new `shopt` and Readline names; and `fltexpr` from a source build.
- Confirmed: a version guard protects a simple `${ ...; }` on 5.2 but not one containing brace expansion (section 7.3), and the `test` parsing difference in section 7.4.
- Confirmed on both versions: the ten-line script's outputs and statuses in section 6.4; status 141 for `yes | head -n 1` under `pipefail`; `local x=$(false)` reporting 0; `lastpipe` preserving a variable in a non-interactive shell; and `errexit` being ignored inside a function called from `if`.
- Corrected: the v1.0 count rule implying a syntax difference between `source` and `.` for `-p`. Both names accept it.
- Release date: the announcement is dated Saturday, July 5, 2025, as v1.0 stated.
- Not checked: `read -E`, `search-ignore-case`, and job-notification behavior (they need a real terminal); a second package ecosystem; link resolution for `www.gnu.org` manual pages, which reset connections from the test container. Manual wording was checked against `doc/bashref.texi` in the 5.3 release tarball instead.

These checks validate the PRD's specimens and requirements. They are not a substitute for the publication's pinned GNU/Linux 5.2/5.3 matrix, terminal demonstrations, full 301-entry manifest, reader trial, or production proofs. Those remain explicit commissioning and release gates.

**Recommended next production action:** build and review the 301-candidate manifest and the representative sample together. The sample now does two jobs: it tests whether the count and scope hold, and its measured density produces the first real extent projection, which goes to the printer for binding and cost quotes before full commissioning.
