Class {
	#name : 'NorthTest',
	#superclass : 'TestCase',
	#category : 'Roover-Tests-direction',
	#package : 'Roover-Tests',
	#tag : 'direction'
}

{ #category : 'moveTest' }
NorthTest >> testNorthMove [
	self assert: (North  move: 0@0) equals: 0@1.
]

{ #category : 'tests' }
NorthTest >> testNorthTurnLeft [

	self assert: North  rotateLeft equals: West 
]

{ #category : 'tests' }
NorthTest >> testNorthTurnRight [

	self assert: North  rotateRight equals: East 
]
