# fio-yourname

Installs the `fio-yourname` benchmark and provides utilities to integrate with Cloud WorkBench.

## Attributes

See `attributes/default.rb`

## CWB Usage

Submits the metrics: `cpu_model_name`

### fio-yourname::default

Add the `fio-yourname` default recipe to your Chef configuration in the Vagrantfile:

```ruby
config.vm.provision 'cwb', type: 'chef_client' do |chef|
  chef.add_recipe 'fio-yourname@0.1.0'  # Version is optional
  chef.json =
  {
    'fio' => {
      # FIO latest releases: http://git.kernel.dk/?p=fio.git;a=summary
      'version' => '3.13',
    },
  }
end
```
