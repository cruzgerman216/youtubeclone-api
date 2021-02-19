class AddThumbnailToVideo < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :thumbnail, :string
  end
end
