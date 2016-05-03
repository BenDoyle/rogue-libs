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

class Player < Node

  def self.admin_options
    Admin.all
  end

  def self.action_options
    Player.current_location.movement_options
  end

  def self.current_location
    Player.first.from_edges[0].to_node
  end

  def self.act(action)
    from_edge = Player.first.from_edges.first
    from_edge.to_node = action.to_node
    from_edge.save
  end

end