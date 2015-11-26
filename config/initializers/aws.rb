Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['key'], ENV['password']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['bucket_name'])
