#!/bin/sh

# This file collects all ACPI tables in /sys/firmware/acpi/tables.

DIR=/sys/firmware/acpi/tables
DYNAMIC_DIR=/sys/firmware/acpi/tables/dynamic

mkdir acpi-tables
if [ $? != 0 ]; then
	exit 1
fi

for item in $(ls $DIR)
do
	if [ -f $DIR/$item ];then
		cat $DIR/$item > acpi-tables/$item.dat
	fi
done

for item in $(ls $DYNAMIC_DIR)
do
	cat $DYNAMIC_DIR/$item > acpi-tables/$item.dat
done

exit 0
