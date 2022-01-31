class TodosReflex < ApplicationReflex
  def toggle
    todo = GlobalID::Locator.locate_signed(element.dataset.sgid, only: [Todo])
    todo.completed = element.checked
    todo.save!
    morph todo, render(partial: 'todos/todo', locals: { todo: todo })
  end

  def save
    todo = GlobalID::Locator.locate_signed(element.dataset.sgid, only: [Todo])
    todo.update(params.require(:todo).permit(:description, :todo_list_id, :assignee_id))
    morph dom_id(todo, :saved_at), render(partial: 'shared/saved_at', locals: { model: todo })
  end

  def apply_filter
    cable_ready.push_state(url: push_state_url)
  end

  private

  def push_state_url
    uri = URI.parse(url)
    uri.query = params.except(:controller, :action, :authenticity_token).to_unsafe_h.to_query
    uri.to_s
  end
end
