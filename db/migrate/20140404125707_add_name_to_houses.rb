class AddNameToHouses < ActiveRecord::Migration
  def change
    change_table :houses do |t|
      t.string :name
    end
  end
end
