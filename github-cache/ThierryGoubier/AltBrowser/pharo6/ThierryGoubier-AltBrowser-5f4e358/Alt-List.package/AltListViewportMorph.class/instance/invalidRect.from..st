geometry
invalidRect: aRect from: aMorph
	"Intercept all invalidRects from submorphs while in a drawing session."

	self owner canvas ifNil: [ super invalidRect: aRect from: aMorph ]