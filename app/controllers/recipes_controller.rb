class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @user_id = current_user ? current_user.id : nil
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = 'Recipe successfully created'
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @recipe_id = params[:id]
    @owner = current_user ? Recipe.find(@recipe_id).user_id == current_user.id : nil
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = 'Recipe updated successfully'
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    flash[:success] = 'Recipe deleted successfully'
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instruction, :all_ingredients)
  end

  def correct_user
    if current_user.try(:admin?)
      @recipe = Recipe.find_by(id: params[:id])
    else
      @recipe = current_user.recipes.find_by(id: params[:id])
      redirect_to recipes_path, alert: "You are not allowed to edit this recipe" if @recipe.nil?
    end
  end
end
