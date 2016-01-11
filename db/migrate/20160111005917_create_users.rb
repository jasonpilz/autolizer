class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :oauth_access_token
      t.string :uid
      t.integer :token_expires_at

      t.timestamps null: false
    end
  end
end
