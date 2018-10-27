class AddImagesToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :images, :json
  end
end
