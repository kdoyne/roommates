class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
