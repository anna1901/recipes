class Api::V1::RecipesController < ApplicationController
  def index
    recipes = Recipe.all.order(created_at: :desc)

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

  def destroy
    recipe&.destroy
    render json: { message: 'Recipe deleted!' }
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
