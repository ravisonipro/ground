class CreateStadia < ActiveRecord::Migration[6.1]
  def change
    create_table :stadia do |t|
      t.string :s_name
      t.string :s_type
      t.text :info
      t.string :location

      t.timestamps
    end
  end
end
