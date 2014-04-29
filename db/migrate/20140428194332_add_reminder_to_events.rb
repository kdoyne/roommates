class AddReminderToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.date :remind_on
    end
  end
end
