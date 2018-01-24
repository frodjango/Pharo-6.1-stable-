*Francois-Package
suffix
	"assumes that I'm a file name, and answers my suffix, the part after the last dot"

	| dot dotPosition |
	dot := $..
	dotPosition := (self size to: 1 by: -1) detect: [ :i | (self at: i) = dot ].
	^ self copyFrom: dotPosition to: self size