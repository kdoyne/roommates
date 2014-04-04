class AddTimeToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.time :time
    end
  end
end
