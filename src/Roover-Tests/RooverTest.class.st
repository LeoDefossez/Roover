Class {
	#name : 'RooverTest',
	#superclass : 'TestCase',
	#category : 'Roover-Tests-roover',
	#package : 'Roover-Tests',
	#tag : 'roover'
}

{ #category : 'tests' }
RooverTest >> testDefaultRooverDirectionIsNorth [

	| r |
	r := Roover new.
	self assert: r direction equals: North 
]

{ #category : 'tests' }
RooverTest >> testDefaultRooverPositionIsAtZeroZero [

	| r |
	r := Roover new.
	self assert: r x equals: 0.
	self assert: r y equals: 0.
]

{ #category : 'tests' }
RooverTest >> testInterpretDirection [

	| r |
	r := Roover new.
	r interpretDirection: 'MMRMM'.

	self assert: r x equals: 2.
	self assert: r y equals: 2.
	self assert: r direction equals: East 
]

{ #category : 'tests' }
RooverTest >> testInterpretFullCommand [

	| r |
	r := Roover new.
	r interpretFullCommand: '5 5
1 2 N 
RMRM'.

	self assert: r x equals: 2.
	self assert: r y equals: 1.
	self assert: r direction equals: South 
]

{ #category : 'tests' }
RooverTest >> testInterpretGridSize [

	| r |
	r := Roover new.
	r interpretGridSize: '5 5
1 2 N 
LMLM'.
	self assert: r gridSize equals: 6@6
]

{ #category : 'tests' }
RooverTest >> testInterpretInitialPosition [ 
		
	| r |
	r := Roover new.
	r interpretInitialPosition: '1 2 E'.
	
	self assert: r x equals: 1.
	self assert: r x equals: 1.
	self assert: r direction equals: East.
	
]

{ #category : 'tests' }
RooverTest >> testMove [
| r |
r:= Roover new.
r move.
self assert: r x equals: 0


]

{ #category : 'tests' }
RooverTest >> testRotateLeft [
|r|
 r := Roover new.
r turnLeft.

self assert: r direction equals: West.

]

{ #category : 'tests' }
RooverTest >> testRotateRight [

	| r |
	r := Roover new.
	r turnRight.

	self assert: r direction equals: East 
]

{ #category : 'tests' }
RooverTest >> testSplitInput [

	| splits |
	splits := ('5 5
1 2 N
LMLM' splitOn: Character cr).

	self assert: splits size equals: 3.
	self assert: splits first equals: '5 5'
]
