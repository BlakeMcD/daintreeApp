class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.string :logo_url_square
      t.string :logo_url_landscape

      t.timestamps
    end
  end
end
