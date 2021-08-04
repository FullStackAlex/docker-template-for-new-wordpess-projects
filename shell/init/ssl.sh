#!/usr/bin/env bash

#######
# SSL
#######
key=self-signed.key
csr=self-signed.csr
crt=self-signed.crt
commonname=domain.name
country=DE
state=Berlin
locality=Berlin
organization=tech-nomad.de
organizationalunit=IT
email=root@localhost
password=blub


source /root/setup/vars.sh

echo "Generating SSL key"

#Generate a key
openssl genrsa -des3 -passout pass:$password -out $key 2048

#Remove passphrase from the key. Comment the line out to keep the passphrase
echo "Removing passphrase from key"
openssl rsa -in $key -passin pass:$password -out $key

#Create the request
echo "Creating CSR"
openssl req -new -key $key -out $csr -passin pass:$password -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"

echo "---------------------------"
echo "-----Below is your CSR-----"
echo "---------------------------"
echo
cat $csr

echo
echo "---------------------------"
echo "-----Below is your Key-----"
echo "---------------------------"
echo
cat $key


echo "Generating certificate..."
openssl x509 -req -days 365 -in $csr -signkey $key -out $crt

echo "Copying certificate (self-signed-ssl.crt) to /etc/ssl/certs/"

mkdir -p  /etc/ssl/certs
mv $crt /etc/ssl/certs/
mv $csr /etc/ssl/certs/

echo "Copying key (self-signed-ssl.key) to /etc/ssl/private/"
mkdir -p  /etc/ssl/private
mv $key /etc/ssl/private/

# -dsaparam reduces time to create dhparam, while it's said there is no significant disadvantage using it
echo "Creating dhparam.pem"
openssl dhparam -dsaparam -out dhparam.pem 2048
mv dhparam.pem /etc/ssl/certs