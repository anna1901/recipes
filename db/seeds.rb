user = User.create!(
  {
    email: 'admin@example.com',
    password: '123456',
    admin: true
  }
)

if user
  9.times do |i|
    recipe = user.recipes.build(
      name: "Recipe #{i + 1}",
      instruction: 'In a medium saucepan, stir the clotted cream, butter, and cornflour over a low-ish heat and bring to a low simmer. Turn off the heat and keep warm.'
    )
    recipe.all_ingredients= '227g tub clotted cream, 25g butter, 1 tsp cornflour,100g parmesan, grated nutmeg, 250g fresh fettuccine or tagliatelle, snipped chives or chopped parsley to serve (optional)'
    recipe.save!
  end
end
