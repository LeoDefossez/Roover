Class {
	#name : 'East',
	#superclass : 'Direction',
	#category : 'Roover-direction',
	#package : 'Roover',
	#tag : 'direction'
}

{ #category : 'accessing' }
East class >> move: aPoint [ 
	^ aPoint x+1 @ aPoint y
]

{ #category : 'comparing' }
East class >> rotateLeft [
	^North.
]

{ #category : 'as yet unclassified' }
East class >> rotateRight [
	^ South.
]
