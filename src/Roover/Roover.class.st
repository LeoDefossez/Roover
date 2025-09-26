Class {
	#name : 'Roover',
	#superclass : 'Object',
	#instVars : [
		'position',
		'direction',
		'gridSize',
		'history'
	],
	#category : 'Roover-roover',
	#package : 'Roover',
	#tag : 'roover'
}

{ #category : 'as yet unclassified' }
Roover >> area [

	^ self origin rectangle: self gridSize
]

{ #category : 'accessing' }
Roover >> direction [
	^ direction
]

{ #category : 'accessing' }
Roover >> direction: aDirection [ 
	direction := aDirection 
]

{ #category : 'accessing' }
Roover >> gridSize [
	^ gridSize
]

{ #category : 'accessing' }
Roover >> gridSize: aPoint [ 
	gridSize := aPoint
]

{ #category : 'accessing' }
Roover >> history [
	^ history
]

{ #category : 'accessing' }
Roover >> history: aCollection [ 
	history := aCollection
]

{ #category : 'initialization' }
Roover >> initialize [

	super initialize.
	direction := North.
	position := self origin.
	gridSize := 5 @ 5.
	history := OrderedCollection new.
]

{ #category : 'accessing' }
Roover >> interpretDirection: aString [

	| choice |
	choice := Dictionary new
		          at: $R put: [ self turnRight ];
		          at: $L put: [ self turnLeft ];
		          at: $M put: [ self move ];
					at: $B put: [self moveBack];
		          yourself.

	aString do: [ :car | choice at: car ifPresent: #value ]
]

{ #category : 'accessing' }
Roover >> interpretFullCommand: aString [

	| temp |
	temp := aString splitOn: Character cr.

	self interpretGridSize: temp first.

	self interpretInitialPosition: temp second.
	self interpretDirection: temp third.
	temp size = 4 ifTrue: [ ^self interpretHistory: temp fourth ].
]

{ #category : 'accessing' }
Roover >> interpretGridSize: aString [

	| grid |
	grid := aString splitOn: Character space.
	grid := grid collect: [ :string | string asInteger ] thenReject:[:val | val isNil].
	grid size = 2 ifFalse:[Error signal:'Wrong interpretation in grid size check the roover"s commands']. 
	self gridSize: grid first @ grid second
]

{ #category : 'accessing' }
Roover >> interpretHistory: aString [ 
	aString do:[:letter | letter = $C ifTrue:[ ^ self printHistory ] ].
	^ ''
]

{ #category : 'accessing' }
Roover >> interpretInitialPosition: aString [

	| cmd |
	cmd := aString splitOn: Character space.
	cmd := cmd reject: [ :string | string isEmpty or: [ string first = Character tab ] ].
	position := cmd first asInteger @ cmd second asInteger.
	direction := Direction fromChar: cmd third.
	history add: position
]

{ #category : 'accessing' }
Roover >> move [

	self move: direction.
]

{ #category : 'accessing' }
Roover >> move: aDirection [

	| tmp |
	tmp := aDirection move: position.


	(tmp isInsideRectangle: self area) ifFalse: [ ^ self ].
	position := tmp.
	history add: position
]

{ #category : 'accessing' }
Roover >> moveBack [

	
	self move: direction opposite.

]

{ #category : 'accessing' }
Roover >> origin [
	^1 @ 1
]

{ #category : 'accessing' }
Roover >> position [
	^ position
]

{ #category : 'accessing' }
Roover >> position: aPoint [ 
	position := aPoint
]

{ #category : 'accessing' }
Roover >> printHistory [

	^ String streamContents: [:s | 
		self history 
			do: [ :each | s nextPut: $(;
							print: each x;
							space;
							print: each y;
							nextPut: $) ]
			separatedBy: [ s space ]
		]
	
]

{ #category : 'as yet unclassified' }
Roover >> turnLeft [
	self direction: self direction rotateLeft
]

{ #category : 'accessing' }
Roover >> turnRight [
	self direction: self direction rotateRight .
]
