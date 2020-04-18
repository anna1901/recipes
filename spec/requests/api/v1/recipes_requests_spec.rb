require 'rails_helper'

describe '/api/v1/recipes' do
  describe 'GET /index' do
    let(:admin) { FactoryBot.create(:user, admin: true) }

    it 'repsonds with json containing all recipes' do
      recipe1 = FactoryBot.create(:recipe, user: admin)
      recipe2 = FactoryBot.create(:recipe, user: admin)

      expected_response = [
        {
          id: recipe2.id,
          name: recipe2.name,
          ingredients: recipe2.all_ingredients,
          instruction: recipe2.instruction,
          image: recipe2.image
        },
        {
          id: recipe1.id,
          name: recipe1.name,
          ingredients: recipe1.all_ingredients,
          instruction: recipe1.instruction,
          image: recipe1.image
        }
      ]
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
