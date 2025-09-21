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

	^ 1 @ 1 rectangle: self gridSize
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

{ #category : 'initialization' }
Roover >> initialize [

	super initialize.
	direction := North.
	position := 1 @ 1.
	gridSize := 5 @ 5.
	history := #()
	
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
	self interpretDirection: temp third
]

{ #category : 'accessing' }
Roover >> interpretGridSize: aString [

	| grid |
	grid := aString splitOn: Character space.
	grid := grid reject: [ :string | string asInteger isNil ].
	self gridSize: grid first asInteger @ grid second asInteger
]

{ #category : 'accessing' }
Roover >> interpretInitialPosition: aString [

	| cmd |
	cmd := aString splitOn: Character space.
	cmd := cmd reject: [ :string | string isEmpty or: [ string first = Character tab ] ].
	position := cmd first asInteger @ cmd second asInteger.
	direction := Direction fromChar: cmd third
]

{ #category : 'accessing' }
Roover >> move [

	| tmp |
	tmp := self direction move: position.


	(tmp isInsideRectangle: self area) ifTrue: [ self position: tmp ]
]

{ #category : 'accessing' }
Roover >> moveBack [

	| tmp |
	tmp := self direction opposite move: position.


	(tmp isInsideRectangle: self area) ifTrue: [ self position: tmp ]
]

{ #category : 'accessing' }
Roover >> position [
	^ position
]

{ #category : 'accessing' }
Roover >> position: aPoint [ 
	position := aPoint
]

{ #category : 'as yet unclassified' }
Roover >> turnLeft [
	self direction: self direction rotateLeft
]

{ #category : 'accessing' }
Roover >> turnRight [
	self direction: self direction rotateRight .
]
