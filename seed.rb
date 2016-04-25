require File.join('.', 'environment.rb')

a = Location.create(content: "First Node")
b = Location.create(content: "Second Node")
c = Location.create(content: "Third Node")

d = Movement.create(
	content: "Walk between First Node and Second Node",
	from_id: a.id,
	to_id: b.id,
)

e = Movement.create(
	content: "Walk between Second Node and First Node",
	from_id: b.id,
	to_id: a.id,
)

f = Movement.create(
	content: "Walk between First Node and Third Node",
	from_id: a.id,
	to_id: c.id,
)

g = Movement.create(
	content: "Walk between Third Node and First Node",
	from_id: c.id,
	to_id: a.id,
)

h = Movement.create(
	content: "Walk between Second Node and Third Node",
	from_id: b.id,
	to_id: c.id,
)

i = Movement.create(
	content: "Walk between Third Node and Second Node",
	from_id: c.id,
	to_id: b.id,
)
