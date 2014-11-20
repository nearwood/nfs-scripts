nfs-scripts
===========

Small scripts for WordPress installs on NearlyFreeSpeech hosted sites.

Installation
====

`git clone` into your NFS site's home directory. A nfs-scripts directory will be created and the scripts will reside there.
`cd` into that directory and `chmod u+x *.sh` to run them without using the shell command.

Usage
===

`update.sh` Calls `backup.sh` to backup before pulling `latest.tar.gz` and extracting into `/home/public`. Removes leading folder from the tarball so that your wordpress is extracted into `public/`, not a subdirectory. Also runs `fix-grp.sh` to fix group of all files and folders.

`backup.sh` Copies all files and folders in `/home/public` into a bzipped tarball, saved to your home directory (usually `/home/private`).

`fix-grp.sh` Recursively fixes the group permissions of all files and folders in `/home/public` to match your host. Used after extracting the update.
