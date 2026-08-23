#!/usr/bin/env sh

status=0
status_file=${TMPDIR:-/tmp}/skybin-sgit.$$
trap 'rm -f "$status_file"' EXIT HUP INT TERM
: > "$status_file" || exit 1

find . -type d -name .git -prune -exec sh -c '
	repo_dir=${1%/.git}
	status_file=$2
	shift 2
	if ! cd "$repo_dir"; then
		printf "%s\n" 1 >> "$status_file"
		exit 1
	fi
	remote=$(git remote get-url --push origin 2>/dev/null)
	if [ -n "$remote" ]; then
		printf "%s\n" "${remote##*/}"
	else
		printf "%s\n" "$(basename "$PWD")"
	fi
	git "$@"
	repo_status=$?
	printf "%s\n" "$repo_status" >> "$status_file"
	printf '%s\n\n' '-------'
	exit "$repo_status"
' sh {} "$status_file" "$@" \;
find_status=$?
[ "$find_status" -eq 0 ] || status=$find_status
while IFS= read -r repo_status; do
	[ "$repo_status" -eq 0 ] || status=$repo_status
done < "$status_file"

exit "$status"