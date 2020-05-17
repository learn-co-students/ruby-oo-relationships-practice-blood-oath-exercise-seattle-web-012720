require "date"

class Follower
  attr_reader :name
  attr_accessor :age, :life_motto
  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def oaths_sworn
    BloodOath.all.select { |oath| oath.follower == self }
  end

  def cults
    self.oaths_sworn.map { |oath| oath.cult }
  end

  def join_cult(cult)
    if self.age < cult.minimum_age
      puts "Dude, you are too young to be joining a cult!! Save yo'self! The minimum age for joining #{cult.name} is #{cult.minimum_age}."
    else
      BloodOath.new(self, cult)
    end
  end

  def self.of_a_certain_age(age)
    self.all.select { |follower| follower.age >= age }
  end

  def fellow_cult_members
    friends = []
    x = self.cults.map { |cult| cult.followers }
    x.flatten.each { |person|
      if person != self
        friends << person
      end
    }
    friends
  end
end
