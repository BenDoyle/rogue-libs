class Node < ActiveRecord::Base
  has_many :from_edges, class_name: "Edge", foreign_key: "from_id"
  has_many :to_edges, class_name: "Edge", foreign_key: "to_id"
end

class Location < Node
  def movement_options
    from_edges
  end

  def add_adjacent_location(description=nil)
  	description ||= rand(1000)
		other = Location.create(content: description)
		Movement.create(
		  content: "Walk between #{self.content} and #{other.content}",
		  from_id: self.id,
		  to_id: other.id,
		)
		Movement.create(
		  content: "Walk between #{other.content} and #{self.content}",
		  from_id: other.id,
		  to_id: self.id,
		)
		other
  end

  def connect_to_location(other_location)
		Movement.create(
		  content: "Walk between #{self.content} and #{other_location.content}",
		  from_id: self.id,
		  to_id: other_location.id,
		)
		Movement.create(
		  content: "Walk between #{other_location.content} and #{self.content}",
		  from_id: other_location.id,
		  to_id: self.id,
		)
  end
end

class Character < Node

  def self.action_options
    Character.current_location.movement_options
  end

  def self.current_location
    Character.first.from_edges.order(:created_at).last.to_node
  end

  def self.act(action)
		Occupy.create(
		  content: "The location of The Player",
		  from_id: Character.first.id,
		  to_id: action.to_id,
		)
  end

end