require File.join('.', 'environment.rb')

# remove cruft from previous game
Character.destroy_all
Location.destroy_all
Occupy.destroy_all
Movement.destroy_all

# create the world
b = Location.create(content: "Antechamber")
[
	"Torture Chamber",
	"Puzzle Room",
	"Throne Room",
	"Strange Room",
	"Range Room",
	"Music Room",
	"Studio",
	"Labortitory",
	"Distillery",
].each do |description|
	Location.order("random()").first.add_adjacent_location(description)
end
4.times do
	nodes = Location.order("random()").limit(2)
	nodes[0].connect_to_location(nodes[1])
end

# drop the player ino the world
a = Character.create(content: "The Player")
Character.act(Movement.order("random()").first)