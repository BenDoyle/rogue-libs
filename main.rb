require 'tty-prompt'
require 'sqlite3'

prompt = TTY::Prompt.new


answer = prompt.yes?('Do you like Ruby?')
puts "you selected #{answer}!"


answer = prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
puts "you selected #{answer}!"


answer = prompt.keypress("Which one do you prefer a, b, c or d ?")
puts "you selected #{answer}!"
