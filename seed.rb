require File.join('.', 'environment.rb')

Player.destroy_all
Location.destroy_all
Occupy.destroy_all
Movement.destroy_all

a = Player.create(content: "The Player")
b = Location.create(content: "Antechamber")
Occupy.create(
  content: "The location of The Player",
  from_id: a.id,
  to_id: b.id,
)

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