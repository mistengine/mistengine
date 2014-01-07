class AddIndicesToArticles < ActiveRecord::Migration
  def change
    add_index :articles, :published
    add_index :articles, :allow_comments
  end
end
