drag and drop
dropItem: anItem
	"Simplify: as things are ordered, the only allowed move is drop inside another. Save changes to the categories."

	anItem parent removeRPackage: anItem item.
	AltBrowser aNodeToRebuilt: anItem parent.
	self addRPackage: anItem item.
	AltBrowser aNodeToRebuilt: self.
	AltBrowser updateCategories.
	^ anItem