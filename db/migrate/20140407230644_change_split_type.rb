class ChangeSplitType < ActiveRecord::Migration
  def change
    change_table :bills do |t|
      t.remove :split
      t.decimal :split, :precision => 8, :scale => 2
    end
  end
end
