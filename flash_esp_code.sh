#!/bin/bash

sourcefiles=$1

if [ ! -f "${sourcefiles}"  ]
	then
		echo "Usage: flash_esp_code <filename containing files to upload>"
		exit 1
fi

# Remove all files
function clear {
	echo "Removing files..."
	ampy -p /dev/tty.SLAB_USBtoUART rmdir . &> /dev/null
	echo "Files removed."
}

# Upload files marked in arg file
function upload {
	while read -r file; do
	    echo "Uploading $file"
	    ampy -p /dev/tty.SLAB_USBtoUART put "$file" &> /dev/null || echo "Could not upload ${file}"
	done < "$sourcefiles"
}

# Ask user for repl
function enterRepl {
	echo "Entering repl on port /dev/tty.SLAB_USBtoUART"
	rshell -p /dev/tty.SLAB_USBtoUART repl

}

toClear=0
toEnterRepl=0
while [ -n "$2" ]; do
	case "$2" in
	--clear) toClear=1
			echo "clear set";;
	--repl) toEnterRepl=1
			echo "repl set";;
	*) echo "Option $2 not recognized";;
	esac
	shift
done

if [ $toClear = 1 ]
	then
		clear
fi

#upload

if [ $toEnterRepl = 1 ]
	then
		enterRepl
fi

