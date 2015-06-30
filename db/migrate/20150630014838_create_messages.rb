class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :category_name

      t.timestamps null: false
    end

    add_index :messages, :user_id
  end
end
