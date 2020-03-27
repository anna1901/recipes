class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :instruction, presence: true

  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes

  def all_ingredients=(names)
    self.ingredients = names.split(",").map do |name|
        Ingredient.where(name: name.strip).first_or_create!
    end
  end

  def all_ingredients
    self.ingredients.map(&:name).join(", ")
  end
end
