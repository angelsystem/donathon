class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.string :status
      t.string :provider
      t.string :oauth_token

      t.timestamps null: false
    end
  end
end
