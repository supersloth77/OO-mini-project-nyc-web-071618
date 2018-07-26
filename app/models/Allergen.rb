# An Allergen is a join between a user and an ingredient.
# This is a has-many-through relationship.
# What methods should an instance of this model respond to?
# Allergen.all should return all of the Allergen instances

class Allergen

  attr_reader :ingredient, :user
  @@all = []

  def initialize(user, ingredient)
    @ingredient = ingredient
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

  def self.ingredients
    all_ings_array = self.all.map do |alls|
      alls.ingredient
    end
    all_ings_array
  end

  def self.unique_ingredients
    self.ingredients.uniq
  end

  def self.is_allergen?(ingredient)
    unique_ingredients.include?(ingredient)
  end


end
