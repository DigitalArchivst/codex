# Smaller user-visible Bash 5.3 changes. Set L to the directory holding
# loadable builtins for the Bash under test (optional).
run() { printf '\n## %s\n' "$1"; "$B" --norc --noprofile -c "$2" 2>&1; printf '[status %s]\n' "$?"; }
run 'printf alternate form %#q' 'printf "%q|%#q\n" "a b" "a b"'
run '[[ =~ ]] with an invalid regex' 're="("; [[ a =~ $re ]]'
run 'unterminated if reports its start line' $'if true; then\n  echo x\n'
run 'new shopt names' 'shopt array_expand_once bash_source_fullpath'
run 'type -a -P after hashing' 'hash ls; type -a -P ls'
printf '\n## Readline names (interactive shell)\n'
"$B" --norc --noprofile -i -c 'bind -l | grep -E "^(execute-named-command|export-completions)$"; bind -v | grep -E "search-ignore-case|force-meta-prefix"' 2>/dev/null
if [ -n "${L:-}" ] && [ -e "$L/fltexpr" ]; then
  run 'fltexpr loadable' "enable -f '$L/fltexpr' fltexpr && fltexpr -p '1.5 * 2'"
fi
