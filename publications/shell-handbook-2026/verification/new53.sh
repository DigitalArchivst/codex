# Each case runs in a fresh child of the bash under test ($B).
run() { printf '\n## %s\n' "$1"; "$B" --norc --noprofile -c "$2" 2>&1; printf '[status %s]\n' "$?"; }
cd "$(mktemp -d)" || exit 1
run "central specimen" 'x=before; result=$(x=after; printf "value\n"); printf "ordinary: x=%s, result=%s\n" "$x" "$result"
x=before; result=${ x=after; printf "value\n"; }; printf "current: x=%s, result=%s\n" "$x" "$result"'
run "REPLY specimen" 'REPLY=outer; v=${| REPLY=$'"'"'line1\n'"'"'; echo "stdout message"; }; printf "v=%q REPLY=%s\n" "$v" "$REPLY"'
run "exit inside \${ }" 'x=${ exit 7; }; echo "not reached"'
run "return inside \${ }" 'x=${ printf a; return; printf b; }; echo "x=$x"'
run "local inside \${ }" 'X=orig; y=${ local X=12345; echo $X; }; echo "X=$X y=$y"'
run "positional params shared" 'set -- a b c; y=${ shift; echo "$1"; }; echo "count=$# y=$y"'
run "status of \${ }" 'y=${ false; }; echo "status=$?"'
run "GLOBSORT numeric" 'touch 1 2 10 b a; GLOBSORT=numeric; echo *; GLOBSORT=-numeric; echo *; GLOBSORT=; echo *'
run "GLOBSORT size" 'printf x > s1; printf xxx > s3; printf xx > s2; GLOBSORT=-size; echo s*'
run "compgen -V" 'compgen -V arr -W "alpha beta gamma" -- b; declare -p arr'
run "source -p" 'mkdir -p lib; printf "echo loaded-from-lib\n" > lib/helper.sh; source -p lib helper.sh; . -p lib helper.sh'
run "source -p no cwd fallback" 'printf "echo loaded-from-cwd\n" > here.sh; source here.sh; source -p /nonexistent here.sh'
run "trap -P" 'trap "echo hi" USR1; trap -P USR1'
run "BASH_MONOSECONDS / BASH_TRAPSIG" 'echo "mono=${BASH_MONOSECONDS:-<unset>}"; trap "echo trapsig=\$BASH_TRAPSIG" USR1; kill -USR1 $$'
run "TIMEFORMAT 6 digits" 'TIMEFORMAT="%6R"; time sleep 0.01'
run "version-guarded new syntax inside if" 'if (( BASH_VERSINFO[0] > 5 || (BASH_VERSINFO[0] == 5 && BASH_VERSINFO[1] >= 3) )); then r=${ echo new; }; else r=$(echo old); fi; echo "r=$r"'
run "guarded multiline new syntax" 'if false; then r=${
  echo new
}; fi; echo "survived parse"'
run "guarded new syntax with braces inside" 'if false; then r=${ printf "%s " {a,b}; }; fi; echo "survived parse"'
run "guarded pipe form inside function" 'f() { local r; r=${| REPLY=x; }; }; echo "defined f"'
run "empty PATH" 'printf "#!/bin/sh\necho ran-from-cwd\n" > hello; chmod +x hello; PATH= ; hello'
printf '%s\n' "if false; then r=\${ printf '%s ' {a,b}; }; fi" 'echo "survived parse"' > guard2.sh
printf '\n## guarded braces, as a script file\n'; "$B" --norc --noprofile guard2.sh 2>&1; printf '[status %s]\n' "$?"
