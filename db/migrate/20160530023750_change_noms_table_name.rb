class ChangeNomsTableName < ActiveRecord::Migration
  def change
    rename_table :noms, :restaurants
  end
end
