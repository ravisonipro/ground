class AddPictureToStadium < ActiveRecord::Migration[6.1]
  def change
    add_column :stadia, :picture, :string
  end
end
