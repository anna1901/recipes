namespace :recipes do
  desc 'Add ingredients to recipes already present in db'
  task add_ingredients: :environment do
    puts 'Start adding ingredients to recipes:'
    Recipe.all.each do |recipe|
      puts 'Added ingredients to' + recipe.name
      recipe.all_ingredients = '227g tub clotted cream, 25g butter, 1 tsp cornflour,100g parmesan, grated nutmeg, 250g fresh fettuccine or tagliatelle, snipped chives or chopped parsley to serve (optional)'
      puts recipe.all_ingredients
    end
  end
end
