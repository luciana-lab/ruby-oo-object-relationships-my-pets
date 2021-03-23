#used help frpom https://github.com/learn-co-students/oo-my-pets-online-web-sp-000/pull/171/files
require 'pry'
class Owner
  
  #Owner
    #Instance methods

  #cannot change owner's name
  #can't change its species
  attr_reader :name, :species

  @@all = []

  #can have a name
  #initializes with species set to human
  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  #can say its species
  def say_species
    "I am a #{species}."
  end

  #Class methods

  def save
    @@all << self
  end

  #.all returns all instances of Owner that have been created
  def self.all
    @@all
  end

  #.count returns the number of owners that have been created
  def self.count
    @@all.count
  end

  #.reset_all can reset the owners that have been created
  def self.reset_all
    @@all.clear
  end

  #Associations
    #Owner instance methods
  
    #returns a collection of all the cats that belong to the owner
    def cats
      Cat.all.select {|cats| cats.owner == self}
    end

    #returnsa a collection of all the dogs that belong to the owner
    def dogs
      Dog.all.select {|dogs| dogs.owner == self}
    end

    #can buy a cat that is an instance of the Cat class 
    #knows about its cats
    #Make a new instance of the appropriate pet, initializing it with that name and the owner who is purchasing it.
    def buy_cat(name)
      Cat.new(name, self)
    end

    #can buy a dog that is an instance of the Dog class 
    #knows about its dogs
    def buy_dog(name)
      Dog.new(name, self)
    end

    #walks the dogs which makes the dogs' moods happy
    #dogs (from dogs.each) is from the dogs methods on top of this class
    def walk_dogs
      dogs.each {|dog| dog.mood = "happy"}
    end

    #feeds cats which makes the cats' moods happy
    def feed_cats
      cats.each {|cat| cat.mood = "happy"}
    end

    #can sell all its pets, which makes them nervous
    #can sell all its pets, which leaves them without an owner
    def sell_pets
      pets = self.dogs + self.cats
      pets.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
    end

    #can list off its pets
    def list_pets
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    end

end