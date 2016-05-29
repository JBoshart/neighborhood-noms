class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.string :name, null: false
      t.string :address
      t.string :street
      t.string :city
      t.string :state
      t.string :zip, null: false

      t.timestamps null: false
    end
  end
end
