class ChangeAmountOnBills < ActiveRecord::Migration
  def change
    change_table :bills do |t|
      t.remove :amount
      t.decimal :amount, :precision => 8, :scale => 2
    end
  end
end
