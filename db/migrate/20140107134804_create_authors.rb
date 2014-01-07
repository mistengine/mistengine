class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
    add_index(:authors, :user_id)
    add_index(:authors, :article_id)
  end
end
