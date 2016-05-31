Tool choices:
- script with ruby
- work with sqlite as datastore
- use active_record for ORM
- use TTY to interact
- once its fun: port to Sinatra, deploy to Heroku

Usage:
- `bundle install`
- `ruby main.rb`

To Do:
- [x] ~~model admin options as edges, and states as nodes~~
- [x] simple global world builder
- [x] ~~immutable events create, destroy insert and modify the game graph. support versions too. this hould make it easier to implement AI (tree searching)~~ log actual changes to the game graph (i can probably get away with logging just edges...)
- [x] implement "the enemy"
- [x] remove seed, give player the admin options to create and destroy the game world
- [ ] implement local / recursive world builder (currently have a global builder)
- [ ] reimplement content as json blob, description is its first attribute
- [ ] add `known_to_player`, `known_to_adversary` to `movement_option` edges and `location` nodes, to support varying access to and knowledge of the game world
- [ ] implement `visible` and `audible` as new location-location edges, `scent` as player/enemy-location edge
