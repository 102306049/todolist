class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :content
      t.boolean :finishOrNot

      t.timestamps null: false
    end
  end
end
