require "date"

class BloodOath
  attr_reader :initiation_date
  attr_accessor :cult, :follower
  @@all = []

  def initialize(follower, cult, initiation_date = Date.today)
    @initiation_date = initiation_date
    @follower = follower
    @cult = cult
    @@all << self
  end

  def self.all
    @@all
  end
end
