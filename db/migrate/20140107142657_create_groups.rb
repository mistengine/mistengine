class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.text :description
      t.text :permissions
      t.boolean :active

      t.timestamps
    end
  end
end
