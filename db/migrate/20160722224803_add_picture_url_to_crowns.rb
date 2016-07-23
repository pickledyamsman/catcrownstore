class AddPictureUrlToCrowns < ActiveRecord::Migration
  def change
    add_column :crowns, :picture_url, :string
  end
end
