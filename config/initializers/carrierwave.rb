require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Rails.application.secrets.s3_access_key,
      aws_secret_access_key: Rails.application.secrets.s3_secret_key,
      host:                  's3-eu-central-1.amazonaws.com',
      region:                'eu-central-1'
    }

    config.fog_directory  = Rails.application.secrets.s3_bucket_name
  end
end
