Class {
	#name : 'DirectionTest2',
	#superclass : 'ParametrizedTestCase',
	#instVars : [
		'direction',
		'left',
		'right',
		'movement'
	],
	#category : 'Roover-Tests',
	#package : 'Roover-Tests'
}

{ #category : 'tests' }
DirectionTest2 >> testMove [

	self assert: (direction move: 0 @ 0) equals: movement
]

{ #category : 'tests' }
DirectionTest2 >> testParameters [

	^ ParametrizedTestMatrix new
		  addCase: {
				  (#direction -> North).
				  (#left -> West).
				  (#right -> East).
				  (#movement -> (0 @ 1)) };
		  addCase: {
				  (#direction -> South).
				  (#left -> East).
				  (#right -> West).
				  (#movement -> (0 @ -1)) };
		  addCase: {
				  (#direction -> East).
				  (#left -> North).
				  (#right -> South).
				  (#movement -> (1 @ 0)) };
		  addCase: {
				  (#direction -> West).
				  (#left -> South).
				  (#right -> North).
				  (#movement -> (-1 @ 0)) }
]

{ #category : 'tests' }
DirectionTest2 >> testRotateLeft [

	self assert: direction  rotateLeft equals: left 
]

{ #category : 'tests' }
DirectionTest2 >> testRotateRight [

	self assert: direction  rotateRight equals: right 
]
