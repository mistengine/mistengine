class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.integer :article_id
      t.string :title
      t.string :url
      t.text :description
      t.boolean :active
      t.integer :weight

      t.timestamps
    end
    add_index :covers, :article_id
    add_index :covers, :active
  end
end
