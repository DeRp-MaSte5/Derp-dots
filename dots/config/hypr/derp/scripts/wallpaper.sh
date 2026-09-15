#!/bin/sh
# Changes the wallpaper on two displays in sync, each pulling randomly
# chosen images from its own directory, at a set interval.

DEFAULT_INTERVAL=300 # In seconds

PAUSE_FILE="${XDG_RUNTIME_DIR:-/tmp}/wallpaper-paused"





if [ $# -lt 2 ] || [ ! -d "$1" ] || [ ! -d "$2" ]; then
	printf "Usage:\n\t\e[1m%s\e[0m \e[4mDIR1\e[0m \e[4mDIR2\e[0m [\e[4mINTERVAL\e[0m]\n" "$0"
	printf "\tDIR1 feeds the first display listed by 'awww query', DIR2 the second.\n"
	printf "\tBoth displays change together every INTERVAL seconds (default %d).\n" "$DEFAULT_INTERVAL"
	exit 1
fi

DIR1="$1"
DIR2="$2"
INTERVAL="${3:-$DEFAULT_INTERVAL}"
RESIZE_TYPE="fit"
export AWWW_TRANSITION_FPS="${AWWW_TRANSITION_FPS:-180}"
export AWWW_TRANSITION_STEP="${AWWW_TRANSITION_STEP:-2}"

tries=0
while [ "$tries" -lt 20 ]; do
	set -- $(awww query | awk '{print $2}' | sed 's/://')
	[ -n "$1" ] && [ -n "$2" ] && break
	tries=$((tries + 1))
	sleep 0.5
done
set -- $(awww query | awk '{print $2}' | sed 's/://')
DISPLAY1="$1"
DISPLAY2="$2"

if [ -z "$DISPLAY1" ] || [ -z "$DISPLAY2" ]; then
	echo "Need two connected displays (found: ${DISPLAY1:-none} ${DISPLAY2:-none})" >&2
	exit 1
fi

shuffle() {
	find "$1" -type f | while read -r img; do
		echo "$(</dev/urandom tr -dc a-zA-Z0-9 | head -c 8):$img"
	done | sort | cut -d':' -f2-
}

# Shuffle both directories into separate temp files rather than pipes, since
# we need to read one line from each per iteration, independently.
TMP1=$(mktemp)
TMP2=$(mktemp)
trap 'rm -f "$TMP1" "$TMP2"' EXIT

while true; do
	if [ -f "$PAUSE_FILE" ]; then
		sleep 2
		continue
	fi
	if [ ! -s "$TMP1" ]; then
		shuffle "$DIR1" > "$TMP1"
	fi
	if [ ! -s "$TMP2" ]; then
		shuffle "$DIR2" > "$TMP2"
	fi

	if [ ! -s "$TMP1" ] || [ ! -s "$TMP2" ]; then
		echo "One of the directories has no images, retrying in ${INTERVAL}s" >&2
		sleep "$INTERVAL"
		continue
	fi

	img1=$(head -n1 "$TMP1"); sed -i '1d' "$TMP1"
	img2=$(head -n1 "$TMP2"); sed -i '1d' "$TMP2"

	awww img --resize "$RESIZE_TYPE" --outputs "$DISPLAY1" --transition-type outer --transition-pos 0.854,0.977 --transition-step 90 "$img1" 
	awww img --resize "$RESIZE_TYPE" --outputs "$DISPLAY2" --transition-type outer --transition-pos 0.854,0.977 --transition-step 90 "$img2"

	sleep "$INTERVAL"
done
