class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.string :start_time
      t.string :end_time
      t.boolean :avail
      t.integer :stadium_id

      t.timestamps
    end
  end
end
