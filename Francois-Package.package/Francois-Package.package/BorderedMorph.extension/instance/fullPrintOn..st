*Francois-Package
fullPrintOn: aStream
	aStream nextPutAll: '('.
	super fullPrintOn: aStream.
	aStream
		nextPutAll: ') setBorderWidth: ';
		print: borderWidth
		