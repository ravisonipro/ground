class AddUserIdToStadium < ActiveRecord::Migration[6.1]
  def change
    add_column :stadia, :user_id, :integer
  end
end
