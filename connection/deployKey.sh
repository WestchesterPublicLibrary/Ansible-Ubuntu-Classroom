#!/bin/bash
CURRENTDIR=$PWD
REMOTEUSER="it"
cd /tmp
rm -f hosts
# create hosts
echo Classroom01.classroom.library.wpl.lib.in.us >> hosts
echo Classroom02.classroom.library.wpl.lib.in.us >> hosts
echo Classroom03.classroom.library.wpl.lib.in.us >> hosts
echo Classroom04.classroom.library.wpl.lib.in.us >> hosts
echo Classroom05.classroom.library.wpl.lib.in.us >> hosts
echo Classroom06.classroom.library.wpl.lib.in.us >> hosts
echo Classroom07.classroom.library.wpl.lib.in.us >> hosts
echo Classroom08.classroom.library.wpl.lib.in.us >> hosts
echo Classroom09.classroom.library.wpl.lib.in.us >> hosts
echo Classroom10.classroom.library.wpl.lib.in.us >> hosts
echo Classroom11.classroom.library.wpl.lib.in.us >> hosts
echo Classroom12.classroom.library.wpl.lib.in.us >> hosts
echo Classroom13.classroom.library.wpl.lib.in.us >> hosts
echo Classroom14.classroom.library.wpl.lib.in.us >> hosts
echo Classroom15.classroom.library.wpl.lib.in.us >> hosts
echo Classroom16.classroom.library.wpl.lib.in.us >> hosts
echo Classroom17.classroom.library.wpl.lib.in.us >> hosts
echo Classroom18.classroom.library.wpl.lib.in.us >> hosts

echo $(cat hosts)

# grab IP addresses from hosts
for node in $(cat hosts); do
  nslookup $node | grep 'Address\:' | awk 'NR==2 {print $2}' >> hosts
  echo nslookup $node | grep 'Address\:' | awk 'NR==2 {print $2}'
done

# add ssh keys for both hostname and ip for each host
for node in $(cat hosts); do
  ssh-keyscan -H $node >> ~/.ssh/known_hosts
  #ssh-copy-id -i ~/.ssh/ansible.pub it@$node
done

# Cleanup known_hosts for duplicate entries
sort -u ~/.ssh/known_hosts > ~/.ssh/known_hosts.clean
mv ~/.ssh/known_hosts ~/.ssh/known_hosts.backup
cp ~/.ssh/known_hosts.clean ~/.ssh/known_hosts

# add ssh keys for both hostname and ip for each host
for node in $(cat hosts); do
  echo "Installing Key in $node"
  echo "running: $CURRENTDIR/automateSSH.sh $REMOTEUSER $node"
  $CURRENTDIR/automateSSH.sh $REMOTEUSER $node
done

# make sure destination exists and is writable for rundeck user... This was erroring out with permission denied for rundeck user.
#sudo mkdir /var/lib/rundeck/.ansible/
#sudo chown -R rundeck:rundeck /var/lib/rundeck/.ansible/
#cd /tmp/ansible
#ansible-playbook -i hosts ansible-test.yml --user rundeck
