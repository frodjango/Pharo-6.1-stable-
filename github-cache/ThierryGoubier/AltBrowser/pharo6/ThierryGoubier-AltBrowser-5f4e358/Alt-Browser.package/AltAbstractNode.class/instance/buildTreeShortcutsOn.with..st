querying
buildTreeShortcutsOn: aMorph with: aRequestor
	"This is an attempt at handling shortcuts... Which works, with the help of a custom KMDispatcher."

	(self pragmas: #treeAreaCommand from: self class to: AltAbstractNode)
		do: [ :e | 
			(self perform: e methodSelector)
				do: [ :c | 
					| command |
					command := c asClass on: aRequestor treeMorph for: aRequestor.
					command isEnabled
						ifTrue: [ command buildShortcut: aMorph ] ] ]