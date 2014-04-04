class ReformatTimeFromEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :time
      t.string :time
    end
  end
end
