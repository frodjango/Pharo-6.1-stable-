testing
testErroneousMetalinks
	"Demonstrate the need of #optionWeakAfter; without that option, we will get a compilation error trying to run the test, because of an incorrect way to add an #ensure: sequence for the #after MetaLink."

	| link node |
	node := nil.
	link := MetaLink new
		metaObject: [ :n | node := n ];
		selector: #value:;
		arguments: #(node);
		control: #after.
	self assert: #(2 3) = (JExampleArray new: 5) erroneous.
	[ (JExampleArray >> #erroneous) ast body statements first value
		arguments last arguments first statements last link: link.
	self should: [ (JExampleArray new: 5) erroneous ] raise: KeyNotFound ]
		ensure: [ link uninstall ]