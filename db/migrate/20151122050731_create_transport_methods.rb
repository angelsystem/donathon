class CreateTransportMethods < ActiveRecord::Migration
  def change
    create_table :transport_methods do |t|
      t.string :name
      t.text :instruction
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
