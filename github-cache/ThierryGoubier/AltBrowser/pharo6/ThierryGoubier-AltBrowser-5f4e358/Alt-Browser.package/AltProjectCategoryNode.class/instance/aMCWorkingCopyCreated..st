updating
aMCWorkingCopyCreated: anEvent
	"Either match to itself or pass to its children."

	(anEvent workingCopy packageName beginsWith: self trimmedCategoryName)
		ifTrue: [ self
				addRPackage: anEvent workingCopy packageName asSymbol -> OrderedCollection new.
			AltBrowser aNodeToRebuilt: self.
			^ true ].
	^ self contents
		anySatisfy: [ :each | each aMCWorkingCopyCreated: anEvent ]