class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :beneficiary
      t.text :description
      t.string :logo
      t.integer :status

      t.timestamps null: false
    end
  end
end
