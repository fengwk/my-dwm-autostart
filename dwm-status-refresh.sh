#!/bin/bash
# Screenshot: http://s.natalian.org/2013-08-17/dwm_status.png
# Network speed stuff stolen from http://linuxclues.blogspot.sg/2009/11/shell-script-show-network-speed.html

# This function parses /proc/net/dev file searching for a line containing $interface data.
# Within that line, the first and ninth numbers after ':' are respectively the received and transmited bytes.
function get_bytes {
  # Find active network interface
  interface=$(ip route get 8.8.8.8 2>/dev/null| awk '{print $5}')
  line=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
  eval $line
  now=$(date +%s%N)
}

# Get initial values
get_bytes
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now

# Function which calculates the speed using actual and old byte number.
# Speed is shown in KByte per second when greater or equal than 1 KByte per second.
# This function should be called each second.

function get_velocity {
  value=$1
  old_value=$2
  now=$3

  timediff=$(($now - $old_time))
  velKB=$(echo "1000000000*($value-$old_value)/1024/$timediff" | bc)
  if test "$velKB" -gt 1024
  then
    echo $(echo "scale=2; $velKB/1024" | bc)MB/s
  else
    echo ${velKB}KB/s
  fi
}

print_mem(){
  memTotal=$(grep -m1 'MemTotal:' /proc/meminfo | awk '{print $2}')
  memAvailable=$(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}')
  memUsed=$(expr $memTotal - $memAvailable)
  if [ "$memUsed" -le 1024 ]; then
    echo "$($memUsed)K";
  elif [ "$memUsed" -gt 1024 ] && [ "$memUsed" -le 1048576 ]; then
    echo "$(expr $memUsed / 1024)M"
  else
    awk -v mu=$memUsed 'BEGIN{printf "%.2fG", mu / 1024 / 1024 }'
    #echo "$(expr $memUsed / 1024 / 1024)G"
  fi
}

print_temp(){
  test -f /sys/class/thermal/thermal_zone0/temp || return 0
  echo $(head -c 2 /sys/class/thermal/thermal_zone0/temp)C
}

get_time_until_charged() {

  # parses acpitool's battery info for the remaining charge of all batteries and sums them up
  sum_remaining_charge=$(acpitool -B | grep -E 'Remaining capacity' | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc);

  # finds the rate at which the batteries being drained at
  present_rate=$(acpitool -B | grep -E 'Present rate' | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc);

  # divides current charge by the rate at which it's falling, then converts it into seconds for `date`
  seconds=$(bc <<< "scale = 10; ($sum_remaining_charge / $present_rate) * 3600");

  # prettifies the seconds into h:mm:ss format
  pretty_time=$(date -u -d @${seconds} +%T);

  echo $pretty_time;
}

get_battery_charging_status() {
  percent=$1

  if $(acpi -b | grep --quiet Charging)
  then
    if [ "$percent" -le 16 ]; then
      echo "";
    elif [ "$percent" -gt 16 ] && [ "$percent" -le 32 ]; then
      echo "";
    elif [ "$percent" -gt 32 ] && [ "$percent" -le 48 ]; then
      echo "";
    elif [ "$percent" -gt 48 ] && [ "$percent" -le 64 ]; then
      echo "";
    elif [ "$percent" -gt 64 ] && [ "$percent" -le 80 ]; then
      echo "";
    elif [ "$percent" -gt 80 ] && [ "$percent" -le 99 ]; then
      echo "";
    else
      echo "";
    fi
  else
    if [ "$percent" -le 33 ]; then
      echo "";
    elif [ "$percent" -gt 33 ] && [ "$percent" -le 66 ]; then
      echo "";
    elif [ "$percent" -gt 66 ] && [ "$percent" -le 99 ]; then
      echo "";
    else
      echo "";
    fi
  fi
}

print_vol () {
  ON=$(amixer get Master | tail -n1 | awk '{print $6}')
  VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
  if [ "$ON" = "[on]" ]; then
    if [ "$VOL" -eq 0 ]; then
      printf "婢 %s%%" "$VOL"
    else
      printf "墳 %s%%" "$VOL"
    fi
  else
    printf "婢 %s%%" "$VOL"
  fi
}

print_bat(){
  percent=$(expr $(acpi -b | grep -oE "[0-9]+%" | grep -oE "[0-9]+" | paste -sd+ | bc));
  echo "$(get_battery_charging_status $percent) $percent%";
}

print_date(){
  date '+%Y/%m/%d %H:%M'
}

show_record(){
  test -f /tmp/r2d2 || return
  rp=$(cat /tmp/r2d2 | awk '{print $2}')
  size=$(du -h $rp | awk '{print $1}')
  echo " $size $(basename $rp)"
}

get_light() {
  L=$(printf '%.0f' "$(xbacklight -get)")
  echo "ﯦ $L"
}

print_wifi(){
  echo "直 $(wpa_cli status | grep "^ssid" | awk -F '=' '{print $2}')"
}

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
export IDENTIFIER="unicode"

sleep 0.5
get_bytes

# Calculates speeds
vel_recv=$(get_velocity $received_bytes $old_received_bytes $now)
vel_trans=$(get_velocity $transmitted_bytes $old_transmitted_bytes $now)

xsetroot -name "  $(print_mem)  $vel_recv  $vel_trans $(get_light) $(print_vol) $(print_bat) $(print_wifi) [$(print_date)] "

# Update old values to perform new calculations
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now

exit 0
