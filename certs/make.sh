echo "Making self-signing key"
openssl req \
    -newkey rsa:4096 -nodes -sha256 -keyout ca.key \
    -x509 -days 365 -out ca.crt < resp.txt

echo "stage 2"
echo "stage 2"
echo "stage 2"
echo "stage 2"
echo "stage 2"
openssl req \
    -newkey rsa:4096 -nodes -sha256 -keyout local.net.key \
    -out local.net.csr < resp.txt

echo "stage 3"
echo "stage 3"
echo "stage 3"
echo "stage 3"
echo "stage 3"
echo "stage 3"
echo "stage 3"
openssl x509 -req -days 365 -in local.net.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out local.net.crt


##sudo ./install.sh	

