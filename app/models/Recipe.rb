# Recipe.all should return all of the recipe instances
# Recipe.most_popular should return the recipe instance with the highest number of users
# (the recipe that has the most recipe cards)
# Recipe#users should return the user instances who have recipe cards with this recipe
# Recipe#ingredients should return all of the ingredients in this recipe
# Recipe#allergens should return all of the ingredients in this recipe that are allergens
# Recipe#add_ingredients should take an array of ingredient instances as an argument, and
# associate each of those ingredients with this recipe

class Recipe

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select do |cards|
      cards.recipe == self
    end
  end

  def users
    recipe_cards.map do |cards|
      cards.user
    end
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |ings|
      ings.recipe == self
    end
  end

  def ingredients
    recipe_ingredients.map do |recings|
      recings.ingredient
    end
  end

  def allergens
    ingredients.select do |ings|
      Allergen.is_allergen?(ings)
    end
  end

  def add_ingredients(ingredient)
    RecipeIngredient.new(ingredient, self)
  end

  def self.most_popular
    
  end


end
