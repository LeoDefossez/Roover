Class {
	#name : 'SouthTest',
	#superclass : 'TestCase',
	#category : 'Roover-Tests-direction',
	#package : 'Roover-Tests',
	#tag : 'direction'
}

{ #category : 'tests' }
SouthTest >> testOposite [

	self assert: South opposite equals: North
]

{ #category : 'moveTest' }
SouthTest >> testSouthMove [

	self assert: (South  move: 0 @ 0) equals: 0 @ -1
]

{ #category : 'tests' }
SouthTest >> testSouthTurnLeft [

	self assert: South  rotateLeft equals: West 
]

{ #category : 'tests' }
SouthTest >> testSouthTurnRight [

	self assert: South  rotateRight equals: West 
]
