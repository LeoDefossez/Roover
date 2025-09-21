Class {
	#name : 'Roover',
	#superclass : 'Object',
	#instVars : [
		'position',
		'direction',
		'gridSize'
	],
	#category : 'Roover-roover',
	#package : 'Roover',
	#tag : 'roover'
}

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

{ #category : 'initialization' }
Roover >> initialize [

	super initialize.
	direction := North .
	position := 0@0
]

{ #category : 'accessing' }
Roover >> interpretDirection: aString [

	| choice |
	choice := Dictionary new
		          at: $R put: [ self turnRight ];
		          at: $L put: [ self turnLeft ];
		          at: $M put: [ self move ];
		          yourself.

	aString do: [ :car | (choice at: car) value ]
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
	grid:= grid reject: #isEmpty .
	self gridSize: (grid first asInteger + 1) @
	(grid second asInteger + 1).
	
		
	
]

{ #category : 'accessing' }
Roover >> interpretInitialPosition: aString [

	| cmd |
	cmd := aString splitOn: Character space.
	position := cmd first asInteger @ cmd second asInteger.
	direction := Direction fromChar: cmd third
]

{ #category : 'accessing' }
Roover >> move [

	position := self direction move: position
]

{ #category : 'accessing' }
Roover >> position [
	^ position
]

{ #category : 'as yet unclassified' }
Roover >> turnLeft [
	self direction: self direction rotateLeft
]

{ #category : 'accessing' }
Roover >> turnRight [
	self direction: self direction rotateRight .
]
