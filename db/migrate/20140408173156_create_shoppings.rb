class CreateShoppings < ActiveRecord::Migration
  def change
    create_table :shoppings do |t|
      t.references :house
      t.string :item
      t.boolean :purchased
      t.timestamps
    end
  end
end
