#!/bin/bash
function showDatabase
{
sudo -u postgres psql << EOF
\l
\q
EOF
goToCreate
}

function createDatabase
{
timeZone="Asia/Novosibirsk"
echo -n "database name: "
read databaseName
echo -n "admin name:  "
read adminName
echo -n "password: "
read passwordBase
echo "input into postgres"
sudo -u postgres psql << EOF
CREATE DATABASE $databaseName;
CREATE USER $adminName WITH PASSWORD '$passwordBase';
ALTER ROLE $adminName SET client_encoding TO 'utf8';
ALTER ROLE $adminName SET default_transaction_isolation TO 'read committed';
ALTER ROLE $adminName SET timezone TO '$timeZone';
GRANT ALL PRIVILEGES ON DATABASE $databaseName TO $adminName;
\q
EOF
goToDon
exit 0
}

#set privileges with created user
function setPrivileges
{
echo "show user"
sleep 1
sudo -u postgres psql << EOF
\du
\l
EOF
echo -n "input name of database: "
read nameOfDataBase
echo -n "input name of user: "
read nameOfUser
sudo -u postgres psql << EOF
\du
GRANT ALL PRIVILEGES ON DATABASE $nameOfDataBase TO $nameOfUser;
\q
EOF
exit 0
}

function goToDon
{
pathToFile=$(dirname "$0")                #the path to the current dirrectory
sleep 3
$pathToFile/don.sh                        #to change path
}

function goToCreate
{
echo -n "can we get create database? "
echo "yes=1 no=2"
read choiceIvo
if [ "$choiceIvo" == 1 ]
then
createDatabase
else
helloIvo
fi
}

function helloIvo
{
echo "may be I can show you exist databases ..."
echo -n "yes=1 create base=2 set privileges=3 exit=0: "

echo "show db         (1)"
echo "create db       (2)"
echo "set privileges  (3)"
echo "exit            (0)"
echo -n "what are you need:"
read choiceIvo
if [ "$choiceIvo" == "1" ]
then
showDatabase
fi
if [ "$choiceIvo" == "2" ]
then
createDatabase
fi
if [ "$choiceIvo" == "0" ]
then
exit 0
fi
if [ "$choiceIvo" == "3" ]
then
setPrivileges
fi
}

helloIvo
