FactoryBot.define do
  factory :recipe do
    sequence(:name) { |n| "Recipe #{n}"}
    instruction { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' }
    all_ingredients { 'Parceley, Pepper' }
  end
end
