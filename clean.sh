#!/bin/bash
function cleanSystem
{
echo "autoclean"
sudo apt-get autoclean
echo "clean"
sudo apt-get clean
echo "autoremove"
sudo apt-get autoremove
# echo "fix broken"
# sudo apt-get -f install
exit 0
}

cleanSystem
