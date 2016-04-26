require 'tty-prompt'
require 'active_record'

Dir.glob('./lib/*.rb').each do |file|
  require file
end

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => './data.db'
)