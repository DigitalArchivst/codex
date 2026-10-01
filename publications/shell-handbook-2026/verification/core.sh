run() { printf '\n## %s\n' "$1"; "$B" --norc --noprofile -c "$2" 2>&1; printf '[status %s]\n' "$?"; }
cd "$(mktemp -d)" || exit 1
cat > line-count <<'S'
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
S
printf 'one\ntwo\n' > 'two lines.txt'; printf 'one\ntwo' > 'no final newline.txt'; printf 'x\n' > ./-leading.txt; printf 'a\nb\n' > "$(printf 'tab\there.txt')"; mkdir adir
for args in "'two lines.txt'" "'no final newline.txt'" "'-leading.txt'" "\"\$(printf 'tab\\there.txt')\"" "missing.txt" "adir" ""; do
  run "line-count $args" "exec \"$B\" ./line-count $args"
done
run "pipefail + head" 'set -o pipefail; yes | head -n 1 >/dev/null; echo "status=$? PIPESTATUS=${PIPESTATUS[*]}"'
run "local masks status" 'f() { local x=$(false); echo "after local: $?"; local y; y=$(false); echo "after split: $?"; }; f'
run "lastpipe non-interactive" 'shopt -s lastpipe; echo hi | read v; echo "v=$v"'
run "plain pipeline loses var" 'echo hi | read v; echo "v=${v:-<empty>}"'
run "errexit ignored in function called by if" 'set -e; f() { false; echo "kept going inside f"; }; if f; then echo "f succeeded"; fi'
