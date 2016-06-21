class World

	def self.player
		@@player ||= Character.where(content: "The Player").first
	end

	def self.enemy
		@@enemy ||= Character.where(content: "The Enemy").first
	end

	def self.room_names
		[
			"Antechamber",
			"Torture Chamber",
			"Puzzle Room",
			"Throne Room",
			"Strange Room",
			"Range Room",
			"Music Room",
			"Studio",
			"Labortitory",
			"Distillery",
		]
	end

	def self.clear_world
		# remove cruft from previous game
		Character.destroy_all
		Location.destroy_all
		Occupy.destroy_all
		Movement.destroy_all
	end

	def self.populate_world
		# create the player and the enemy
		@@player = Character.create(content: "The Player")
		@@enemy = Character.create(content: "The Enemy")

		# place the player and enemy
		@@player.act(Movement.order('random()').first)
		@@enemy.act(Movement.order('random()').first)
	end

	def self.build_global
		clear_world

		# create the world
		Location.create(content: room_names[0])
		room_names[1..-1].each do |description|
			Location.order("random()").first.add_adjacent_location(description)
		end
		2.times do
			nodes = Location.order("random()").limit(2)
			nodes[0].connect_to_location(nodes[1])
		end

		populate_world
	end

	def self.extend_room(room, room_descriptions)
		room_descriptions.sort_by!{rand}
		extension_descriptions = room_descriptions.shift(rand(1..2))
		extension_descriptions.each do |extension_description|
			extension_room = room.add_adjacent_location(extension_description)
			unless room_descriptions.empty?
				room_descriptions = extend_room(extension_room, room_descriptions)
			end
		end
		room_descriptions
	end

	def self.build_local
		clear_world

		# create the world
		room_descriptions = World.room_names
		room = Location.create(content: room_descriptions.shift)
		extend_room(room, room_descriptions)

		populate_world
	end

end