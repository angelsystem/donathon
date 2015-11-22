class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :district
      t.integer :user_id
      t.integer :donation_id
      t.integer :transport_method_id
      t.integer :status, default: 0
      t.timestamps null: false
    end
  end
end
