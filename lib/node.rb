class Node < ActiveRecord::Base
  has_many :from_edges, class_name: "Edge", foreign_key: "from_id"
  has_many :to_edges, class_name: "Edge", foreign_key: "to_id"

  serialize :properties, JSON
end

class Location < Node
  def movement_options
    from_edges
  end

  def add_adjacent_location(description=nil)
  	description ||= rand(1000)
		other = Location.create(description: description)
		Movement.create(
		  description: "Walk between #{self.description} and #{other.description}",
		  from_id: self.id,
		  to_id: other.id,
		)
		Movement.create(
		  description: "Walk between #{other.description} and #{self.description}",
		  from_id: other.id,
		  to_id: self.id,
		)
		other
  end

  def connect_to_location(other_location)
		Movement.create(
		  description: "Walk between #{self.description} and #{other_location.description}",
		  from_id: self.id,
		  to_id: other_location.id,
		)
		Movement.create(
		  description: "Walk between #{other_location.description} and #{self.description}",
		  from_id: other_location.id,
		  to_id: self.id,
		)
  end
end

class Character < Node

  def action_options
    current_location.movement_options
  end

  def current_location
    from_edges.order(:created_at).last.to_node
  end

  def act(action)
		Occupy.create(
		  description: "The location of #{self.description}",
		  from_id: self.id,
		  to_id: action.to_id,
		)
  end

end