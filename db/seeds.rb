# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TodoList.create!(name: 'Todo list 1')
TodoList.create!(name: 'Todo list 2')

Assignee.create!(name: 'John')
Assignee.create!(name: 'Michael')
Assignee.create!(name: 'James')
Assignee.create!(name: 'Robert')
Assignee.create!(name: 'Sara')
Assignee.create!(name: 'Mary')
Assignee.create!(name: 'Patricia')
Assignee.create!(name: 'Jennifer')

Todo.create!(description: 'Todo 1', todo_list: TodoList.first, assignee: Assignee.first, completed: true)
Todo.create!(description: 'Todo 2', todo_list: TodoList.first)
Todo.create!(description: 'Todo 3')
Todo.create!(description: 'Todo 4')
