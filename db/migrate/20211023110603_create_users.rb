class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.boolean :admin
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.datetime :dob

      # OmniAuth
      t.string :name
      t.string :image
      t.string :uid

      t.timestamps
    end
  end
end
