class Ingredient < ApplicationRecord
  validates_presence_of :name
  has_many :ingredient_recipes, dependent: :destroy, inverse_of: :ingredient
  has_many :recipes, through: :ingredient_recipes
end
