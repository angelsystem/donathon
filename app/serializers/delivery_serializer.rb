class DeliverySerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :address, :district, :user_id, :donation_id, :transport_method_id, :status
  belongs_to :donation
  belongs_to :user
end
