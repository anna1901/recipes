class IngredientRecipe < ApplicationRecord
  belongs_to :recipe, inverse_of: :ingredient_recipes
  belongs_to :ingredient, inverse_of: :ingredient_recipes
end
