#!/bin/bash
function unLock
{
sudo fuser -vki /var/lib/dpkg/lock
exit 0
}

unLock
