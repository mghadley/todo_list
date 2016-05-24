class TodoItemsController < ApplicationController
  def index
  	@todo_items = TodoItem.where(completed: false).order(priority: :desc)
  end

  def index_completed
  	@todo_items = TodoItem.where(completed: true).order(priority: :desc)
  end

  def show
  	@todo_item = TodoItem.find(params[:id])
  end

  def new
  	@todo_item = TodoItem.new
  end

  def create
  	@todo_item = TodoItem.new(safe_params)
  	@todo_item.priority = 0 if @todo_item.priority.nil?
  	if @todo_item.save
  		redirect_to todo_items_path
  	else
  		render :new
  	end
  end

  def edit
  	@todo_item = TodoItem.find(params[:id])
  end

  def update
  	@todo_item = TodoItem.find(params[:id])
  	@todo_item.completed_date = Time.now.asctime if @todo_item.completed = true
  	if @todo_item.update(safe_params)
  		redirect_to todo_items_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@todo_item = TodoItem.find(params[:id])
  	@todo_item.destroy
  	redirect_to todo_items_path
  end

  private

  def safe_params
  	params.require(:todo_item).permit(:name, :description, :priority, :completed)
  end
end
