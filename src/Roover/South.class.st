Class {
	#name : 'South',
	#superclass : 'Direction',
	#category : 'Roover-direction',
	#package : 'Roover',
	#tag : 'direction'
}

{ #category : 'accessing' }
South class >> move: aPoint [ 
	^aPoint x @ (aPoint y-1)
]

{ #category : 'comparing' }
South class >> rotateLeft [
	^West 
]

{ #category : 'comparing' }
South class >> rotateRight [
	^West .
]
