require File.join('.', 'environment.rb')

class World

	def self.player
		@@player ||= Character.where(content: "The Player").first
	end

	def self.enemy
		@@enemy ||= Character.where(content: "The Enemy").first
	end

	def self.build
		# remove cruft from previous game
		Character.destroy_all
		Location.destroy_all
		Occupy.destroy_all
		Movement.destroy_all

		# create the world
		Location.create(content: "Antechamber")
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
		2.times do
			nodes = Location.order("random()").limit(2)
			nodes[0].connect_to_location(nodes[1])
		end

		# create the player and the enemy
		@@player = Character.create(content: "The Player")
		@@enemy = Character.create(content: "The Enemy")

		# place the player and enemy
		@@player.act(Movement.order('random()').first)
		@@enemy.act(Movement.order('random()').first)
	end
end