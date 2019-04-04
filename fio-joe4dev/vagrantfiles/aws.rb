Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider :aws do |aws, override|
    aws.region = 'ap-south-1'
    # Official Ubuntu from Canonical: https://cloud-images.ubuntu.com/locator/ec2/
    # 18.04 LTS hvm:ebs-ssd amd64 ap-south-1
    aws.ami = 'ami-0a63d6cdb8b90bdae'
    # https://www.ec2instances.info/
    # Options: t3.nano, t2.nano, t3.micro, t2.micro, t3.small, t2.small
    aws.instance_type = 't3.nano'
  end

  config.vm.provision 'cwb', type: 'chef_client' do |chef|
    chef.add_recipe 'fio-joe4dev'
    chef.json =
    {
      'fio' => {
        # FIO latest releases: http://git.kernel.dk/?p=fio.git;a=summary
        'version' => '3.12'
      },
    }
  end
end
