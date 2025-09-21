Class {
	#name : 'Direction',
	#superclass : 'Object',
	#category : 'Roover-direction',
	#package : 'Roover',
	#tag : 'direction'
}

{ #category : 'instance creation' }
Direction class >> fromChar: aString [

	| direction |
	self halt.
	direction := Dictionary new
		          at: 'E' put: [ ^ East ];
		          at: 'N' put: [ ^ North ];
		          at: 'W' put: [ ^ West ];
		          at: 'S' put: [ ^ South ].
	^ (direction at: aString) value
]

{ #category : 'accessing' }
Direction class >> move: aPoint [
	self subclassResponsibility.
]

{ #category : 'accessing' }
Direction class >> rotateLeft [ 
	self subclassResponsibility.
]

{ #category : 'accessing' }
Direction class >> rotateRight [
	self subclassResponsibility.
]
