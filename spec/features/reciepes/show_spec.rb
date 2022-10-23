# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.

# As a visitor,
# When I visit '/recipes/:id'
# I see the total cost of all of the ingredients in the recipe.
# (e.g. "Total Cost: 22")

require 'rails_helper'

RSpec.describe Recipe do
  describe '#show' do
    it 'shows the recipes name, complexity, and genre' do
      recipe1 = Recipe.create!(name: 'Stew', complexity: 1, genre: 'One Pot')
      recipe2 = Recipe.create!(name: 'Mac and Cheese', complexity: 2, genre: 'Boxed Food')
      ingredient1 = recipe1.ingredients.create!(name: 'Beef', cost: 4)
      ingredient2 = recipe1.ingredients.create!(name: 'Broth', cost: 2)
      ingredient3 = recipe2.ingredients.create!(name: 'Cheese', cost: 5)
      ingredient4 = recipe2.ingredients.create!(name: 'Noodles', cost: 1)

      visit "/recipes/#{recipe1.id}"

      expect(page).to have_content('Stew: 1, One Pot')

      visit "/recipes/#{recipe2.id}"

      expect(page).to have_content('Mac and Cheese: 2, Boxed Food')
    end

    it 'shows a list of the names of the ingredients for the recipe' do
      recipe1 = Recipe.create!(name: 'Stew', complexity: 1, genre: 'One Pot')
      recipe2 = Recipe.create!(name: 'Mac and Cheese', complexity: 2, genre: 'Boxed Food')
      ingredient1 = recipe1.ingredients.create!(name: 'Beef', cost: 4)
      ingredient2 = recipe1.ingredients.create!(name: 'Broth', cost: 2)
      ingredient3 = recipe2.ingredients.create!(name: 'Cheese', cost: 5)
      ingredient4 = recipe2.ingredients.create!(name: 'Noodles', cost: 1)

      visit "/recipes/#{recipe1.id}"

      expect(page).to have_content("Beef\nBroth")

      visit "/recipes/#{recipe2.id}"

      expect(page).to have_content("Cheese\nNoodles")
    end

    it 'shows the total cost of the ingredients for the recipe' do
      recipe1 = Recipe.create!(name: 'Stew', complexity: 1, genre: 'One Pot')
      recipe2 = Recipe.create!(name: 'Mac and Cheese', complexity: 2, genre: 'Boxed Food')
      ingredient1 = recipe1.ingredients.create!(name: 'Beef', cost: 4)
      ingredient2 = recipe1.ingredients.create!(name: 'Broth', cost: 2)
      ingredient3 = recipe2.ingredients.create!(name: 'Cheese', cost: 5)
      ingredient4 = recipe2.ingredients.create!(name: 'Noodles', cost: 2)

      visit "/recipes/#{recipe1.id}"

      expect(page).to have_content('Total Cost: 6')

      visit "/recipes/#{recipe2.id}"

      expect(page).to have_content('Total Cost: 7')
    end
  end
end