# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.

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
    end
  end
end