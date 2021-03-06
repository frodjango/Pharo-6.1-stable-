accessing
submorphsReorganize
	"Move the submorph handling code in its place?"

	| x y rowsToDisplay rowSubviews selectionIndex dropIndex |
	rowsToDisplay := self exposedItems keys asSortedCollection asArray.	"Do not rely on exposedItems ordering"
	rowSubviews := OrderedCollection new: rowsToDisplay size + 1.
	x := self left + 2 - self leftOffset.
	y := self top + topOffset.
	selectionIndex := self owner selectedRowIndex.
	dropIndex := self owner dropIndex.
	rowsToDisplay
		do:
			[ :rowIndex | 
			| row |
			row := self exposedItems at: rowIndex.
			row privateOwner: nil.
			row topLeft: x @ y.
			y := y + row height.
			selectionIndex = rowIndex
				ifTrue: [ row color: self owner selectionColor ]
				ifFalse: [ row color: Color transparent ].
			dropIndex = rowIndex
				ifTrue: [ row highlightForDrop: true ]
				ifFalse: [ row highlightForDrop: false ].
			row privateOwner: self.
			rowSubviews add: row ].
	submorphs := rowSubviews asArray