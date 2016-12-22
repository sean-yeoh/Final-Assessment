class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :category
      t.json :photos
      t.string :condition
      t.string :ad_title
      t.text :description
      t.decimal :price
      t.string :item_location
      t.string :item_area
      t.string :seller_type
      t.string :phone_number
      t.references :user, foreign_key: true, index: true
      t.timestamps null: false
    end
  end
end
