class RemoveDatetimeAddDateToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :date_time
      t.date :date
    end
  end
end
