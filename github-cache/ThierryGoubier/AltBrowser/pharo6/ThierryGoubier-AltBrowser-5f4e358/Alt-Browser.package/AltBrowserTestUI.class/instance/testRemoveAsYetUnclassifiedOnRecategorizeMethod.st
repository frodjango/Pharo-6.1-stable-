tests
testRemoveAsYetUnclassifiedOnRecategorizeMethod
	"Test if not yet classified is correctly handled."

	| n |
	n := browser treeMorph allNodeMorphs
		detect: [ :aNodeMorph | 
			(aNodeMorph complexContents item isPackageNode)
				and: [ aNodeMorph complexContents item packageName = 'TestingUnderway' ] ]
		ifNone: [  ].
	self assert: n notNil.
	n expand.
	n := browser treeMorph allNodeMorphs
		detect: [ :aNodeMorph | aNodeMorph complexContents item isClassNode and: [ aNodeMorph complexContents item title = 'AltTestingClass' ] ]
		ifNone: [  ].
	self assert: n notNil.
	browser treeMorph listManager setSelectedMorph: n.
	browser treeMorph
		adjustSubmorphPositions;
		scrollSelectionIntoView.
	self assert: browser selectedItem == n complexContents.
	n expand.
	(Smalltalk at: #AltTestingClass) compile: 'test ^ true'.
	(Smalltalk at: #AltTestingClass) addCategory: #test before: nil.
	n := browser treeMorph allNodeMorphs
		detect: [ :aNodeMorph | 
			aNodeMorph complexContents item isMethodCategoryNode
				and: [ aNodeMorph complexContents item methodCategory = #'as yet unclassified' ] ]
		ifNone: [  ].
	self assert: n notNil.
	(Smalltalk at: #AltTestingClass) organization classify: #test under: #test suppressIfDefault: false.
	n := browser treeMorph allNodeMorphs
		detect: [ :aNodeMorph | 
			aNodeMorph complexContents item isMethodCategoryNode
				and: [ aNodeMorph complexContents item methodCategory = #'as yet unclassified' ] ]
		ifNone: [  ].
	self assert: n isNil