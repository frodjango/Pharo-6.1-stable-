execution
execute
	| aSelector anEnvironment classDict |
	aSelector := requestor selectedNode item selector.
	anEnvironment := requestor rbEnvironment isSelectorEnvironment
		ifTrue: [ requestor rbEnvironment environment ]
		ifFalse: [ requestor rbEnvironment ].
	classDict := IdentityDictionary new.
	anEnvironment
		classesAndMetaClassesDo:
			[ :class | 
			((class includesLocalSelector: aSelector)
				and: [ anEnvironment includesSelector: aSelector in: class ])
				ifTrue: [ classDict at: class put: {aSelector} ] ].
	(requestor class
		openOnEnvironment:
			((RBSelectorEnvironment onEnvironment: anEnvironment)
				on: classDict;
				label: 'Implementors of ' , aSelector;
				yourself)) expandAllNodes