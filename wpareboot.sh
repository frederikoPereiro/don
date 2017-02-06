#!/bin/bash
function rebootWPA
{
echo "reboot wirelness"
sleep 2
sudo service network-manager restart
exit 0
}

rebootWPA
