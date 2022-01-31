class TodosController < ApplicationController
  before_action :set_todo, only: %i[edit update destroy]

  before_action only: %i[index] do
    redirect_to todos_path(state: 'all') unless params.key?(:state)
  end

  # GET /todos or /todos.json
  def index
    @todos = Todo.preload(:todo_list)
    @sort_direction = params.fetch(:filters, {}).fetch(:sort_direction, 'asc')
    @todo_counts = { all: @todos.count, active: @todos.not_completed.count, completed: @todos.completed.count }

    @todos = @todos.order(description: @sort_direction)
    @todos = @todos.not_completed if params[:state] == 'active'
    @todos = @todos.completed if params[:state] == 'completed'
  end

  # GET /todos/new
  def new
    @todo = Todo.new
    @todo_lists = TodoList.order(:name)

    todo_list_id = params.fetch(:todo, {}).fetch(:todo_list_id, @todo.todo_list_id)
    @assignees = Assignee.order(:name).for_todo_list(@todo_lists.find_by(id: todo_list_id))
  end

  # GET /todos/1/edit
  def edit
    @todo_lists = TodoList.order(:name)

    todo_list_id = params.fetch(:todo, {}).fetch(:todo_list_id, @todo.todo_list_id)
    @assignees = Assignee.order(:name).for_todo_list(@todo_lists.find_by(id: todo_list_id))
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to todos_url, notice: 'Todo was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    if @todo.update(todo_params)
      redirect_to todos_url, notice: 'Todo was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = Todo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def todo_params
    params.require(:todo).permit(:description, :todo_list_id, :assignee_id)
  end
end
