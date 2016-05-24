class StaticPagesController < ApplicationController
  def home
  	@completed = TodoItem.where(completed: true).count
  	@total = TodoItem.count
  end
end
