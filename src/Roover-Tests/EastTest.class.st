Class {
	#name : 'EastTest',
	#superclass : 'TestCase',
	#category : 'Roover-Tests-direction',
	#package : 'Roover-Tests',
	#tag : 'direction'
}

{ #category : 'tests' }
EastTest >> testEastMove [
	self assert: (East  move: 0@0) equals: 1@0.
]

{ #category : 'tests' }
EastTest >> testOposite [

	self assert: East opposite equals: West
]

{ #category : 'tests' }
EastTest >> testRotateLeft [

	self assert: East  rotateLeft equals: North 
]

{ #category : 'tests' }
EastTest >> testRotateRight [

	self assert: East  rotateRight equals: South 
]
