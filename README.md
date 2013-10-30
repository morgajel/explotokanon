explotokanon
============

a puppet configuration to build a simple load cannon for on-the-go destruction of websites.


Two options:

clone this onto a bare box and run the puppetize.sh script

OR

Use vagrant:
1) Update the SSH key in the puppet/module/users/manifests/install.pp with your own local key
2) vagrant up
3) ssh -c arcfour,blowfish-cbc -XC  root@localhost -p 2222 jmeter
