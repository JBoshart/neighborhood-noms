class AddRestaurantIdToMaps < ActiveRecord::Migration
  def change
    add_column :restaurants, :map_id, :integer
  end
end
