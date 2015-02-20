. script.config

echo "Fixing group..."
chgrp -R web $WPDIR/*
echo "Removing dolly plugin..."
rm -f $WPDIR/wp-content/plugins/hello.php
echo "Fix wp-login permissions..."
chmod 644 $WPDIR/wp-login.php
echo "${0} Complete."
