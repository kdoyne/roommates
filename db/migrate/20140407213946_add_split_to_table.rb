class AddSplitToTable < ActiveRecord::Migration
  def change
    change_table :bills do |t|
      t.integer :split, :precision => 8, :scale => 2
    end
  end
end
