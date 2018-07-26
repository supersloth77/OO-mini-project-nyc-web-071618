
# Ingredient.all should return all of the ingredient instances
# Ingredient.most_common_allergen should return the ingredient
# instance that the highest number of users are allergic to

class Ingredient
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergen_array = Allergen.ingredients
    freq = allergen_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    allergen_array.max_by { |v| freq[v] }
  end

end
