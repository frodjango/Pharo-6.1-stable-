shortcuts
updateStackKeymap
	"Update the stack keymap."

	"Don't forget to update the tree."

	stackMorph ifNil: [ ^ self ].
	self stackMorph kmDispatcher
		reset;
		attachCategory: #MorphFocusNavigation;
		attachCategory: #MorphFocusCtrlNavigation.
	self buildStackShortcutsOn: self stackMorph kmDispatcher with: self