require File.join('.', 'environment.rb')

Prompt = TTY::Prompt.new

while true

  # describe game state
  puts
  puts "You are currently at #{Player.current_location.content}"

  # provide options
  action_selection = Prompt.select("What next (^C to quit)?") do |menu|
    Player.action_options.each do |option|
      menu.choice option.content, option
    end
  end

  # update game state
  Player.act(action_selection)

end