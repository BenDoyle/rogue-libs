require File.join('.', 'environment.rb')

class CreateEdges < ActiveRecord::Migration
  def change
    create_table(:edges) do |t|
    	t.column :from_id, :integer
    	t.column :to_id, :integer
      t.column :type, :string
      t.column :created_at, :datetime
      t.column :content, :text
    end
  end
end

class CreateNodes < ActiveRecord::Migration
  def change
    create_table(:nodes) do |t|
      t.column :type, :string
      t.column :created_at, :datetime
      t.column :content, :text
    end
  end
end

CreateEdges.migrate(:up)
CreateNodes.migrate(:up)
