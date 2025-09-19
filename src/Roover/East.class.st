Class {
	#name : 'East',
	#superclass : 'Direction',
	#category : 'Roover',
	#package : 'Roover'
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
