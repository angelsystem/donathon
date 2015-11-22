class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  has_one :delivery
end
