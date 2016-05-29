class CreateNoms < ActiveRecord::Migration
  def change
    create_table :noms do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :url
      t.string :image_url
      t.integer :rating_value
      t.string :rating_img_url

      t.timestamps null: false
    end
  end
end
