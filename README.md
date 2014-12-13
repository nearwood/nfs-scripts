nfs-scripts
===========
Small scripts for WordPress installs on NearlyFreeSpeech hosted sites. I was tired of not remembering which site has the most up to date versions of these so I added them here. This way updates are just a `git pull` away. Can use on other hosts too.

Dependancies
===
* Bash (others may work, untested) [Provided by NFS]
* WP-CLI (required by `backup.sh`) [Provided by NFS]

Installation
===
1. `git clone` into your NFS site's home directory. A nfs-scripts directory will be created and the scripts will reside there.
2. Edit `script.config` to set the following variables:
  1. `WPDIR` - WordPress installation directory
  2. `WPBACKUPDIR` - Desired backup directory
3. `chmod u+x *.sh` in the nfs-scripts directory to be able to run them without using the shell command.

Usage
===
* `update.sh` - Calls `backup.sh` to backup before pulling using WP-CLI to update core, themes, and plugins. Alternatively, if WP-CLI is not found it downloads `latest.tar.gz` and extracting into `WPDIR`. Also runs `fix-grp.sh` to fix group of all files and folders.

* `backup.sh` - Copies all files and folders in `WPDIR` into a bzipped tarball, saved to your `WPBACKUPDIR`. Backups your wordpress database using WP-CLI to `WPBACKUPDIR`.

* `fix-grp.sh`- Recursively fixes the group permissions of all files and folders in `WPDIR` to match your host. After extracting the WordPress update tarball, the group is set incorrectly. Also deletes the Dolly plugin. (Note: These may be unnecessary with WP-CLI and/or fixing the `tar -x` command.)
