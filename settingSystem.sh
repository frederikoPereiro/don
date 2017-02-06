#!/bin/bash
scriptFullPath=$(dirname "$0")  #detected full path into current folder

function helloIvo
{
echo "hello ivo, we can make settings..."
sleep 2
echo " - reboot wi-fi                       (1)"
echo " - clean the system                   (2)"
echo " - unlock dpkg                        (3)"
echo " - exit in main                       (0)"
echo -n "what are you want: "
read choiceVariable
# if [ "$myChoice" == "1" ]
# then
# $scriptFullPath/wpareboot.sh
# fi
# if [ "$myChoice" == "2" ]
# then
# $scriptFullPath/clean.sh
# fi
# if [ "$myChoice" == "3" ]
# then
# $scriptFullPath/unlock.sh
# fi
# if [ "$myChoice" == "0" ]
# then
# exit 0
# fi
case "$choiceVariable" in
"1" )
$scriptFullPath/wpareboot.sh
;;
"2" )
$scriptFullPath/clean.sh
echo "work"
;;
"3" )
$scriptFullPath/unlock.sh
;;
"0" )
$scriptFullPath/don.sh
;;
esac
}

helloIvo
