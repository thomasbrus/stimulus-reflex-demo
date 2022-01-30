class TodosReflex < ApplicationReflex
  def toggle
    todo = GlobalID::Locator.locate_signed(element.dataset.sgid, only: [Todo])
    todo.completed = element.checked
    todo.save!
    morph todo, render(partial: 'todos/todo', locals: { todo: todo })
  end

  def save
    todo = GlobalID::Locator.locate_signed(element.dataset.sgid)
    todo.update(params.require(:todo).permit(:description))
    morph dom_id(todo, :saved_at), render(partial: 'shared/saved_at', locals: { model: todo })
  end
end
