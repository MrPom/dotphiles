#!/bin/bash

if [ ! $1 ] || [ ! $2 ]; then
    echo "Please enter a domain, the cert file name and optionally an email"
    exit
fi

# set up nice names for the incoming parameters to make the script more readable
cn=$1
cert_name=$2
email=$3

# if revision_from is not already set, get it from the .revision file if it exists
if [ ! $email ]; then
    email='julien.pommier+ssl@periscopmail.com'
fi

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/$cert.key -out /etc/apache2/ssl/$cert.crt -subj "/C=FR/ST=Auvergne/L=Clermont-Ferrand/O=Periscope/OU=Dev/CN=$domain/emailAddress=$email"
