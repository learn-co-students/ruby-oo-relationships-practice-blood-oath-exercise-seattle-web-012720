class Cult
  attr_reader :name
  attr_accessor :location, :founding, :slogan, :followers, :minimum_age
  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def self.all
    @@all
  end

  def followers
    x = BloodOath.all.select { |oath| oath.cult == self }
    x.map { |oath| oath.follower }
  end

  def recruit_follower(follower)
    if follower.age < self.minimum_age
      puts "You cannot recruit the helpless innocent! The minimum age for a member is #{self.minimum_age}. Leave him alone."
    else
      BloodOath.new(follower, self)
    end
  end

  def cult_population
    self.followers.length
  end

  def self.find_by_name(name)
    self.all.find { |cult| cult.name == name }
  end

  def self.find_by_location(location)
    self.all.find { |cult| cult.location == location }
  end

  def self.find_by_founding_year(year)
    self.all.select { |cult| cult.founding_year = year }
  end
end
