testing
testNodeFinder
	"Test finding a node in the AST."

	| n m |
	m := JExampleArray >> #rleast:.
	n := JCodeNodeFinder find: 54 in: m.
	self
		assert:
			(n source copyFrom: n sourceInterval first to: n sourceInterval last)
				= 'ml + 1'