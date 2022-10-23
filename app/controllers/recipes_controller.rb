class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @total_cost = 0
    @ingredients.each do |ingredient|
      @total_cost += ingredient.cost
    end
  end
end