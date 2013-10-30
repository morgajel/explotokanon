explotokanon
============

a puppet configuration to build a simple load cannon for on-the-go destruction of websites.


Two options:

clone this onto a bare box and run the puppetize.sh script

OR

Use vagrant:
# Update the SSH key in the puppet/module/users/manifests/install.pp with your own local key
# vagrant up
# ssh -c arcfour,blowfish-cbc -XC  root@localhost -p 2222 jmeter
