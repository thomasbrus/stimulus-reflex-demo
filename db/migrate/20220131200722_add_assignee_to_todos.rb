class AddAssigneeToTodos < ActiveRecord::Migration[7.0]
  def change
    add_reference :todos, :assignee, foreign_key: true
  end
end
