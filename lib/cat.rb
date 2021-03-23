class Cat

  #Cat
    #Instance methods

  #can change its owner
  #can change its mood
  attr_accessor :owner, :mood

  #can't change its name
  attr_reader :name

  @@all = []

  #initializes with a name and an Owner
  #initializes with a nervous mood
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  #Class methods
    #knows all the cats
  def self.all
    @@all
  end

end