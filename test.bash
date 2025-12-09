#!/bin/bash 
# SPDX-FileCopyrightText: 2025 Naoki Otsubo
# SPDX-License-Identifier: BSD-3-Clause

set -euo pipefail

ng () {
  echo "NG at Line $1"
  res=1
}

res=0

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

cp "$(dirname "$0")/serch" "$workdir/"

mkdir -p "$workdir/data"
cat > "$workdir/data/players.csv" <<'CSV'
name,team,number
大谷翔平,ロサンゼルスドジャース,17
坂本勇人,読売ジャイアンツ,6
CSV

out="$(printf "大谷翔平\n" | (cd "$workdir" && python3 serch))"; status=$?
[ "$status" -eq 0 ] || ng ${LINENO}
[ "$out" = "大谷翔平,ロサンゼルスドジャース,17" ] || ng ${LINENO}


out="$(printf "坂本勇人\n大谷翔平\n" | (cd "$workdir" && python3 serch))"; status=$?
[ "$status" -eq 0 ] || ng ${LINENO}
expected=$'坂本勇人,読売ジャイアンツ,6\n大谷翔平,ロサンゼルスドジャース,17'
[ "$out" = "$expected" ] || ng ${LINENO}


out="$(printf "  大谷翔平  \n" | (cd "$workdir" && python3 serch))"; status=$?
[ "$status" -eq 0 ] || ng ${LINENO}
[ "$out" = "大谷翔平,ロサンゼルスドジャース,17" ] || ng ${LINENO}   


out="$(printf "ロサンゼルスドジャース,17\n" | (cd "$workdir" && python3 serch))"; status=$?
[ "$status" -eq 0 ] || ng ${LINENO}
[ "$out" = "大谷翔平,ロサンゼルスドジャース,17" ] || ng ${LINENO}


out="$(printf "ロサンゼルスドジャース,17\n読売ジャイアンツ,6\n" | (cd "$workdir" && python3 serch))"; status=$?
[ "$status" -eq 0 ] || ng ${LINENO}
expected=$'大谷翔平,ロサンゼルスドジャース,17\n坂本勇人,読売ジャイアンツ,6'
[ "$out" = "$expected" ] || ng ${LINENO}


set +e
out="$(printf "存在しない選手\n" | (cd "$workdir" && python3 serch))"; status=$?
set -e
[ "$status" -eq 1 ] || ng ${LINENO}
[ -z "$out" ] || ng ${LINENO}

set +e
out="$(printf "\n" | (cd "$workdir" && python3 serch))"; status=$?
set -e
[ "$status" -eq 1 ] || ng ${LINENO}
[ -z "$out" ] || ng ${LINENO}

set +e
out="$(printf "###\n" | (cd "$workdir" && python3 serch))"; status=$?
set -e
[ "$status" -ne 0 ] || ng ${LINENO}

[ "$res" -eq 0 ] && echo OK
exit "$res"

