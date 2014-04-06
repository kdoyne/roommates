class EditReminders < ActiveRecord::Migration
  def change
    change_table :reminders do |t|
      t.remove :remind_at
      t.date :date
      t.time :time
    end
  end
end
