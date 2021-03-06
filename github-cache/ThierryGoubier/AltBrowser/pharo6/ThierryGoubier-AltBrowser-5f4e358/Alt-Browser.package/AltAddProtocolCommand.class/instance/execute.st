execution
execute
	"Reuse code from Browser>>addCategory"

	"Present a choice of categories or prompt for a new category name and add it before the current selection, or at the end if no current selection"

	"Usability comment : far too many choices in most cases to be user-friendly."

	| labels reject lines newName tClass sItem |
	requestor okToChange
		ifFalse: [ ^ self ].
	labels := OrderedCollection new.
	sItem := requestor selectedNode.
	tClass := sItem sourceClass.
	reject := Set new.
	reject
		addAll: tClass protocols;
		add: Protocol nullCategory.
	lines := OrderedCollection new.
	tClass allSuperclasses
		do: [ :cls | 
			| cats |
			cls = Object
				ifFalse: [ 
					cats := cls protocols reject: [ :cat | (reject includes: cat) or: [ cat beginsWith: '*' ] ].
					(cats isEmpty or: [ labels size > 10 ])
						ifFalse: [ 
							lines add: labels size.
							labels addAll: cats asSortedCollection.
							reject addAll: cats ] ] ].
	newName := UIManager default
		chooseOrRequestFrom: labels
		lines: lines
		title: 'Add Protocol'.
	newName ifNil: [ ^ self ].
	newName := newName asSymbol.
	tClass organization addCategory: newName.
	requestor
		selectPathForAbstractItem:
			(sItem parentNode findItem: (sItem parentNode item findMethodCategory: newName in: tClass)) item