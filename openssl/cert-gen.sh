#!/bin/bash

if [ ! $1 ] || [ ! $2 ]; then
    echo "Please enter a domain, the cert file name and optionally an email";
    exit;
fi

# User parameters.
cn=$1;
cert=$2;
email=$3;

# CSR config.
country='FR';
state='Auvergne';
locality='Clermont-Ferrand';
organization='Periscope';
organizationalunit='Dev';
emailAddress='julien.pommier+ssl@periscopmail.com';

# If email is given then use it.
if [ $email ]; then
    emailAddress=$email;
fi

echo "Generating certificate ${cert}.crt for ${cn}";
openssl req -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/apache2/ssl/${cert}.key \
    -out /etc/apache2/ssl/${cert}.crt \
    -subj "/C=${country}/ST=${state}/L=${locality}/O=${organization}/OU=${organizationalunit}/CN=${cn}/emailAddress=${emailAddress}"

echo "Certificate ${cert}.crt has been generated."
