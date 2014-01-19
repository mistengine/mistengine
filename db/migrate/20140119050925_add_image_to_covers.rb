class AddImageToCovers < ActiveRecord::Migration
  def change
    add_column :covers, :image, :string
  end
end
