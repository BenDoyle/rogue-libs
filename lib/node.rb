class Node < ActiveRecord::Base
	has_many :from_edges, class_name: "Edge", foreign_key: "from_id"
	has_many :to_edges, class_name: "Edge", foreign_key: "to_id"
end

class Location < Node
end