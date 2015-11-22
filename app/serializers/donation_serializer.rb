class DonationSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :picture, :status
  has_one :user
  has_one :campaign
end
