# frozen_string_literal: true

require 'aws-sdk-s3'

s3 = Aws::S3::Resource.new(
  region: ENV['AWS_REGION'],
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
)

$bucket = s3.bucket(ENV['AWS_S3_BUCKET_NAME'])
