class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.references :event
      t.string :message
      t.datetime :remind_at
      t.references :user
      t.timestamps
    end
  end
end
