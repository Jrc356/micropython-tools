# flash_board
This script makes clearing and uploading files to a micropython board a little easier. Instead of removing and uploading files over and over while testing, just run the script and it's taken care of for you.
## Installation
This script assumes you have ampy and rshell installed so install those if you don't.
## Usage
`flash_board <filename containing files to upload> --clear --repl`
this command removes all the files on the micropython board and then uploads all the files specified in the filename provided. Once finished, it enters a repl for that board.
## Compatability
This script relies on the mac micropython driver SLAB_USBtoUART so probably only mac compatible
