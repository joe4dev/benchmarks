# Chef resources: https://docs.chef.io/resource_reference.html
# Community cookbooks: https://supermarket.chef.io/

### Install

# apt_update
# package 'sysbench'

### Configure

# Declare a CWB benchmark defined in under files/default/fio_yourname.rb
cwb_benchmark 'fio-yourname'
