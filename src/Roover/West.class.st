Class {
	#name : 'West',
	#superclass : 'Direction',
	#category : 'Roover',
	#package : 'Roover'
}

{ #category : 'accessing' }
West class >> move: aPoint [ 
	^aPoint x-1 @ aPoint y
]

{ #category : 'comparing' }
West class >> rotateLeft [
	^ South.
]

{ #category : 'comparing' }
West class >> rotateRight [
	^North.
]
