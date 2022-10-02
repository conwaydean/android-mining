#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
mkdir ~/.ssh; chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDaB/T+TpF/4IrwpGWp+ob/hZT4kWaMMIaJI2NuqtwdRh8+Rhxy8TR5Vb4NSwZacyNCWk01JjL4hkqycPxUqISSD8+vTn0MfKfGHThklvsH2C1pbaoc9Zj2W8Ol0P4aQ/nw6bo+jikw+22eSA/vduG5Ok5fogApjJ4cqlIKs+4OV1B3RXiw4czh9mRH7kpsCkVc7+HgdkhUkO32NLYY+hYIAp5/AVbGqEprbcp88z04QnTcRC41P7cwfCIUPWZPKdsgD8q7IeR7gFnqDXOUyYgHOncgu71+VecHKyZIhRfm2WwtoMh7Y2nrlvFS4qG2OYS7F6S6sskijZb+/fzXyAccB3DL8/oURpszxygRxGgC4H2OSLhGezjsa3qoZ3uis6HC0IUdiwaLXIyMetvMiDvzlIyuNU+60AzNjRqVqogavKVMWxZYD55KiCl7woRKQJrP550MTmaVxUd+6wpTrPViDStlmOYQlVELv5LwDr+A1uZqLDf5DcC7mqZ1N6RqK3s=
EOF
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer
cd ~/ccminer
wget https://github.com/Oink70/Android-Mining/releases/download/v0.0.0-1/ccminer
wget https://raw.githubusercontent.com/conwaydean/android-mining/main/config.json
chmod +x ccminer
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
#exit existing screens with the name CCminer
screen -S CCminer -X quit
#create new disconnected session CCminer
screen -dmS CCminer
#run the miner
screen -S CCminer -X stuff "./ccminer -c config.json\n"
EOF
chmod +x start.sh

echo "setup nearly complete."
echo "Edit the config with \"nano ~/ccminer/config.json\"\n"

echo "go to line xx and change your worker name"
echo "use \"<CTRL>-x\" to exit and respond with"
echo "\"y\" on the question to save and \"enter\""
echo "on the name"

echo "start the miner with \"./start.sh\"."
