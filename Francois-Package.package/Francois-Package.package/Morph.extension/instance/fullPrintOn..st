*Francois-Package
fullPrintOn: aStream
	"First we define the method fullPrintOn: on class Morph that just adds to the stream the name of the class followed by the string ' new' - the idea is that we could execute the resulting string and gets back an instance similar to the receiver."

	aStream nextPutAll: self class name , ' new'