class CategoriesController < ApplicationController
  
  def index
    @category = Category.new
    @categories = Category.all
    @category_id = params[:id]
    @idea = Idea.new
    
  end
  

  def create_category
    if params[:category][:name]
      category = Category.new
      category.name = params[:category][:name]
      category.save
      redirect_to categories_path
    else
      render 'index'
    end
  end


  def show
    @category_id = params[:id]
    category = Category.find(params[:id])
    @ideas = category.ideas
    @idea = Idea.new
  end

  def create_idea
      if params[:idea][:body]
        idea = Idea.new
        idea.category_id = params[:category_id]
        idea.body = params[:idea][:body]
        idea.save
        redirect_to category_path(params[:category_id])
      else
        render 'show'
      end
  end
end
