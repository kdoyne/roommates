class AddHouseToBills < ActiveRecord::Migration
  def change
    change_table :bills do |t|
      t.references :house
    end
  end
end
