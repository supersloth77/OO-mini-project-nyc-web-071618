# Build the following methods on the User class
#
# User.all should return all of the user instances
# User#recipes should return all of the recipes this user has recipe cards for
# User#add_recipe_card should accept a recipe instance as an argument, as well
# as a date and rating, and create a new recipe card for this user and the given recipe
# User#declare_allergen should accept an ingredient instance as an argument, and create
# a new allergen instance for this user and the given ingredient
# User#allergens should return all of the ingredients this user is allergic to
# User#top_three_recipes should return the top three highest rated recipes for this user.
# User#most_recent_recipe should return the recipe most recently added to the user's cookbook.

class User

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
      cards.user == self
    end
  end

  def recipes
    recipe_cards.map do |recs|
      recs.recipe
    end
  end

end
