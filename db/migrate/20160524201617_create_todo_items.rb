class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :name
      t.text :description
      t.boolean :completed
      t.integer :priority
      t.date :completed_date

      t.timestamps null: false
    end
  end
end
