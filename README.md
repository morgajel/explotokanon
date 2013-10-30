explotokanon
============

a puppet configuration to build a simple load cannon for on-the-go destruction of websites.


Two options:

1. clone this onto a bare box
2. run the puppetize.sh script
3. add your ssh pub key to the /root/.ssh/authorized_keys
4. From your local machine, run ssh -c arcfour,blowfish-cbc -XC  root@targethost -p 2222 jmeter

OR

Use vagrant:

1. Update the SSH key in the puppet/module/users/manifests/install.pp with your own local key
2. vagrant up
3. ssh -c arcfour,blowfish-cbc -XC  root@localhost -p 2222 jmeter
 

