Class {
	#name : 'DirectionTest',
	#superclass : 'TestCase',
	#category : 'Roover-Tests',
	#package : 'Roover-Tests'
}

{ #category : 'moveTest' }
DirectionTest >> testNorthMove [
	self assert: (North  move: 0@0) equals: 0@1.
]

{ #category : 'tests' }
DirectionTest >> testNorthTurnLeft [

	self assert: North  rotateLeft equals: West 
]

{ #category : 'tests' }
DirectionTest >> testNorthTurnRight [

	self assert: North  rotateRight equals: East 
]

{ #category : 'tests' }
DirectionTest >> testRotateLeft [

	self assert: East  rotateLeft equals: North 
]

{ #category : 'tests' }
DirectionTest >> testRotateRight [

	self assert: East  rotateRight equals: South 
]

{ #category : 'moveTest' }
DirectionTest >> testSouthMove [

	self assert: (South  move: 0 @ 0) equals: 0 @ -1
]

{ #category : 'tests' }
DirectionTest >> testSouthTurnLeft [

	self assert: South  rotateLeft equals: West 
]

{ #category : 'tests' }
DirectionTest >> testSouthTurnRight [

	self assert: South  rotateRight equals: West 
]

{ #category : 'tests' }
DirectionTest >> testTurnLeft [
	self assert: North rotateLeft equals: West
]

{ #category : 'tests' }
DirectionTest >> testTurnRight [

	self assert: North  rotateRight equals: East 
]

{ #category : 'moveTest' }
DirectionTest >> testWestMove [

	self assert: (West  move: 0 @ 0) equals: -1 @ 0
]

{ #category : 'tests' }
DirectionTest >> testWestTurnRight [

	self assert: West  rotateRight equals: North 
]

{ #category : 'tests' }
DirectionTest >> testWestTurnleft [

	self assert: West  rotateLeft equals: South 
]
