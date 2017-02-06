#!/bin/bash
echo "hello ivo!!!!!!"
sleep 2
scriptFullPath=$(dirname "$0")  #detected full path into current folder
# echo "$scriptFullPath"
echo "we can.."
echo " - to create a database               (1)"
echo " - to remove a database or user       (2)"
# echo " - to clean the system                (3)"
# echo " - to reboot wi-fi                    (4)"
# echo " - unlock dpkg                        (5)"
echo " - settings and debug                 (3)"
echo " - exit                               (0)"
echo -n "what are you want: "
read myChoice
case "$myChoice" in
"1" )
$scriptFullPath/db.sh
;;
"2" )
$scriptFullPath/delb.sh
;;
"3" )
$scriptFullPath/settingSystem.sh
;;
"0" )
exit 0
;;
esac

# if [ "$myChoice" == "1" ]
# then
# $scriptFullPath/db.sh
# fi
# if [ "$myChoice" == "2" ]
# then
# $scriptFullPath/delb.sh
# fi
# if [ "$myChoice" == "0" ]
# then
# exit 0
# fi
# # if [ "$myChoice" == "3" ]
# # then
# # $scriptFullPath/clean.sh
# # fi
# # if [ "$myChoice" == "4" ]
# # then
# # $scriptFullPath/wpareboot.sh
# # fi
# # if [ "$myChoice" == "5" ]
# # then
# # $scriptFullPath/unlock.sh
# # fi
# # if [ "$myChoice" == "5" ]
# # then
# # $scriptFullPath/unlock.sh
# # fi
# if [ "$myChoice" == "3" ]
# then
# $scriptFullPath/settingSystem.sh
# fi
