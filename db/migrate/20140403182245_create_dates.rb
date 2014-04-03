class CreateDates < ActiveRecord::Migration
  def change
    create_table :dates do |t|
      t.string :title
      t.datetime :event
      t.references :user
      t.references :house
      t.timestamps
    end
  end
end
