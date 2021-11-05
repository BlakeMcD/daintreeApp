class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.string :sub_category
      t.integer :stock
      t.integer :price_cents
      t.string :description
      t.string :size
      t.string :gender
      t.string :img_url

      t.timestamps
    end
  end
end
