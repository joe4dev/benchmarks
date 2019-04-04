# fio-joe4dev

Installs the `fio-joe4dev` benchmark and provides utilities to integrate with Cloud WorkBench.

## Attributes

See `attributes/default.rb`

## CWB Usage

Submits the metrics: `cpu_model_name`

### fio-joe4dev::default

Add the `fio-joe4dev` default recipe to your Chef configuration in the Vagrantfile:

```ruby
config.vm.provision 'cwb', type: 'chef_client' do |chef|
  chef.add_recipe 'fio-joe4dev'
  chef.json =
  {
    'fio' => {
      # FIO latest releases: http://git.kernel.dk/?p=fio.git;a=summary
      'version' => '3.13',
    },
  }
end
```

## Upload to Chef server

`berks install && berks upload --force`

## Test Locally

`cwb execute files/default/fio_joe4dev.rb`
