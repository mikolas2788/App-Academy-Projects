require 'byebug'

class Dog
  def self.whos_louder(dog_1, dog_2)
    # debugger
    if dog_1.bark.length > dog_2.bark.length
      dog_1.name
    elsif dog_1.bark.length < dog_2.bark.length
      dog_2.name
    else
      nil
    end
  end

  # debugger

  def initialize(name, breed, age, bark, favorite_foods)
    # debugger
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
    # debugger
  end

  def name
    debugger
    @name
  end

  def breed
    debugger
    @breed
  end

  def bark
    if @age > 3
      return @bark.upcase
    else
      return @bark.downcase
    end
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age
  end

  def favorite_foods
    @favorite_foods
  end

  def favorite_food?(food_item)
    debugger
    @favorite_foods.map(&:downcase).include?(food_item.downcase)
  end
end

fluff = Dog.new("Fluff", "Pomeranian", 6, "Hail Satan", ["Kale", "Arugula", "Kyle's Face"])
bonzo = Dog.new("Bonzo", "Pug", 2, "Bork", ["Kibble"])

fluff.name
fluff.breed
fluff.favorite_food?('Kibble')

# Dog.whos_louder(fluff, bonzo)