class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :avatar, :status, :provider, :oauth_token
end
