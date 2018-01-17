updating
aMCWorkingCopyDeleted: anEvent
	"If one of our children say yes, rebuilt ourselves! Property we use here: a MCWorkingCopy is unique in a package category. Remember that."

	"Note: we may answer true in two cases: one of our packages has been removed, and if we are to be removed."

	(self contents
		detect: [ :each | each aMCWorkingCopyDeleted: anEvent ]
		ifNone: [ nil ])
		ifNotNil: [ :node | 
			(node aMCWorkingCopyDeleted: anEvent)
				ifTrue: [ self removeRPackage: node packageName.
					AltBrowser aNodeToRebuilt: self ].
			^ true ].
	^ item value isEmpty
		and: [ (Smalltalk at: item key ifAbsent: [  ]) isNil ]