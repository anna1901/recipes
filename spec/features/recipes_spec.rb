require 'rails_helper'

describe 'user adds recipe' do
  before :each do
    user = FactoryBot.create(:user, admin: true)
    login_as(user)
    visit root_path
  end
  scenario 'add recipe with ingredients' do
    click_on 'Create New Recipe'
    expect(page).to have_current_path(new_recipe_path)
    fill_in('Name', with: 'Tagliatele')
    fill_in('All ingredients', with: 'Pasta, mushrooms, Cream')
    fill_in('Instruction', with: 'Cook pasta and mix it with the sauce from cream and mushrooms')
    click_on 'Create Recipe'
    expect(page).to have_content('Recipe successfully created')
  end
end
