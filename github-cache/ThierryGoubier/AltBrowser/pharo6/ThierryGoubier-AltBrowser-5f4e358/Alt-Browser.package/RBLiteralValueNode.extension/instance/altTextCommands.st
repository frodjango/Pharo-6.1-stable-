*alt-browser
altTextCommands
	"Alt Browser commands enabled on this RB node."

	self value isSymbol
		ifTrue: [ ^ #(#AltImplementorsOfSymbolCommand #AltSendersOfSymbolCommand) ]
		ifFalse: [ ^ #() ]