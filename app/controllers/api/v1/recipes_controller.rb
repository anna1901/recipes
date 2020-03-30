class Api::V1::RecipesController < ApplicationController
  def index
    if params[:user_id]
      recipes = User.find(params[:user_id]).recipes.order(created_at: :desc)
    else
      recipes = User.find(&:admin?).recipes.order(created_at: :desc)
    end

    data = recipes.map do |recipe|
      recipe_presenter.call(recipe)
    end
    render json: data
  end

  def create
    recipe = Recipe.create!(recipe_params)
    if recipe
      render json: recipe
    else
      render json: recipe.errors
    end
  end

  def show
    if recipe
      data = recipe_presenter.call(recipe)
      render json: data
    else
      render json: recipe.errors
    end
  end


  private

  def recipe_params
    params.permit(:name, :image, :instruction)
  end

  def recipe_presenter
    RecipePresenter.new
  end

  def recipe
    @recipe ||= Recipe.find(params[:id])
  end
end
