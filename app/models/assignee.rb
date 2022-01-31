class Assignee < ApplicationRecord
  scope :for_todo_list,
        ->(todo_list) {
          return none if todo_list.nil?
          return where(name: %w[John Michael James Robert]) if todo_list.name == 'Todo list 1'
          return where(name: %w[Sara Mary Patricia Jeniffer]) if todo_list.name == 'Todo list 2'
          all
        }
end
