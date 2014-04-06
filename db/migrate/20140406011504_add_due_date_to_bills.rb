class AddDueDateToBills < ActiveRecord::Migration
  def change
    change_table :bills do |t|
      t.date :due_date
    end
  end
end
