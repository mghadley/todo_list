class TodoItemsController < ApplicationController
  def index
  	@todo_items =TodoItems.all
  end

  def show
  	@todo_item = TodoItem.find(params[:id])
  end

  def new
  	@todo_item = TodoItem.new
  end

  def create
  	@todo_item = TodoItem.new(safe_params)
  	if @todo_item.save
  		redirect_to todo_items_path
  	else
  		render :new
  	end
  end

  def edit
  	@todo_item = TodoItem.find(params[:id])
  end

  private

  def safe_params
  	params.require(:todo_item).permit(:title, :priority, :completed)
  end
end
