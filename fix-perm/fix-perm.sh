#!/bin/bash -x

if [ ! $1 ] || [ ! $2 ]; then
    echo "Please enter a user & a path to fix."
    exit
fi

# Set up nice names for the incoming parameters to make the script more readable.
user=$1
path=$2

# Fix path permissions.

# Add www-data group to user.
usermod -aG www-data $user

# Set path ownership.
chown -R $user:www-data $path
chmod 2775 $path

# Update directories permissions.
find $path -type d -exec chmod 2775 {} +

# Update files permissions.
find $path -type f -exec chmod 0664 {} +

echo "Directory ${path} updated."
exit
