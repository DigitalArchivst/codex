<!-- markdownlint-disable MD013 -->

# Publication PRD: Shell Handbook, 2026 Edition

**Document version:** 1.0 — proposed commissioning baseline  
**Prepared:** October 1, 2026  
**Prepared by:** Jane-Codex for Steve Little, Codex Desktop  
**Source task:** `01a0f981-b845-7dd0-bc0d-32e0920dc63c`  
**Source transcript:** `C:\Users\jstep\.codex\sessions\2026\10\01\rollout-2026-10-01T18-07-03-01a0f981-b845-7dd0-bc0d-32e0920dc63c.jsonl`  
**Basis:** Steve's supplied assignment, reconstructed from cover claims; official GNU documentation checked on October 1, 2026. Publisher identity, proprietary house style, commercial terms, and the contents of any existing publication are not inferred.  
**Status:** Complete requirements proposal. The handbook, its 301-item manifest, and its production proofs remain to be commissioned and produced. Internal provenance above is excluded from reader-facing files.

## 1. Product decision

Produce a single-topic print and digital handbook that helps terminal users build reliable pipelines, inspect and control processes, and write small Bash scripts. Its principal product is an exactly counted, numbered catalog of **301 practical commands and shell constructs**, supported by worked chapters and three routes into the reference: name, number, and task.

Plan a **112-page interior**, with a separately designed four-page cover. Supply a print-ready PDF, an accessible reading PDF, and an offline examples package. The reading PDF is the required digital edition; EPUB and a hosted website are optional later products with separate budgets.

