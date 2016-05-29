class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.integer :value, null: false

      t.timestamps null: false
    end
  end
end
