class AddRemindToEvents < ActiveRecord::Migration
  def change
      change_table :events do |t|
      t.boolean :remind
    end
  end
end
