event handling
mouseWheel: anEvent
	"Register a motion, merge it with previous one if one exists."

	"Motion value change: adjust to number of elements in model?"

	model ifNil: [ ^ self ].
	self hasVerticalScrollBar
		ifFalse: [ ^ self ].
	self world
		ifNotNil:
			[ :w | 
			| t m d |
			d := self viewport exposedItems size / self viewport modelSize
				* 0.5.
			t := Time millisecondClockValue.
			m := AltTweenMotion new
				tween: AltTweenMotion easeInOutCubic;
				startTime: t;
				endTime: t + 100;
				startValue: self verticalScrollBar value;
				endValue:
					((self verticalScrollBar value
						+
							(anEvent isUp
								ifTrue: [ d negated ]
								ifFalse: [ d ]) min: 1.0) max: 0.0);
				action: [ :value | self verticalScrollBar setValue: value ].
			motion := motion ifNil: [ m ] ifNotNil: [ motion mergeWith: m ].
			(w isStepping: self selector: #motionStep:)
				ifFalse:
					[ self
						startStepping: #motionStep:
						at: t
						arguments: {anEvent copy resetHandlerFields}
						stepTime: self mouseStillDownStepRate ] ]