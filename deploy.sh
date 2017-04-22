#!/bin/bash

if [ "${TRAVIS_PULL_REQUEST}" = "1" ]; then
    echo "This is a pull request, nothing to deploy"
    exit
fi

sshpass -e sftp -oBatchMode=no -oStrictHostKeyChecking=no -b - mrlinux@frs.sourceforge.net << !
   cd /home/pfs/project/mrlinux/system/releases
   put out/*.iso new.iso
   rm old.iso
   rename current.iso old.iso
   rename new.iso current.iso
   bye
!
