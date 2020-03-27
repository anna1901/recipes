class CreateIngredientRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_recipes do |t|
      t.belongs_to :recipe, null: false, foreign_key: true
      t.belongs_to :ingredient, null: false, foreign_key: true
      t.integer :amount
      t.string :measure

      t.timestamps
    end
  end
end
