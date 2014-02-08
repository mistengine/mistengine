class AddMinipicToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :minipic, :string
  end
end
