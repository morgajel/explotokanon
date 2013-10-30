#!/bin/bash

rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm

yum -y install puppet


puppet apply --hiera_config puppet/hiera.yaml --modulepath 'puppet/modules/' --manifestdir puppet/manifests --detailed-exitcodes puppet/manifests/base.pp
