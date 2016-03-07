class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :list_id
      t.string :name
      t.timestamps null: false
    end
  end
end
