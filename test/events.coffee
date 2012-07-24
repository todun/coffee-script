test "events", ->
	source = {}
	pass = false
	source := (e) -> pass = e
	source <- true
	ok pass

test "NamedFunctions", ->
	pass = false
	source = {}
	set = (e) -> pass = e
	source := set
	source <- true
	ok pass

test "Unbind", ->
	pass = 0
	source = {}
	set = (e) -> pass = e
	source := set
	source <- 1
	source :- set
	source <- 2
	equal pass, 1
