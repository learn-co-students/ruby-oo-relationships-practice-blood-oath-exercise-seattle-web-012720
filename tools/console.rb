require_relative "../config/environment.rb"

def reload
  load "config/environment.rb"
end

sam = Follower.new("Sam", 20, "go")
bob = Follower.new("Bob", 28, "yes")
jo = Follower.new("Jo", 23, "die")
adam = Follower.new("Adam", 21, "peace")

x = Cult.new("Creep", "DC", 1888, "aksjdfhad")
y = Cult.new("Eros", "New York", 1730, "xxxxx")
z = Cult.new("Silva", "New YOrk", 1600, "bloody blood")

x.minimum_age = (21)
z.minimum_age = (26)

oath = BloodOath.new(sam, x)
oath2 = BloodOath.new(sam, y)
oath3 = BloodOath.new(sam, z)
oath4 = BloodOath.new(bob, x)
oath5 = BloodOath.new(jo, y)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
