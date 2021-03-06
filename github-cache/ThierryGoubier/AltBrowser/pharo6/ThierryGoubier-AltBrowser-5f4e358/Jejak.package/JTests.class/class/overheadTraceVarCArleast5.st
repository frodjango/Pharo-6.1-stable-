profiling
overheadTraceVarCArleast5
	"Tracing overhead on the array least5 search."

	"JTests overheadTraceVarCArleast5"

	<script>
	| var r |
	var := JExampleArray new: 31.
	r := Random new.
	1 to: var size do: [ :i | var at: i put: (r next * 15) rounded ].
	TimeProfiler onBlock: [ 10000 timesRepeat: [ var rleast: 5 ] ].
	JCollecteur recorder: JEmptyRecorder new.
	[ #(#rleast: #reorder: #least:array2:)
		do: [ :e | JCFGProbesWriter analyse: JExampleArray >> e ].
	TimeProfiler onBlock: [ 10000 timesRepeat: [ var rleast: 5 ] ] ]
		ensure: [ JProbesWriter uninstall ].
	JCollecteur recorder: JRecorder new