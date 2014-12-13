. script.config

echo "Fixing group..."
chgrp -R web $WPDIR/*
echo "Removing dolly plugin..."
rm $WPDIR/wp-content/plugins/hello.php
echo "Complete."
