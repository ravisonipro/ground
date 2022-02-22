class RemoveStadiumIdFromSlot < ActiveRecord::Migration[6.1]
  def change
    remove_column :slots, :stadium_id, :string
  end
end
