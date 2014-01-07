class AddSettingFieldsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published, :boolean
    add_column :articles, :allow_comments, :boolean
  end
end
