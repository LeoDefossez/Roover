Class {
	#name : 'WestTest',
	#superclass : 'TestCase',
	#category : 'Roover-Tests-direction',
	#package : 'Roover-Tests',
	#tag : 'direction'
}

{ #category : 'tests' }
WestTest >> testOposite [

	self assert: West opposite equals: East
]

{ #category : 'moveTest' }
WestTest >> testWestMove [

	self assert: (West  move: 0 @ 0) equals: -1 @ 0
]

{ #category : 'tests' }
WestTest >> testWestTurnRight [

	self assert: West  rotateRight equals: North 
]

{ #category : 'tests' }
WestTest >> testWestTurnleft [

	self assert: West  rotateLeft equals: South 
]
