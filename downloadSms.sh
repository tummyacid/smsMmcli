#!/bin/bash
OUTPUT_DIR=".."

sudo mmcli -m 0 --messaging-list-sms | while read -r line ; do
        MSGID=$( echo $line | cut -d "/" -f 6- | cut -d " " -f 1)
	sudo mmcli -s $MSGID > $OUTPUT_DIR/$MSGID.txt
	sudo mmcli -s $MSGID --create-file-with-data=$OUTPUT_DIR/$MSGID.msg;
	sudo mmcli -s $MSGID --messaging-delete-sms=$MSGID
done

