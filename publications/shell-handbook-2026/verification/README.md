<!-- markdownlint-disable MD013 -->

# Verification evidence for PRD v2.0

These scripts back the technical claims added or corrected in PRD v2.0. They are review evidence, not the handbook's production test suite.

## Environment

- Ubuntu 24.04.4 LTS container, x86_64, GNU coreutils 9.4, procps-ng 4.0.4.
- Bash 5.2.21(1)-release: the distribution's `/bin/bash`.
- Bash 5.3.20(1)-release: built from `bash-5.3.tar.gz` on ftp.gnu.org with official patches `bash53-001` through `bash53-020` applied (all patches published as of October 1, 2026). Default `configure` options, bundled Readline.
- Every case runs in a fresh `bash --norc --noprofile -c` child, so startup files do not affect results.
- Run date: October 1, 2026.

## Files

| Script | Results | What it checks |
| --- | --- | --- |
| `new53.sh` | `new53-results.txt` | Both new substitution forms, `exit`/`return`/`local`/positional parameters inside `${ ...; }`, `GLOBSORT`, `compgen -V`, `source -p` and `. -p`, `trap -P`, `BASH_MONOSECONDS`, `BASH_TRAPSIG`, six-digit `TIMEFORMAT`, version-guard parsing on 5.2, empty `PATH` |
| `core.sh` | `core-results.txt` | The ten-line `line-count` script (spaces, tab, leading hyphen, missing final newline, missing file, directory, missing argument), `pipefail` with `head`, `local` masking status, `lastpipe`, `errexit` inside a function called from `if` |
| `test-parsing.sh` | `test-parsing-results.txt` | A concrete 5.2/5.3 difference in `test` parsing, plus the recommended replacements |
| `smaller53.sh` | `smaller53-results.txt` | Smaller 5.3 changes: `printf %#q`, regex compile errors in `[[ =~ ]]`, start line for an unterminated `if`, new `shopt` names, `type -a -P`, new Readline command and variable names, the `fltexpr` loadable |

To rerun, set `B` to the Bash under test: `B=/path/to/bash bash new53.sh`. For `smaller53.sh`, optionally set `L` to the directory of loadable builtins.

## Not covered here

- Interactive behavior: `read -E`, Readline `search-ignore-case`, job-control notifications. These need a real terminal.
- A second package ecosystem, BusyBox, or macOS.
- Anything about the 301-entry manifest, layout, or reader trial.
- Link resolution for gnu.org manual pages: the container's connections to `www.gnu.org` were reset. Manual wording was checked against `doc/bashref.texi` in the 5.3 release tarball instead.
