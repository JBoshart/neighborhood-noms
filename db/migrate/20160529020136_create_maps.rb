class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.integer :complete_nom_count
      t.integer :incomplete_nom_count
      t.integer :total_nom_count

      t.timestamps null: false
    end
  end
end
