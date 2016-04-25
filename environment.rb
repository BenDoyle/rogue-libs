require 'active_record'

Dir.glob('./lib/*.rb').each do |file|
  require file
end

# tells AR what db file to use
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => './data.db'
)