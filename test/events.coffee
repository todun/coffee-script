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

test "Events as new properties", ->
	pass = false
	source = {}
	source.event := (e) -> pass = e
	source.event <- true
	ok pass

test "Event Advisors", ->
	pass = false
	source = {}
	source.event =:= (e) -> pass = e
	source.event <- true
	ok pass

test "Advise failure", ->
	pass = true
	source = {}
	source.event := -> pass = false
	source.event =:= -> throw {}
	source.event <- {}
	ok pass

test "Advise updates event", ->
	pass = false
	source = {}
	source.event := (e) -> pass = e
	source.event =:= -> true
	source.event <- false
	ok pass