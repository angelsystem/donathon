Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['AKIAJ6CMCD6IAIF5HF6Q'], ENV['q5Unp7ouz4ivqtrbV/65nxWSNb/yuaPFWOtmOahm']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['donathon-img'])
