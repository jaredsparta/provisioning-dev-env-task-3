# updates the OS first
sudo apt-get update

# Imports the public key for MongoDB 4.4
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

# Creates the list file and updates it
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update

# Install MongoDB
sudo apt-get install -y mongodb-org

cd /folder1
sudo cp -f mongod-copy.conf /etc/mongod.conf

sudo systemctl enable mongod
sudo systemctl start mongod