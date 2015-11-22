class Delivery < ActiveRecord::Base
  enum status: [ :scheduled, :delivered, :transit, :canceled ]
  belongs_to :donation
  belongs_to :user
end
