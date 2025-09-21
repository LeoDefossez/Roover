Class {
	#name : 'Direction',
	#superclass : 'Object',
	#category : 'Roover-direction',
	#package : 'Roover',
	#tag : 'direction'
}

{ #category : 'instance creation' }
Direction class >> fromChar: aString [ 
	aString = 'E' ifTrue: [ ^ East  ].
	aString = 'N' ifTrue: [ ^ North  ].
	aString = 'W' ifTrue: [ ^ West  ].
	aString = 'S' ifTrue: [ ^ South  ].
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
