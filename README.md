# Itamae::Plugin::Resource::Aws

This is [Itamae](http://itamae.kitchen/) plugin for controlling AWS resources.

Currently supports creating EBS volmues only. But we will add more features.

## Installation

Add this line to your application's Gemfile:

    gem 'itamae-plugin-resource-aws'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-resource-aws

## Usage

```ruby
require 'itamae/plugin/resource/aws'

Aws.config[:region] = 'ap-northeast-1'

aws_ebs_volume 'db_ebs_volume' do
  action [:create, :attach] # :attach is not supported currently
  availability_zone 'ap-northeast-1b'
  device '/dev/xvdf'
  volume_type 'standard'
  size 10
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/itamae-plugin-resource-aws/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
