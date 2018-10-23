class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.belongs_to :user, index: true
      t.datetime :due_date
      t.integer :priority
      t.timestamps
    end
  end
end
