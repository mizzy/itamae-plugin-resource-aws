require 'itamae'

module Itamae
  module Plugin
    module Resource
      class AwsEbsVolume < Itamae::Resource::Base
        define_attribute :action, default: :create
        define_attribute :name, type: String, default_name: true
        define_attribute :availability_zone, type: String
        define_attribute :device, type: String
        define_attribute :volume_type, type: String
        define_attribute :size, type: Integer

        def action_create(options)
          ec2 = ::Aws::EC2::Client.new
          volumes = ec2.describe_volumes(
            {
              filters: [
                {
                  name: 'tag:Name',
                  values: [ attributes.name ],
                },
              ],
            }
          ).volumes
                                           
          if volumes.empty?
            @volume = ec2.create_volume(
              size: attributes[:size], # attributes.size returns the size of attributes hash
              availability_zone: attributes.availability_zone,
              volume_type: attributes.volume_type,
            )

            ec2.create_tags(
              {
                resources: [ @volume.volume_id ],
                tags: [
                  {
                    key: 'Name',
                    value: attributes.name,
                  },
                ],
              }
            )

            updated!
          else
            @volume = volumes[0]
          end
          
        end

        def action_attach(options)
          # TODO
        end
      end
    end
  end
end

