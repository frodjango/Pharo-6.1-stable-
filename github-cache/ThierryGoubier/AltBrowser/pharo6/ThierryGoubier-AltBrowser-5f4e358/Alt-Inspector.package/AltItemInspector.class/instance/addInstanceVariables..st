private
addInstanceVariables: elements
	"Add all the instance variables to the list of elements you can access in the inspector, set them so that you can modify and save them"

	self object class allInstVarNames
		do: [ :name | 
			elements
				add: (AltInstanceVariableEyeElement host: self object instVarName: name) ]