tests-overall
testOverallAClass
	"Use the type check overall on a class"

	| method checker |
	method := AltTypeCheckTests >> #compare:with:.
	self deny: method ast hasMetalink.
	[ checker := AltTypeCheck on: self class.
	self
		shouldnt: [ self compare: #($a $b) with: #(1 2) ]
		raise: AssertionFailure.
	self
		should: [ self compare: #(1 2) with: #($a $b) ]
		raise: AssertionFailure.
	self
		shouldnt: [ self compare3: #($a $b) with: 2 ]
		raise: AssertionFailure.
	self
		should: [ self compare3: #(1 2) with: #(1 2) ]
		raise: AssertionFailure ]
		ensure: [ checker unapply ].
	self deny: method ast hasMetalink.
	self assert: AltTypeCheck register isEmpty