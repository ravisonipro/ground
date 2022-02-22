class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :date
      t.string :start_time
      t.string :end_time
      t.integer :user_id
      t.integer :stadium_id

      t.timestamps
    end
  end
end
