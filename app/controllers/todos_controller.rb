class TodosController < ApplicationController
  before_action :set_todo, only: %i[edit update destroy]

  before_action only: %i[index] do
    redirect_to todos_path(state: 'all') unless params.key?(:state)
  end

  # GET /todos or /todos.json
  def index
    @todos = Todo.all
    @todo_counts = { all: @todos.count, active: @todos.not_completed.count, completed: @todos.completed.count }
    @todos = @todos.not_completed if params[:state] == 'active'
    @todos = @todos.completed if params[:state] == 'completed'
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit; end

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
    params.require(:todo).permit(:description)
  end
end