The 2026 label identifies the edition. Bash 5.3 is its version focus, not a claim that Bash 5.3 first appeared in 2026: the final release was announced on July 5, 2025. [GNU Bash 5.3 release announcement](https://lists.gnu.org/archive/html/bash-announce/2025-07/msg00000.html).

### 1.1 Cover contract

| Element | Required wording or meaning | Body evidence |
| --- | --- | --- |
| Working title | Shell Handbook, 2026 Edition | Edition metadata and colophon agree |
| Count line | 301 Best Bash Commands | Exactly 301 accepted numbered entries, with an explanatory scope note |
| Promise | Supercharge your Linux skills | Demonstrated improvements in the three named competencies |
| Retention | Keep this guide as a permanent reference | Offline usability, task index, cheat card, stable entry numbers |
| Version hook | Includes Bash 5.3 — new features and updates | Dedicated behavior-and-compatibility chapter |
| Competency 1 | Pipe and redirect output | Worked chapter, catalog tags, task index, practical assessment |
| Competency 2 | Monitor processes | Worked chapter, catalog tags, task index, practical assessment |
| Competency 3 | Create custom scripts | Worked chapter, catalog tags, task index, practical assessment |

Keep publisher names omitted throughout this PRD. Cover imagery, including the nautilus, is an art-direction choice. Do not carry it into a prose metaphor or imitate an unidentified publisher's layout.

### 1.2 Editorial refinements to the supplied assignment

Adopt these refinements as part of the proposed baseline:

1. **Explain the count honestly.** Builtins, external utilities, and typed shell syntax are different things. Expand the catalog's permitted syntax to include control words, expansions, and purposeful assignment forms as well as operators. Give each its correct type. The opening scope note must say that “commands” on the cover includes these Bash constructs; external tools are run from Bash. If the editor will not accept that qualification, revise the cover wording before commissioning.
2. **Remove the separate quota of 15 Bash 5.3 entries.** Integrate genuinely distinct new constructs into their natural categories. Update existing entries for new modes of `read`, `source`, and `compgen`. Apply a version tag without counting the same entry again.
3. **Correct the `REPLY` description.** The pipe-prefixed substitution expands a temporary local `REPLY`; it does not capture stdout or leave that temporary value in the caller's `REPLY`. See section 7.
4. **Qualify the pipeline rule.** Explain the usual subshell behavior, then the `lastpipe` exception. Avoid an absolute statement that assignments in every possible pipeline must disappear.
5. **Treat strict options as choices.** Teach explicit status checks alongside `set -euo pipefail`; do not advertise that line as an automatic safety guarantee.
6. **Define “installed by default” against tested environments.** No single installation profile covers every Linux system. Optional and ecosystem-specific tools require visible dependency labels.

These are requirements proposals, not claims that the original cover's publisher has endorsed them.

## 2. Reader, problem, and intended use

### 2.1 Primary reader

You can log in, open a terminal, navigate directories, and edit a file. You still interrupt your work to look up syntax, assemble a pipeline by trial and error, or discover that a script breaks on a filename containing spaces. You may know a command's name without knowing whether Bash provides it or executes an external program.

The handbook must serve three reading patterns:

- **Find:** identify the right tool or construct for a task in under a minute.
- **Apply:** copy a small verified example, adapt the clearly identified inputs, and check its result.
- **Understand:** follow a worked chapter when an isolated command is insufficient.

### 2.2 Secondary reader

You already script and need to judge whether a Bash 5.3 feature improves your work, changes behavior, or breaks a deployment still running 5.2. Provide a short delta route through the version chapter, its compatibility table, and version-tagged entries.

### 2.3 Scope boundaries

Include GNU/Linux command-line work, Bash's execution model, modest text processing, process inspection, read-only system and package queries, and small scripts that integrate these tasks. Assume Bash 5.2 as the ordinary example baseline; clearly label 5.3-only material.

Exclude first-install guidance, distribution rankings, kernel tuning, comprehensive language instruction, disk partitioning, firewall administration, penetration testing, service deployment, and exhaustive manuals for tools such as `awk`. Do not turn network and system-query coverage into a second administration book.

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

Before final proof, conduct a usability trial with at least five representative readers, including at least one experienced scripter. At least four of five must complete O-01, O-03, O-05, and O-06 without facilitator instruction beyond locating the exercise, and meet O-07's retrieval threshold. Record completion, wrong turns, and ambiguity; repair failures and retest affected tasks. This is a practical release check, not a population-level research claim.

Post-release indicators may include errata volume, reported lookup problems, and download success. Sales targets, pricing, and conversion measures belong to the publisher's commercial plan; do not invent them here.

## 4. Architecture, extent, and density

Use this reading order: opening material → five worked chapters → grouped catalog → permanent-reference section. The sixth required chapter is the reference section. Chapter cross-references point forward to entry numbers; catalog entries point back to chapter sections and pages.

### 4.1 Proposed 112-page interior

| Component | Pages | Proposed folios | Purpose |
| --- | ---: | --- | --- |
| Front matter | 4 | 1–4 | Title/colophon, contents, scope/legend, environment and example conventions |
| 1. Power at your fingertips | 6 | 5–10 | Execution model, discovery, safe workspace |
| 2. Pipe and redirect output | 8 | 11–18 | Streams, pipelines, scope, status |
| 3. Monitor processes | 8 | 19–26 | Inspection, signals, jobs, diagnostic sequence |
| 4. Create custom scripts | 10 | 27–36 | Arguments, quoting, status, functions, cleanup |
| 5. Bash 5.3, new features and updates | 8 | 37–44 | Behavior changes, compatibility, migration decisions |
| The 301: grouped catalog | 60 | 45–104 | Exactly counted entries |
| 6. Permanent reference | 8 | 105–112 | Alphabetical, numerical, and task indexes; one-page cheat card |
| **Total interior** | **112** | **1–112** | Within the 90–120-page target |

Cover pages are additional. No advertising pages are assumed. Confirm printing, binding, trim, and any signature requirements with the printer before final pagination. The baseline trim proposal is A4, 210 × 297 mm; the design must still pass a full-size sample proof.

Catalog planning density is approximately **five entries per page**, using two columns. Budget 60–85 prose words per entry plus compact syntax and example blocks. An entry may occupy up to half a page, but that is an exception; shorter entries must compensate. Plan approximately 36,000–42,000 prose words across the interior, with code and indexes budgeted separately by actual layout.

The 40 worked-chapter pages allow approximately 12,000–15,000 prose words with examples, diagrams, and exercises. These are planning estimates, not incentives to fill space. A representative sample must prove density before all 301 entries are written.

If fitting fails, edit duplication, shorten an example without losing its setup, or reallocate pages. Do not solve it by hiding cautions, dropping runnable prerequisites, or shrinking below the typography floor. Moving to a 120-page interior needs a revised page plan; exceeding 120 or reducing the cover count requires an explicit product decision.

### 4.2 Reference-section allocation

Reserve three pages for an alphabetical index, two for a compact number-to-name-and-page index, two for task lookup, and one for the cheat card. Verify actual line counts in the sample proof. If either index needs more room, reclaim catalog space only after a fit test; do not silently omit index records.

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

### 5.2 Unit of count

One entry is one independently useful command or typed shell construct with a distinct job. A utility appears once even if the chapters use it repeatedly. A syntax family may have separate entries when readers must choose between materially different behavior, such as overwrite and append.

| Case | Count treatment |
| --- | --- |
| `ls` and its ordinary display options | One entry; options belong within it |
| `find` and `find -exec` | A second entry is permitted for safe command execution on discovered paths; document the distinct job |
| `>` and `>>` | Separate operator entries: overwrite and append differ materially |
| `read` and `read -E` | One builtin entry with a 5.3 mode and a chapter cross-reference |
| `compgen` and `compgen -V` | One builtin entry with a 5.3 result-storage mode |
| `source` and `.` | One entry with both names indexed; mark the syntax difference for the new option |
| `mapfile` and `readarray` | One entry with a synonym |
| `$(...)`, `${ command; }`, `${\| command; }` | Separate expansion entries because execution scope and output channels differ |
| `GLOBSORT=value` | One purposeful assignment-form entry; sort keys and directions do not multiply the count |
| `printf` as builtin and external utility | One entry identifying the implementation used and relevant differences |
| Several examples of one task | Examples are not entries |
| Readline settings or keystrokes | Teach under the relevant builtin/configuration entry; do not manufacture numbered commands from each setting |

Plain variable names, isolated flags, duplicate spellings, recipes assembled from already counted components, and explanatory headings do not create extra entries. Use one dedicated entry for parameter defaulting rather than separate entries for each minor modifier unless the editor records a distinct task case.

### 5.3 Selection standard

Score each candidate from 0–3 on five factors: recurring use, contribution to the cover competencies, clarity within the entry format, availability in the declared environments, and distinctness from accepted entries. Ordinarily require at least 10/15. Record any exception for a cover-critical construct; novelty alone never qualifies.

Prepare **301 accepted candidates plus at least 20 unnumbered reserves** before full commissioning. Reserves allow replacement of an example that proves unsafe, obsolete, duplicative, or too large. All candidates require a verified documentation source and an example plan. Do not claim that this PRD itself proves the feasibility of 301 high-quality entries.

When tools overlap, prefer the broadly available tool in the baseline environments. Mention an alternative briefly without counting it. Exceptions require a genuinely distinct job or a different system ecosystem; package-query tools for different ecosystems must be labeled accordingly. Prefer `top` for the main walkthrough if installed; an enhanced monitor may be mentioned without creating a parallel tutorial.

If the inventory cannot support 301 under these rules, stop count-line approval and present the shortfall. The editor may revise scope or propose a different count; writers may not pad or quietly weaken the rules.

### 5.4 Entry classification

Every entry carries three independent labels:

- **Kind:** Bash builtin; external utility; or shell syntax, with subtype operator, keyword/compound construct, expansion, or assignment.
- **Portability:** POSIX-defined form; Bash-specific form; GNU-specific form; or Linux/ecosystem-specific form. Label the printed example, not merely the command's name.
- **Availability:** shell-provided; baseline package; or additional package/system prerequisite. Give the package or provider where needed.

Use a separate **Requires Bash 5.3** tag where applicable. A POSIX utility using a GNU-only flag needs a GNU-specific example label. `grep` is external. `if` is syntax. `GLOBSORT` is not a builtin. The legend must make these distinctions legible without requiring the reader to learn the production database.

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

Store canonical entry records in a structured manifest, such as JSON, and generate editorial tables from it. Required fields: stable internal ID; final number; canonical display name; aliases; category; kind; portability; provider; minimum Bash version; competency tags; purpose; syntax; example ID; expected result; caution; documentation URL and section; checked date; reviewer; verification state; chapter links; task terms; and final folio.

Stable internal IDs survive reordering. Final numbers become immutable at count freeze. A replacement inherits the removed entry's slot only after all text, index terms, and tests are updated. Removed candidates remain in the editorial history but never in the release count. Indexes and chapter references are built from this manifest, then checked against the final PDF.

### 5.6 Specimen entry

**Number:** assigned at count freeze. **Name:** `printf`. **Kind:** Bash builtin. **Portability:** POSIX-defined example. **Availability:** shell-provided.

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

### 6.1 Power at your fingertips

**Purpose:** establish the mental model and a reliable way to explore commands.

Teach the shell as a command interpreter, the terminal as its interface, interactive use versus scripts, and the practical difference between a builtin and an external utility. Show command discovery with Bash's own help and command-identification facilities; introduce man-page sections, synopsis notation, and the fact that some commands do not implement a GNU-style help flag.

Create a disposable workspace with a printed, verified path and fixtures. Explain prompts, comments, syntax fragments, expected output, working-directory assumptions, and privilege labels. Show how to inspect a snippet before running it and how to stop a foreground command. Name the interpreter requirement before the reader tries Bash syntax through another shell.

**Worked deliverable:** identify the implementation of three commands, read a relevant help section, create a fixture, and run a harmless command that prints its result.

**Required diagram:** command line → Bash parsing and expansion → builtin or external program → streams and status.

### 6.2 Pipe and redirect output

**Purpose:** let the reader predict where data goes and where state lives.

Teach descriptors 0/1/2; input, overwrite, append, stderr-only output, combined output, descriptor duplication, and the left-to-right effect of redirection order. Compare separate logs with merged streams. Include here-documents with quoted and unquoted delimiters, here-strings, process substitution, and `tee` for retaining a stream while passing it onward. [GNU redirection reference](https://www.gnu.org/software/bash/manual/html_node/Redirections.html).

Build a short pipeline from a fixture that deliberately emits both streams. Show a loop losing its assignment under ordinary pipeline execution, then preserve state by feeding the loop through redirection or process substitution. Include the `lastpipe` exception when job control is inactive. Explain pipeline status, `pipefail`, and why preserving individual statuses must happen immediately. [GNU pipeline reference](https://www.gnu.org/software/bash/manual/html_node/Pipelines.html).

Discuss buffering, early consumers, and the difference between a program waiting for input and a pipeline that has not reached end-of-file. Process substitution is not a free substitute for pipeline status handling; its producer's failure needs separate consideration.

**Worked deliverable:** a small log-summary pipeline, separate error log, and a repeat run that proves append behavior.

**Required diagrams:** two streams through a pipeline; the two different orders of stream duplication; ordinary pipeline scope versus a redirected loop.

### 6.3 Monitor processes

**Purpose:** identify the right process before changing it.

Use `ps`, `pgrep`, and `top` to distinguish a PID, parent, process group, command, state, and CPU observation. Show filters that avoid mistaking the search command for the target. Treat resource output as time-dependent; one snapshot does not prove a sustained problem.

Teach `jobs`, `fg`, `bg`, `disown`, `kill`, and `wait` with a lab child process. Distinguish the interactive job table from PID-based script management, stopping from terminating, and a termination request from confirmed exit. Explain that `disown` changes shell job handling rather than providing a general service supervisor.

For port diagnosis, inspect a local listening socket, identify the owning process where permissions allow, and inspect its command before signaling. The task label may mention port 443, but the runnable exercise uses an unprivileged lab port such as 8443. Never have the reader kill an unidentified production listener to complete an exercise.

Show a diagnostic order for a stuck pipeline: inputs and EOF → process state and parentage → resource observations → intended signal → verified result. Explain when a supervisor may restart a process.

**Worked deliverables:** controlled background child with status collection; CPU observation; lab socket attribution. Provide permission and missing-tool alternatives without assuming root.

### 6.4 Create custom scripts

**Purpose:** package useful shell work so it behaves predictably on success and failure.

Teach a Bash shebang, file execution, argument handling, quoting, functions, local variables, return versus exit, stderr diagnostics, and checked exit status. Use positional arguments for the shortest script and `getopts` for a later small utility. Keep user data out of format strings and evaluation. Use arrays for argument lists where appropriate; do not teach splitting arbitrary command output as a universal loop pattern.

Include `set -euo pipefail`, with worked exceptions and an explanation of expected nonzero results. Cover conditions, AND/OR lists, functions invoked in conditional contexts, and command substitution. Explicit checks remain necessary for critical operations. Do not silently discard the original status through negation or a subsequent command. [GNU shell-option reference](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html).

Teach temporary files/directories, ownership of cleanup, an exit trap that preserves the intended result, missing dependencies, filenames containing spaces or leading hyphens, and a reproducible cleanup path. Explain that a shebang does not control the interpreter when a reader explicitly invokes a different shell.

**Worked deliverables:** the ten-line line-count script below; a small pipeline-based report; and a bounded process helper that records and waits for its own children. Longer examples may be 15–30 lines; ten lines is the minimum competency exercise, not a universal script limit.

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

Test with a two-line fixture whose filename contains spaces, a missing file, and a missing argument. Explain that this counts newline characters, so a final unterminated line is a deliberate edge case rather than an invisible defect.

### 6.5 Bash 5.3, new features and updates

**Purpose:** help an experienced reader decide what to adopt and where it can run.

Open with a concise version-check and compatibility summary. Teach behavioral differences using the matrix in section 7. Every user-facing feature gets a before/after example, observable result, minimum version, a literal **“Safe on 5.2?”** line, and a fallback or migration note.

New syntax must live in separately versioned examples or files. Do not promise that placing an unsupported construct behind a runtime condition makes it safe for every older parser. Check the version in a compatible launcher before loading 5.3-only code.

Add a short “other behavior changes” box covering the changed parsing of complex `test` expressions and deferred interactive completed-job notifications while sourcing a script. Prefer simpler explicit tests over clever multiargument expressions. Any before/after regression example must be executed on both actual versions. Keep the C23 paragraph separate from reader features. [GNU release announcement and compatibility notes](https://lists.gnu.org/archive/html/bash-announce/2025-07/msg00000.html).

### 6.6 Permanent reference

**Purpose:** make the issue useful after the tutorial is finished.

Provide complete number and alphabetical indexes, plus task lookup expressed in the reader's language. Each task identifies entry numbers, page numbers, and a relevant chapter when the answer needs context. Recipes do not add entries to the 301.

Minimum task vocabulary includes: separate stdout from stderr; append stderr to a log; save and display output; handle a filename with spaces; find a CPU-heavy process; identify the listener on port 443; stop your own child process; collect a background exit status; preserve a variable while reading a stream; process discovered filenames safely; check an argument; clean up temporary files; and choose a 5.2-compatible alternative to a 5.3 feature.

The port task must lead to “identify, inspect, then signal the verified process,” not indiscriminate termination.

Design the one-page cheat card for a full-page photograph: single/double/unquoted context, safe argument quoting, literal versus expanded here-documents, standard descriptors, overwrite/append, stream separation/merging, redirection order, and the Bash-specific markings. Label syntax fragments. The card introduces no unreviewed shorthand.

## 7. Bash 5.3 technical requirements

The table is a writing and verification contract. The alternative substitution forms must not be described as interchangeable wrappers around ordinary command substitution.

| Item | Required behavior and comparison | Safe on 5.2? / fallback |
| --- | --- | --- |
| `${ command; }` | Capture stdout in the current shell environment; strip trailing newlines; demonstrate a persistent assignment. Compare with `$(...)`. Explain the space and command terminator. Avoid claiming that external commands cease creating processes. | **No.** Use ordinary substitution when isolation is desired, or a function that assigns a caller-visible result when persistence is required. |
| `${\| command; }` | Expand the locally scoped `REPLY`, preserve its trailing newlines, leave stdout on its existing channel, and demonstrate that the caller's previous `REPLY` is restored. | **No.** Use an explicit function/result variable; discuss scope and the chosen output channel. |
| `GLOBSORT` | Compare ordinary lexical order with a numeric or size-based result. Cover `name`, `size`, `blocks`, `mtime`, `atime`, `ctime`, `numeric`, and `nosort`; `+`/`-` control direction. Explain numeric all-digit names, inode-change time, locale, and the lack of order guarantees under `nosort`. | Assignment syntax runs on 5.2, but **the sorting behavior does not**. Use a task-specific external sort; do not promise a single universal replacement for all keys. |
| `compgen -V` | Store generated completions in an **indexed array**, rather than printing them. Compare with capturing line-oriented output; preserve element boundaries in the new example. | **No** for the new option. Show a 5.2 approach and state its delimiter limitations. |
| `read -E` | Contrast `read -e` filename completion with Bash completion, including programmable completion, under `-E`. Exercise real terminal input. | **No** for the new option. Use `read -e` with reduced completion behavior. |
| `source -p PATH` | Use the supplied colon-separated directory list for a slashless filename; show a controlled fixture and absence of the usual current-directory fallback under this option. Sourcing executes the file. | **No** for the new option. Source an explicit trusted path when its location is known. |
| Readline 8.3 case-insensitive history search | Teach `search-ignore-case`, initially off, with incremental and non-incremental search. Contrast search with filename completion; reset the setting after the demo. | **Depends on the linked Readline library**, not only the Bash number. Verify the actual build; omit the setting when unsupported. |
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

Expected output:

```text
ordinary: x=before, result=value
current: x=after, result=value
```

The separate pipe-prefixed specimen must set `REPLY=outer` before substitution, assign a result containing a newline inside substitution, print an independent stdout message, and demonstrate restoration of the outer value. Do not suggest that the caller should read a lingering new result from `REPLY` afterward.

Explain performance as avoidance of the ordinary substitution's subshell overhead for suitable work, especially builtins/functions. A numerical speed claim requires a reproducible benchmark, recorded workload and environment, and both versions' results. No promised multiplier belongs on the cover or in the chapter without that evidence.

## 8. Example, safety, and portability standards

### 8.1 Example contract

Every code block is one of: **runnable example**, **syntax fragment**, **expected output**, or **interactive procedure**. Do not leave the reader to infer which. Omit shell prompt characters from copyable code. Use plain ASCII punctuation in commands; typesetting must not substitute smart quotes, ligatures, or altered minus signs.

Each runnable example specifies its shell/version, dependencies, working directory, fixtures, privileges, side effects, expected result or assertion, and cleanup/reset. Include setup in the printed example when short; otherwise provide a precise named setup available both in print and the offline bundle. No essential fixture may exist only behind a QR code.

Prefer self-contained examples using `printf` and locally created files. Label machine-dependent output, avoid pretending fixed PIDs or CPU percentages are reproducible, and use bounded waits rather than indefinite hangs. Include a stop/reset instruction for interactive demonstrations.

Print paths and replacement values unambiguously. A placeholder in angle brackets belongs in a syntax fragment, not in an allegedly copy-and-run command. Network and remote fixtures require a stated lab environment.

### 8.2 Safety beside the operation

Use disposable fixtures for deletion, overwrite, permissions, and process signals. Print preview/check, operation, and restoration or restart instructions adjacent to one another. For operations without undo, say so and provide a backup/fixture restoration route before the operation.

The exact pattern `rm -rf` appears **once** in the issue, beside a tightly scoped disposable-directory demonstration. Require a nonempty validated target under the known lab root, quoted operands, an end-of-options marker where supported, a visible preview, and fixture recreation. Do not imply these checks make arbitrary paths or untrusted races safe. All other examples use the least powerful cleanup operation that serves the fixture. Verify GNU removal options against the [GNU `rm` documentation](https://www.gnu.org/software/coreutils/manual/html_node/rm-invocation.html).

Do not include disk-wiping commands, broad recursive ownership changes, indiscriminate force-kill recipes, or download-and-execute pipelines. Start process control with a graceful termination request; discuss escalation only with verified target ownership and the consequence for unsaved work. Real system configuration stays outside exercise scope.

History and debug examples use artificial data. Explain that recorded command lines and expanded debug output can contain sensitive arguments; do not require real secrets to demonstrate the feature.

### 8.3 Compatibility environments

Production must test two pinned Bash builds, **5.2.x and 5.3.x**, on a GNU/Linux environment with declared utility versions. Record patch levels, image/build identifiers, locale, shell options, Readline linkage, and package lists. Run with clean startup files, then separately exercise the documented interactive configuration.

Use a second Linux environment with a different package ecosystem for claims about package/system tools. Treat optional tools as additional dependencies rather than “generic Linux.” Test BusyBox or macOS only for entries that make an explicit comparison; do not add a blanket compatibility claim or an untested divergence note.

Core examples must pass on both baseline versions. New-feature examples must pass on 5.3 and produce the documented incompatibility or reduced behavior on 5.2. Readline completion and job control require terminal-based tests; piping input is not equivalent. A container test alone does not prove physical terminal or supervisor behavior.

Include hostile-but-valid filenames in relevant fixture tests: spaces, tabs, leading hyphens, wildcard characters, and newlines. Use locale-specific tests where ordering matters. Do not promise that line-oriented examples can safely transport every possible filename.

## 9. Editorial and design requirements

### 9.1 Voice and teaching

Address the reader as “you.” Use the imperative for a concrete action. Keep sentences short where possible. Explain a decision before multiplying alternatives. Give entries factual purposes rather than motivational introductions.

Use terms consistently: terminal, shell, builtin, utility, keyword, operator, expansion, file descriptor, process, job, signal, and exit status. Define each at first relevant use. Avoid distribution rivalry and novelty-led recommendations.

Chapters may use continuous teaching prose; entries use compact, repeated fields. Preserve the difference between a shell-language fragment and a complete command. A tool's man page and verified implementation govern flags; a familiar-looking example is insufficient evidence.

### 9.2 Layout and navigation

Use one main text face, one code face, and a restrained hierarchy. Proposed minimum sizes at final trim: 10.5-point body and 9-point monospaced code. Prove legibility on a full-size print; increasing sizes may require revised density. Keep catalog code to approximately 44 characters per line where possible, without inserting unsafe command breaks.

Display each entry number prominently. Running heads identify chapter or category; page feet retain legible folios. Keep headings, code, expected output, and the adjacent caution together. Avoid an entry split across a page turn. Do not place essential warnings only in colored sidebars or decorative icons.

Use color plus text labels, not color alone, for version and portability. Diagrams should explain streams, scope, or process relationships. Screenshots are limited to cases where the interface itself matters; executable text must remain text.

The cheat card occupies one page with high contrast, readable token examples, and no ornamental background. Test a phone photograph at ordinary viewing size. It must remain understandable in grayscale and in the digital PDF.

### 9.3 Digital edition

The reading PDF must have selectable code, correct reading order, tagged headings and tables, bookmarks, linked contents/indexes, descriptive links, and text alternatives for explanatory diagrams. Navigation must work offline within the document. Specify any accessibility conformance claim only after a competent audit verifies it.

Copy selected examples from the final PDF back into the test environment and rerun them. Check spaces, line continuations, quoted characters, and here-document delimiters. Code correctness in the manuscript does not prove code correctness after layout.

Print and digital editions share entry numbers and content. The digital edition may add links and download instructions but no extra numbered commands. Essential teaching and reference content must survive loss of a download host.

## 10. Deliverables and ownership

| Deliverable | Required contents | Accountable role |
| --- | --- | --- |
| Approved commissioning brief | This PRD, locked scope, commercial/production decisions | Managing editor/product owner |
| Catalog manifest | 301 accepted entries, reserves, scores, taxonomy, references, example links | Commissioning editor |
| Manuscript | Six required sections, catalog, front matter, source/rights notes | Lead writer and section writers |
| Example bundle | Plain-text scripts, fixtures, setup/reset instructions, version labels, expected results | Technical editor |
| Verification record | Per-example results and environment IDs; interactive receipts; issue disposition | Technical reviewer |
| Design source | Editable layout, styles, fonts/asset licensing records, linked illustrations | Designer |
| Print master | Printer-approved PDF specification, cover, preflight report | Production editor |
| Reading edition | Accessible offline PDF with tested links and code extraction | Digital production editor |
| Reference assets | Complete indexes and the one-page cheat card | Indexer/editor |
| Release record | Edition/build ID, hashes, sign-offs, source freeze, known limits, errata route | Managing editor |

Roles may be combined for cost, but the author of an example cannot be its sole final technical reviewer. Assign named owners at kickoff. This PRD defines production roles; it does not initiate hiring, purchases, publication, or external messaging.

The examples package uses a simple offline structure: a README; environment/version notes; fixtures; core examples; separately labeled 5.3 examples; and expected results. Preserve edition-specific filenames and release hashes. Give the README clear per-example setup and reset instructions rather than one dangerous catch-all cleanup command.

## 11. Workflow, schedule, and budget

### 11.1 Dependency-led production plan

Use an illustrative **eight-week schedule from approved kickoff**, subject to staffing and printer lead times. This is a production estimate, not a release-date commitment.

| Stage | Indicative timing | Required output and gate |
| --- | --- | --- |
| Commission and feasibility | Weeks 1–2 | 301 accepted candidates, 20 reserves, pinned environments, representative test examples, sample pages |
| Commissioning freeze | End of week 2 | Count and taxonomy approved; page-density test passed; outline and roles locked |
| Writing and rolling verification | Weeks 3–5 | Chapters and entries delivered in batches; examples reviewed before copyediting |
| Technical and copy freeze | Week 6 | All required tests pass; source checks complete; terminology and cross-references stable |
| Layout and indexes | Weeks 6–7 | First full proof; indexes generated using actual folios; print/digital checks |
| Reader trial and final proof | Weeks 7–8 | Usability repairs, PDF-copy tests, proof corrections, preflight and release sign-off |

The first sample comprises 12–16 entries spanning short, long, risky, Bash-specific, optional-tool, and 5.3 cases; one representative chapter spread; and a draft cheat card. Passing this sample precedes full writing. Page-density evidence must include realistic cautions and prerequisites.

Freeze entry numbers after catalog selection, before final chapter cross-references. Freeze folios after layout. Any late substantive change reopens the affected tests, indexes, and proofs; a typesetting correction that changes a command is substantive.

### 11.2 Budget method

Build the quote from separately stated labor, production, and fulfillment assumptions. Track accepted entries rather than rewarding word count. Include time for verification and index repair; these are part of the product.

Use these provisional effort allowances for quoting, then revise after the sample:

| Work | Planning allowance |
| --- | --- |
| Writing and revision | 26–38 person-days |
| Technical editing and independent verification | 21–30 person-days |
| Copyediting and indexing | 10–14 person-days |
| Design and digital production | 12–18 person-days |
| Proofreading and accessibility/preflight checks | 4–6 person-days |
| Managing editorial production | 6–8 person-days |
| Rights, assets, and release administration | 2–3 person-days |
| **Total provisional labor** | **81–117 person-days across the team** |

The elapsed schedule assumes several roles work concurrently. These are estimates, not vendor quotes. Specify day length and each role's rate. Budget = agreed labor × rates + asset/licensing costs + print setup + print quantity × landed unit cost + distribution/storage costs + an explicit contingency allowance, provisionally 15% before the sample.

Resolve print quantity, binding, currency, tax, retail price, sales channels, and contributor payment terms before commercial commitment. Do not cut technical verification to achieve an arbitrary unit price; reduce optional formats or adjust extent first.

## 12. Acceptance gates and release checklist

Use **Must**, **Should**, and **Could** explicitly. All rows below are Must requirements. A known failure in a Must requirement prevents release; an approved deferral must revise the requirement and associated public claim rather than relabel a failing issue as complete.

| Gate / requirement | Evidence required | Sign-off |
| --- | --- | --- |
| G-01: count integrity | Manifest contains exactly 301 released entries, contiguous numbers, no duplicates; final catalog and both complete indexes agree | Commissioning editor + production editor |
| G-02: no padding | Distinct-job audit, documented exceptions, reserve disposition, no flag/synonym inflation | Managing editor |
| G-03: chapter coverage | All six sections and cover competencies mapped to outcomes and entry IDs | Lead editor |
| G-04: example integrity | Every runnable example tested in each claimed environment; fragments/procedures labeled; every entry has a caution | Technical reviewer |
| G-05: version accuracy | Before/after records and “Safe on 5.2?” lines; terminal tests; official sources; corrected substitution semantics | Technical editor + independent reviewer |
| G-06: operation safety | Destructive/state-changing fixtures have adjacent checks and restoration/reset; deletion-pattern count checked | Technical reviewer |
| G-07: reference integrity | Every index target resolves to the correct entry and folio; task terms answer the actual task | Indexer + proofreader |
| G-08: reader capability | O-01/O-03/O-05/O-06 and O-07 trial thresholds met; affected repairs retested | Managing editor |
| G-09: visual integrity | Full-size print and digital proof show legible code, no clipping, no misleading wrap, no separated caution | Designer + proofreader |
| G-10: digital integrity | Text extraction/rerun passed; offline links work; reading order/tags checked; accessibility claims justified | Digital production editor |
| G-11: rights and release | Original text/assets or cleared licenses; colophon; printer specification; edition hashes; approval record | Publisher/product owner |

Automated checks must cover numbering, category totals, missing fields, duplicate names/aliases, unresolved IDs, missing folios, required chapter/version labels, broken internal links, and the restricted deletion-pattern occurrence. Static shell analysis should flag questionable quoting and control flow; record and adjudicate warnings rather than treating a tool's clean result as proof of behavior.

Technical reviewers verify **all** runnable examples, not a sample. Sample-based visual inspections may focus first on dense or hazardous pages, but final proofreading covers every page. Classify defects: critical for unsafe/wrong executable behavior, missing count integrity, or materially false version claims; major for broken reference routes, unrunnable setup, or unreadable code; minor for copy/layout issues that do not change meaning. Release requires zero unresolved critical or major defects and documented disposition of minor defects.

### 12.1 Requirement traceability

| Cover/assignment promise | Production requirements | Acceptance evidence |
| --- | --- | --- |
| 301 best commands | Section 5 selection, manifest, and count rules | G-01, G-02, G-07 |
| Pipe and redirect output | Chapter 2, tagged entries, stream/scope fixtures | O-01, O-02; G-03, G-04 |
| Monitor processes | Chapter 3, lab processes and socket task | O-03, O-04; G-04, G-06 |
| Create custom scripts | Chapter 4, ten-line and integrated scripts | O-05; G-04, G-06 |
| Bash 5.3 delta | Section 7 matrix and compatibility examples | O-06; G-05 |
| Permanent reference | Offline edition, three lookup routes, cheat card | O-07; G-07, G-09, G-10 |
| Print and digital, 90–120 pages | 112-page plan and paired production files | G-09, G-10, G-11 |

## 13. Risks and change control

| Risk | Early signal | Required response |
| --- | --- | --- |
| 301 drives filler | Repeated flags, synonyms, or weak candidates | Enforce feasibility gate; transfer slots or revise the count claim |
| Layout exceeds extent | Sample needs more space than the budget allows | Revise density/extent before full commissioning; retain typography floor |
| New syntax breaks older systems | 5.2 parse failure in mixed-version files | Isolate new files, use compatible launch checks, document fallback |
| Distribution assumptions hide dependencies | A baseline image lacks a supposedly standard tool | Add availability labels and update environment manifest |
| Strict options conceal failures | A demo succeeds despite an unhandled error | Rewrite with explicit checks and regression tests |
| Screen output obscures attribution | CPU/port example cannot identify the target | Use controlled fixtures, permissions notes, and bounded observations |
| PDF corrupts executable text | Copied commands differ from source | Fix production styles and rerun extracted examples |
| Late replacement breaks references | Manifest, folios, and chapter IDs diverge | Rebuild affected references and reopen proof gates |
| Reference expires with its host | Essential setup is available only online | Embed minimal setup and deliver offline fixtures |

The managing editor owns the change log. A request records reason, affected requirements, count/page impact, verification impact, cost/schedule impact, and approving owner. Count-line changes, new formats, added privileges, new technical baselines, and scope beyond the three competencies are material changes. Correct factual errors immediately and propagate the correction through examples, indexes, cheat card, and digital files.

## 14. Release, maintenance, and open decisions

### 14.1 Release and errata

Record an edition identifier, technical cutoff date, tested versions, and download revision in the colophon. Keep the print edition's entry numbers stable in corrected digital builds. If an entry is withdrawn, preserve its index location with a correction notice; do not renumber the remaining 300 items in a silent update.

Provide a durable errata route and downloadable corrections. Archive original release files and publish correction dates. Notify readers of unsafe executable errors promptly through the publisher's chosen channels; the route and owner must be established before release. A future edition may change the catalog with an explicit old-to-new number map.

Deliver a final package that can be read and used offline. Hosting may improve convenience, but the permanent-reference claim rests on the publication itself.

### 14.2 Decisions needed for commissioning

These do not prevent completion of this PRD. The proposed editorial baseline above supplies working defaults; the commercial items remain owner decisions.

| Decision | Proposed baseline / unresolved choice | Decision owner and deadline |
| --- | --- | --- |
| Catalog meaning on cover | Retain supplied line with explicit scope note; adopt expanded syntax taxonomy | Product owner before count-line approval |
| Extent and format | 112 interior pages; print and accessible PDF; examples ZIP | Product owner before commissioning |
| Trim and binding | A4 proposed; binding subject to printer/sample proof | Production editor before design freeze |
| Contributor ownership | Named lead writer, technical reviewer, editor, designer, proofreader | Managing editor at kickoff |
| Test builds | Pinned Linux Bash 5.2.x/5.3.x and recorded Readline; second package ecosystem | Technical editor during feasibility |
| Commercial model | Price, quantity, channels, budget ceiling, and payment terms unspecified | Publisher/product owner before commitments |
| Rights and examples license | Original commissioned prose/code; explicit agreed reuse terms | Product owner before contracts/release |
| Correction hosting | Durable download/errata route and named maintenance owner | Publisher before release |
| Publication date | Set after feasibility and supplier scheduling | Managing editor/product owner |

### 14.3 Verification status of this PRD

Official GNU documentation was checked for the named 5.3/Readline changes and the central pipeline, redirection, and error-handling requirements. Local Git for Windows Bash **5.3.9(1)-release** was used to test persistent versus isolated substitution, temporary `REPLY` restoration and newline preservation, `compgen -V` array storage, numeric glob ordering, and the history-search setting. The ten-line script was tested with a spaced filename and missing-file failure.

Those checks validate the PRD's central specimens and requirements. They are not a substitute for the publication's pinned GNU/Linux 5.2/5.3 matrix, terminal demonstrations, full 301-entry manifest, reader trial, or production proofs. Those remain explicit commissioning and release gates.

**Recommended next production action:** build and review the 301-candidate manifest and representative sample pages together. That is the shortest way to establish whether the count, scope, and 112-page promise can all hold before commissioning the full manuscript.
