explotokanon
============

a puppet configuration to build a simple load cannon for on-the-go destruction of websites.

The purpose of Explotokanon is to provide users with a way to set up a quick loadtesting server, either as a local virtualmachine, or as a hosted node.  By default, explotokanon runs on centos, but there is no reason it couldn't be updated to run on a debian-based server.





You have two options for firing up explotokanon:

1. clone this onto a bare box
2. run the puppetize.sh script
3. add your ssh pub key to the /root/.ssh/authorized_keys
4. From your local machine, run ssh -c arcfour,blowfish-cbc -XC  root@targethost -p 2222 jmeter

OR

Use vagrant:

1. Update the SSH key in the puppet/module/users/manifests/install.pp with your own local key
2. vagrant up
3. ssh -c arcfour,blowfish-cbc -XC  root@localhost -p 2222 jmeter
 

