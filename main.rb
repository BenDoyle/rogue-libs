require File.join('.', 'environment.rb')

prompt = TTY::Prompt.new

while true

  location = Player.current_location
  options = location.movement_options

  puts
  puts "You are currently at #{location.content}"
  answer = prompt.select("What next?", options.map{|e|e.content})

  Player.move_to(options.find{|e|e.content == answer}.to_node)

end