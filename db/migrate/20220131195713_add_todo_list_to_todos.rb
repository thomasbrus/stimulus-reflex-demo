class AddTodoListToTodos < ActiveRecord::Migration[7.0]
  def change
    add_reference :todos, :todo_list, null: true, foreign_key: true
  end
end
