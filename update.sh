. script.config

if [ $WP ]
then
 echo "Using WP-CLI"
 echo "Backup..."
 ./backup.sh
 #returns new version available or "Success"?
 wp --path=$WPDIR core update
 #check-update
 #TODO Update if vers out of date
 wp --path=$WPDIR plugin update --all
 wp --path=$WPDIR theme update --all
 ./fixgrp.sh
 echo "${0} Complete."
else
 echo "No WP-CLI"
 exit 0;
 
 echo "Backing up..."
 ./backup.sh > /dev/null
 cd /home/public
 if [ -f latest.tar.gz ]
 then
  echo "File already exists."
 else
  echo "Downloading..."
  wget --no-check-certificate http://wordpress.org/latest.tar.gz > /dev/null
  echo "Extracting..."
  tar xf latest.tar.gz --strip-components 1
  #TODO check if successful
  echo "Cleanup..."
  rm latest.tar.gz
  rm wp-content/plugins/hello.php
  cd /home/private
  ./fixgrp.sh
  echo "${0} Complete.";
 fi
fi
