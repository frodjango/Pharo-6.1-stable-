instance creation
openOnEnvironment: aRBEnvironment
	" I am environment aware. Just open the environment."

	^ self new
		rbEnvironment: aRBEnvironment;
		open;
		yourself