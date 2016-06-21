class Edge < ActiveRecord::Base
  belongs_to :from_node, class_name: "Node", foreign_key: "from_id"
  belongs_to :to_node, class_name: "Node", foreign_key: "to_id"

  serialize :properties, JSON
end

class Movement < Edge
end

class Occupy < Edge
end