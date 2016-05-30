class MakeStreetNotNullInUsers < ActiveRecord::Migration
  def change
    change_column :users, :street, :string, null: false
  end
end
