class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :blurb
      t.text :text
      t.integer :settings
      t.string :type
      t.datetime :published_at
      t.integer :review_score
      t.text :sidebar
      t.integer :original_id
      t.string :byline
      t.integer :comment_count

      t.timestamps
    end
  end
end
