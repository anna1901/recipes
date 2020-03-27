class Ingredient < ApplicationRecord
  has_many :ingredient_recipes, dependent: :destroy, inverse_of: :ingredient
  has_many :recipes, through: :ingredient_recipes
end
