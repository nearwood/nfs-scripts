theDate=`date "+%Y-%m-%d"`
fileName=backup-$theDate.tar.bz2
if [ -f $fileName ]
then
echo "Backup file \"$fileName\" already exists. Exit.";
else
tar -cjvf ~/$fileName /home/public
echo "Backup complete."
fi

