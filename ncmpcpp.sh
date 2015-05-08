#!/bin/sh

udp_fifo() {
  # Start listening to UDP on port 5555 and create a FIFO queue out of it,
  # used for visualization. See https://github.com/mopidy/mopidy/issues/775
  mkfifo /tmp/mpd.fifo
  while :
  do
    nc -kluw 1 0.0.0.0 5555 >/tmp/mpd.fifo 2>/dev/null
    sleep 3
  done
}

udp_fifo &

# Start actual ncmpcpp
exec ncmpcpp $*
