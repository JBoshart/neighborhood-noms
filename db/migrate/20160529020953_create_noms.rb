class CreateNoms < ActiveRecord::Migration
  def change
    create_table :noms do |t|

      t.timestamps null: false
    end
  end
end
