require 'tty-prompt'
require 'active_record'

Dir.glob('./lib/*.rb').each do |file|
  require file
end

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => './data.db'
)

unless ActiveRecord::Base.connection.table_exists?('nodes') && ActiveRecord::Base.connection.table_exists?('edges')
	load File.join('.', 'setup.rb')
	World.build_global
end