. script.config

theDate=`date "+%Y-%m-%d"`
fileName=$WPBACKUPDIR/backup-$theDate.tar.bz2
dbFileName=$WPBACKUPDIR/backup-$theDate.db

if [ -f $fileName ]
then
 echo "Backup file \"$fileName\" already exists. Skipping file backup.";
else
 echo "Backing up files..."
 tar -cjf $fileName $WPDIR
 if [ $? -eq 0 ]
 then
  chmod 600 $fileName
  echo "File backup complete."
 fi
fi

if [ -f $dbFileName ]
then
 echo "DB backup file \"$dbFileName\" already exists. Skipping DB backup.";
else
 #TODO straight to tar
 echo "Backing up DB..."
 wp --path=$WPDIR db export $dbFileName
 tar -cjf $dbFileName.tar.bz2 $dbFileName

 if [ $? -eq 0 ]
 then
  chmod 600 $dbFileName.tar.bz2
  rm $dbFileName
  echo "DB backup complete."
 else
  >&2 echo "DB backup failed."
 fi
fi
