# Chef resources: https://docs.chef.io/resource_reference.html
# Community cookbooks: https://supermarket.chef.io/

### Install

apt_update 'update_package_list'
include_recipe 'build-essential'

# Download specific version (only if not already present)
fio_version = node['fio']['version']
fio_source_url = "http://brick.kernel.dk/snaps/fio-#{fio_version}.tar.gz"
remote_file "/opt/fio-#{fio_version}.tar.gz" do
  source fio_source_url
  action :create_if_missing
  notifies :run, "bash[install_fio]", :immediately
end

# Build specific version from source
bash "install_fio" do
 cwd '/opt'
 code "tar xzf fio-#{fio_version}.tar.gz && cd fio-#{fio_version} && ./configure && make && make install"
 action :nothing
end

### Configure

# Declare a CWB benchmark defined in under files/default/fio_yourname.rb
cwb_benchmark 'fio-joe4dev'

# Create the workload job configuration
fio = Cwb::BenchmarkUtil.new('fio-joe4dev', node)
cookbook_file fio.path_for('seq-write.fio') do
  cwb_defaults(self)
  source 'seq-write.fio'
end
