# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
#      "Salt: 4")

require 'rails_helper'

RSpec.describe Ingredient do
  describe '#index' do
    it 'shows all the ingredients with their name and cost' do
      ingredient1 = Ingredient.create!(name: 'Ground Beef', cost: 2)
      ingredient2 = Ingredient.create!(name: 'Salt', cost: 4)

      visit '/ingredients'

      
    end
  end
end