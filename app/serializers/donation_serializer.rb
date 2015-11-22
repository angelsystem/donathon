class DonationSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :picture, :status
  belongs_to :user
  belongs_to :campaign
end
