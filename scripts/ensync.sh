#!/bin/sh

notedir="/Users/ralphrecto/Notes/"
echo "syncing notes in  $notedir ..."
gnsync -p $notedir -n localnotes -t TWO_WAY
echo "finished!"
