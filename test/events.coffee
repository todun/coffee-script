test "events", ->
	source = {}
	pass = false
	source := (e) -> pass = e
	source <- e
	ok pass