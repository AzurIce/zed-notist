#!/bin/sh
set -eu

usage() {
    echo "Usage: sh scripts/sync-queries.sh TREE_SITTER_NOTIST_PATH [--check]" >&2
    exit 2
}

[ "$#" -ge 1 ] && [ "$#" -le 2 ] || usage
upstream=$(cd "$1" && pwd)
mode=${2:-sync}
case "$mode" in sync|--check) ;; *) usage ;; esac
root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

for language in notist notist-code; do
    case "$language" in
        notist) source="$upstream/queries" ;;
        notist-code) source="$upstream/notist-code/queries" ;;
    esac
    for query in highlights indents brackets folds outline; do
        from="$source/$query.scm"
        to="$root/languages/$language/$query.scm"
        if [ "$mode" = --check ]; then
            diff -u "$from" "$to"
        else
            cp "$from" "$to"
        fi
    done
done
