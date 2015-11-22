class TransportMethod < ActiveRecord::Base
  enum status: [ :active, :inactive ]
end
