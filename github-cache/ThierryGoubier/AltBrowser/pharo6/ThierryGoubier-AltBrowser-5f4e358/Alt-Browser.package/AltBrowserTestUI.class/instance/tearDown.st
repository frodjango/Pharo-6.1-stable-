resources
tearDown
	"Remove our testing class and category."

	browser close.
	browser release.
	(Smalltalk at: #AltTestingClass) removeFromSystem.
	(MCWorkingCopy forPackage: (MCPackage new name: 'TestingUnderway')) unload.
	Smalltalk globals organization removeCategory: 'TestingUnderway'