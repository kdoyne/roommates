class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.integer :amount
      t.references :user
      t.timestamps
    end
  end
end
