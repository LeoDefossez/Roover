Class {
	#name : 'North',
	#superclass : 'Direction',
	#category : 'Roover-direction',
	#package : 'Roover',
	#tag : 'direction'
}

{ #category : 'accessing' }
North class >> move: aPoint [

	^ aPoint x @ (aPoint y + 1)
]

{ #category : 'accessing' }
North class >> opposite [
	^ South
]

{ #category : 'as yet unclassified' }
North class >> rotateLeft [
	^ West 
]

{ #category : 'as yet unclassified' }
North class >> rotateRight [
	^East .
]
