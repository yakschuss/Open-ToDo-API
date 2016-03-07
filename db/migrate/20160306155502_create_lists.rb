class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :name
      t.string :permissions
      t.timestamps null: false
    end
  end
end
