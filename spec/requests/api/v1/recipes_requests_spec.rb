require 'rails_helper'

describe '/api/v1/recipes' do
  describe 'GET /index' do
    it 'repsonds with json containing all recipes' do
      recipe1 = FactoryBot.create(:recipe)
      recipe2 = FactoryBot.create(:recipe)
      expected_response = [recipe2, recipe1]
      get api_v1_recipes_index_path
      expect(response.body).to eq(expected_response.to_json)
    end
  end

  describe 'GET /show' do
    it 'repsonds with json containing all recipes' do
      recipe = FactoryBot.create(:recipe)
      expected_response = {
        id: recipe.id,
        name: recipe.name,
        ingredients: recipe.all_ingredients,
        instruction: recipe.instruction,
        image: recipe.image
      }.to_json
      get api_v1_path(id: recipe.id)
      expect(response.body).to eq(expected_response)
    end
  end
end
