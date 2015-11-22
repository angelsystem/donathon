class User < ActiveRecord::Base

  has_many :donations
  has_many :deliverys

  def self.authenticate_user_from_facebook(fb_access_token)
    graph = Koala::Facebook::API.new(fb_access_token)
    profile = graph.get_object('me')

     # Generate user hash
    uhash = Hash.new
    uhash[:provider] = 'facebook'
    uhash[:uid]      = profile['id']

    uhash[:info] = Hash.new
    uhash[:info][:name]       = profile['name']
    uhash[:info][:email]      = profile['email']
    uhash[:info][:gender]      = profile['gender']
    uhash[:info][:first_name] = profile['first_name']
    uhash[:info][:last_name]  = profile['last_name']
    uhash[:info][:verified]   = profile['verified']
    uhash[:info][:image]      = graph.get_picture(profile['id'], type: :normal)

    uhash[:info][:urls] = Hash.new
    uhash[:info][:urls]['Facebook'] = profile['link']

    uhash[:credentials] = Hash.new
    uhash[:credentials]['token'] = fb_access_token

    uhash[:extra] = Hash.new
    uhash[:extra]['raw_info'] = profile

    provider_and_uid = { provider: uhash[:provider], uid: uhash[:uid] }
    if user = User.find_by(email: uhash[:info][:email])
      user.update(provider_and_uid)
    else
      user = create_with_omniauth(uhash)
    end
    user
  end

  def self.create_with_omniauth(auth)
    new_user = User.new(
      provider: auth[:provider],
      uid: auth[:uid],
      first_name: auth[:info][:first_name],
      last_name: auth[:info][:last_name],
      email: auth[:info][:email],
      avatar: auth[:info][:image].sub('http', 'https')
    )
    new_user.activated = true
    new_user.save(validate: false)
    new_user
  end


end
