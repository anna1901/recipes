class RecipePresenter
  def call(recipe)
    {
      id: recipe.id,
      name: recipe.name,
      ingredients: recipe.all_ingredients,
      instruction: recipe.instruction,
      image: recipe.image
    }
  end
end
