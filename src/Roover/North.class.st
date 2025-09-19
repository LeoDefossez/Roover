Class {
	#name : 'North',
	#superclass : 'Direction',
	#category : 'Roover',
	#package : 'Roover'
}

{ #category : 'accessing' }
North class >> move: aPoint [

	^ aPoint x @ (aPoint y + 1)
]

{ #category : 'as yet unclassified' }
North class >> rotateLeft [
	^ West 
]

{ #category : 'as yet unclassified' }
North class >> rotateRight [
	^East .
]
