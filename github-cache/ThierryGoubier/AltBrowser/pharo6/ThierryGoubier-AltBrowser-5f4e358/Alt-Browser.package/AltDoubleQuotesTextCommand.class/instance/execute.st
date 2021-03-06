execution
execute
	"Either add the character or put parenthesis around the selection. Remove the parenthesis around the selection if they exist."

	"What I need in fact are the character just before the selection and just after the selection."

	| interval text int aTextMorph beforeChar afterChar |
	interval := target trueSelectionInterval.
	aTextMorph := target textMorph.
	text := aTextMorph text.
	beforeChar := self
		textMorph: aTextMorph
		characterAt: interval first - 1.
	afterChar := self
		textMorph: aTextMorph
		characterAt: interval last + 1.
	aTextMorph
		handleEdit: [ interval size = 0
				ifTrue: [ ((afterChar isNil or: [ afterChar isSeparator ]) and: [ beforeChar ~= $$ ])
						ifTrue: [ | newPos |
							aTextMorph replaceSelectionWith: self emptyEnclosingString.
							newPos := interval first
								+ (self emptyEnclosingString size / 2) truncated.
							aTextMorph selectFrom: newPos to: newPos - 1 ]
						ifFalse: [ aTextMorph simulateKeyStroke: self openingChar ] ]
				ifFalse:
					[ int := (interval first - 1 max: 1) to: (interval last + 1 min: text size).
					(beforeChar = self openingChar
						and: [ afterChar = self closingChar ])
						ifTrue: [ aTextMorph selectFrom: int first to: int last.
							aTextMorph
								replaceSelectionWith:
									((text copyFrom: interval first to: interval last)
										copyReplaceAll: '""'
										with: '"') ]
						ifFalse: [ aTextMorph
								replaceSelectionWith:
									(String with: self openingChar)
										,
											((text copyFrom: interval first to: interval last)
												copyReplaceAll: '"'
												with: '""') , (String with: self closingChar) ] ] ].
	(aTextMorph respondsTo: #editView)
		ifTrue: [ aTextMorph editView
				selectionInterval: aTextMorph editor selectionInterval ]