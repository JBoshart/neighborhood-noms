class ChangeRestaurantsBack < ActiveRecord::Migration
  def change
    rename_table :restaurants, :noms
  end
end
