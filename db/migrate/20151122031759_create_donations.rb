class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :campaign, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.string :picture
      t.integer :status

      t.timestamps null: false
    end
  end
end
