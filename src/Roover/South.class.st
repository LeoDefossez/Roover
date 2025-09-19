Class {
	#name : 'South',
	#superclass : 'Direction',
	#category : 'Roover',
	#package : 'Roover'
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
