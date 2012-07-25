test "Events", ->
	source = {}
	pass = false
	source := (e) -> pass = e
	source <- true
	ok pass

test "Named Functions", ->
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

test "Trigger with no handlers", ->
	source = {}
	source <- true
	ok true

test "Remove with no handlers", ->
	source = {}
	source :- (e) -> pass = e
	ok true