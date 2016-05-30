class AddAndRemoveNomsColumns < ActiveRecord::Migration
  def change
    remove_column :noms, :state, :string
    add_column :noms, :neighborhood, :string, array: true
  end
end
