require File.join('.', 'environment.rb')

Prompt = TTY::Prompt.new

while true

  # describe game state
  puts
  puts "You are currently at #{World.player.current_location.description}"
  if World.player.current_location == World.enemy.current_location
    puts "You see #{World.enemy.description}!"
  end

  # provide options
  action_selection = Prompt.select("What next (^C to quit)?") do |menu|
    World.player.action_options.each do |option|
      menu.choice option.description, option
    end
    menu.choice "Rebuild World", :rebuild_world
  end

  if action_selection == :rebuild_world
    World.build_global
  else
    World.player.act(action_selection)
  end

end