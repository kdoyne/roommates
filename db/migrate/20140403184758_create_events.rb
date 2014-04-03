class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date_time
      t.references :user
      t.references :house
      t.timestamps
    end
  end
end
