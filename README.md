# rogue-libs
my roguelike / interactive fiction crossover!

Current thoughts:
- script with ruby
- work with sqlite as datastore
- use active_record for ORM
- use TTY to interact

Usage:
- `bundle install`
- `ruby setup.rb`
- `ruby seed.rb`
- `ruby main.rb`

To Do:
- remove seed, main should do the bootstrapping if needed
- give player the admin options to create and destroy the game worlds
- start with simplest world builder
- implement content as json blob, description is first attribute
- immutable events create, destroy insert and modify the game graph. support versions too. this hould make it easier to implement AI (tree searching)
- distinguish `percieved_choice` from `movement_option` edges, to support "secrets"
- implement "the enemy"
