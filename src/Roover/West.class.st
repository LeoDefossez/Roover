Class {
	#name : 'West',
	#superclass : 'Direction',
	#category : 'Roover-direction',
	#package : 'Roover',
	#tag : 'direction'
}

{ #category : 'accessing' }
West class >> move: aPoint [ 
	^aPoint x-1 @ aPoint y
]

{ #category : 'as yet unclassified' }
West class >> opposite [
	^ East
]

{ #category : 'comparing' }
West class >> rotateLeft [
	^ South.
]

{ #category : 'comparing' }
West class >> rotateRight [
	^North.
]
