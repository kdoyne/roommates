class AddPasscodeToHouse < ActiveRecord::Migration
  def change
      change_table :houses do |t|
      t.string :passcode
    end
  end
end
