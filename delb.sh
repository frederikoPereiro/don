#!/bin/bash
function removeBD
{
echo "remove database ... "
sudo -u postgres psql << EOF
\l
EOF
while [ "$stopCommand" != "0" ]
do
echo "input name database:"
read databaseName
sudo -u postgres psql << EOF
DROP DATABASE $databaseName;
\q
EOF
echo -n "input 0 for stop (or other choice) or 1 for repeat: "
read stopCommand
done
choiceFunction
exit 0
}

function removeUser
{
echo "remove user ... "
sudo -u postgres psql << EOF
\du
EOF
while [ "$stopCommand" != "0" ]
do
echo "input user name:"
read userName
sudo -u postgres psql << EOF
DROP USER $userName;
\q
EOF
echo -n "input 0 for stop (or other choice) or 1 for repeat"
read stopCommand
done
choiceFunction
exit 0
}

function choiceFunction
{
stopCommand="1"
echo "choice remove database or user"
echo -n "database=1 or user=2 or exit=0: "
read choiceVariable
if [ "$choiceVariable" == "1" ]
then
removeBD
fi
if [ "$choiceVariable" == "2" ]
then
removeUser
fi
if [ "$choiceVariable" == "0" ]
then
exit 0
fi
}

echo "further we shall delete database or users:))))"
sleep 2
choiceFunction
