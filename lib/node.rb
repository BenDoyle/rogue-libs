class Node < ActiveRecord::Base
  has_many :from_edges, class_name: "Edge", foreign_key: "from_id"
  has_many :to_edges, class_name: "Edge", foreign_key: "to_id"
end

class Location < Node
  def movement_options
    from_edges
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