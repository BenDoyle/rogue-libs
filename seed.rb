require File.join('.', 'environment.rb')

a = Location.create(content: "First Node")
b = Location.create(content: "Second Node")
c = Location.create(content: "Third Node")

d = Player.create(content: "The Player")
e = Admin.create(content: "Quit this silly game")

Movement.create(
  content: "Walk between First Node and Second Node",
  from_id: a.id,
  to_id: b.id,
)

Movement.create(
  content: "Walk between Second Node and First Node",
  from_id: b.id,
  to_id: a.id,
)

Movement.create(
  content: "Walk between First Node and Third Node",
  from_id: a.id,
  to_id: c.id,
)

Movement.create(
  content: "Walk between Third Node and First Node",
  from_id: c.id,
  to_id: a.id,
)

Movement.create(
  content: "Walk between Second Node and Third Node",
  from_id: b.id,
  to_id: c.id,
)

Movement.create(
  content: "Walk between Third Node and Second Node",
  from_id: c.id,
  to_id: b.id,
)

Occupy.create(
  content: "The location of The Player",
  from_id: d.id,
  to_id: a.id,
)
