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
end
