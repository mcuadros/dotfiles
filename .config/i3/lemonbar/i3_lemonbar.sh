#! /bin/bash
#
# I3 bar with https://github.com/LemonBoy/bar

. $(dirname $0)/i3_lemonbar_config

if [ $(pgrep -cx $(basename $0)) -gt 1 ] ; then
    printf "%s\n" "The status bar is already running." >&2
    exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "${panel_fifo}" ] && rm "${panel_fifo}"
mkfifo "${panel_fifo}"

### EVENTS METERS

# Window title, "WIN"
xprop -spy -root _NET_ACTIVE_WINDOW | sed -un 's/.*\(0x.*\)/WIN\1/p' > "${panel_fifo}" &

# i3 Workspaces, "WSP"
# TODO : Restarting I3 breaks the IPC socket con. :(
$(dirname $0)/i3_workspaces.pl > "${panel_fifo}" &

# Conky, "SYS"
conky -c $(dirname $0)/i3_lemonbar_conky > "${panel_fifo}" &

### UPDATE INTERVAL METERS
cnt_vol=${upd_vol}
cnt_mail=${upd_mail}
cnt_sid=${upd_sid}
cnt_bat=${upd_bat}

while :; do
  # Volume, "VOL"
  if [ $((cnt_vol++)) -ge ${upd_vol} ]; then
    amixer get Master | grep "${snd_cha}" | awk -F'[]%[]' '/%/ {printf "VOL%d%%;%s\n", $2, $5}' > "${panel_fifo}" &
    cnt_vol=0
  fi

  # SSID, "SID"
  if [ $((cnt_sid++)) -ge ${upd_sid} ]; then
    echo "SID$(iwgetid -r)" > "${panel_fifo}" &
    cnt_sid=0
  fi

  # Battey, "BAT"
  if [ $((cnt_bat++)) -ge ${upd_bat} ]; then
    echo "$($(dirname $0)/batstat.sh)" > "${panel_fifo}" &
    cnt_bat=0
  fi

  # Finally, wait 1 second
  sleep 1s;

done &

#### LOOP FIFO

cat "${panel_fifo}" | $(dirname $0)/i3_lemonbar_parser.sh | \
  lemonbar -p -b \
    -f "${font}" -f "${iconfont}" \
    -g "${geometry}" \
    -B "${color_back}" -F "${color_fore}" &

wait