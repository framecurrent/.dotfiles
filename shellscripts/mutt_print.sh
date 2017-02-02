#!/bin/sh

INPUT="$1" PDIR="$HOME/tmp/mutt_print"

# create temp dir if it does not exist
if [ ! -d "$PDIR" ]; then
    mkdir -p "$PDIR" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "Unable to make directory '$PDIR'" 1>&2
        exit 2
    fi
fi

tmpfile="`mktemp $PDIR/mutt_XXXXXXXX.pdf`"
iconv -f utf-8 -t iso-8859-1 $INPUT | enscript --font=Times-Roman12 --pretty-print --header-font=Times-Bold12 -o - 2>/dev/null | ps2pdf - $tmpfile
open $tmpfile >/dev/null 2>&1 &
sleep 1
rm $tmpfile
