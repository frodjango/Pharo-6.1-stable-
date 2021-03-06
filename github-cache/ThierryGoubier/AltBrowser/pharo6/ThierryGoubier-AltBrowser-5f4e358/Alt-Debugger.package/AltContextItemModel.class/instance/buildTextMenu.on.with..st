commands
buildTextMenu: aMenu on: aTarget with: aRequestor
	"Ok. Two steps: first, create the menu linked with the node. second, parse the method and create menu items linked to the selected node."

	| ast node t |
	t := false.
	((self
		pragmas: #textAreaCommand
		from: self class
		to: AltTreeItemModel)
		sorted: [ :a :b | a methodSelector < b methodSelector ])
		do: [ :p | 
			t
				ifTrue: [ aMenu addLine ]
				ifFalse: [ t := true ].
			(((self perform: p methodSelector)
				collect: [ :c | c asClassInEnvironment: Smalltalk globals ifAbsent: [  ] ])
				reject: [ :c | c isNil ])
				do: [ :c | (c on: aTarget for: aRequestor) addItemToMenu: aMenu ] ].
	ast := item method ast.
	(node := ast bestNodeFor: aTarget selectionInterval) notNil
		ifFalse: [ ^ self ].
	aMenu
		addLine;
		addLine.
	node altTextCommands
		do: [ :c | 
			(c asClass on: aTarget for: aRequestor node: node)
				addItemToMenu: aMenu ].
	node canSelect
		ifFalse: [ ^ self ].
	aTarget textMorph paragraph secondarySelection: node textIntervals.
	aTarget textMorph selectionChanged