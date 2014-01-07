class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :active
      t.text :blurb
      t.string :title

      t.timestamps
    end
  end
end
