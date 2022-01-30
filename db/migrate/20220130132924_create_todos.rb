class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.datetime :completed_at
      t.string :description

      t.timestamps
    end
  end
end
