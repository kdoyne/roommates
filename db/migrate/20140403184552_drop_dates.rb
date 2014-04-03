class DropDates < ActiveRecord::Migration
  def change
    drop_table :dates
  end
end
