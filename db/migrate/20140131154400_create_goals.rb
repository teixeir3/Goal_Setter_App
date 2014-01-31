class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :body
      t.integer :author_id, null: false
      t.boolean :is_private, null: false, default: false
      t.boolean :is_completed, null: false, default: false

      t.timestamps
    end

    add_index :goals, :author_id
  end
end
