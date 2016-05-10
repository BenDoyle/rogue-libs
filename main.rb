require File.join('.', 'environment.rb')

Prompt = TTY::Prompt.new

while true

  # describe game state
  puts
  puts "You are currently at #{Character.current_location.content}"

  # provide options
  action_selection = Prompt.select("What next (^C to quit)?") do |menu|
    Character.action_options.each do |option|
      menu.choice option.content, option
    end
  end

  # update game state
  Character.act(action_selection)

end