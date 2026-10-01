# Bash 5.3 changed how `test` parses parenthesized subexpressions when given
# more than four arguments. Data that looks like an operator exposes it.
run() { printf '\n## %s\n' "$1"; "$B" --norc --noprofile -c "$2" 2>&1; printf '[status %s]\n' "$?"; }
run 'complex test, operator-like data' 'v="!"; test \( "$v" = y \) -a -n x'
run 'recommended form: [[ ]]' 'v="!"; [[ $v = y && -n x ]]'
run 'recommended form: separate tests' 'v="!"; [ "$v" = y ] && [ -n x ]'
