require 'pry'
class Owner

  attr_reader :species
  attr_accessor :name, :pets

  @@all = []
  def initialize(species = 'human')
    @species = species
    @pets = {:cats=>[], :dogs=>[], :fishes=>[]}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.count
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    dog_array = self.pets[:dogs]
    dog_array.each do |dog|
      dog.mood = 'happy'
    end
  end

  def play_with_cats
    cat_array = self.pets[:cats]
    cat_array.each do |cat|
      cat.mood = 'happy'
    end
  end

  def feed_fish
    fishes = self.pets[:fishes]
    fishes.each do |fish|
      fish.mood = 'happy'
    end
  end

  def sell_pets
    pets = self.pets.values.flatten
    pets.each do |pet|
      pet.mood = 'nervous'
    end
    self.pets.clear
  end

  def list_pets
    dogs = self.pets[:dogs]
    cats = self.pets[:cats]
    fish = self.pets[:fishes]

    "I have #{fish.count} fish, #{dogs.count} dog(s), and #{cats.count} cat(s)."

  end
end
