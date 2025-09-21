Class {
	#name : 'RooverTest',
	#superclass : 'TestCase',
	#category : 'Roover-Tests-roover',
	#package : 'Roover-Tests',
	#tag : 'roover'
}

{ #category : 'initialization' }
RooverTest >> testDefaultRooverDirectionIsNorth [

	| r |
	r := Roover new.
	self assert: r direction equals: North 
]

{ #category : 'initialization' }
RooverTest >> testDefaultRooverPositionIsAtOneOne [

	self assert: Roover new position equals: 1 @ 1
]

{ #category : 'interpreting' }
RooverTest >> testInterpretDirection [

	| r |
	r := Roover new.
	r interpretDirection: 'MMRMM'.

	self assert: r position equals: 3@3.
	self assert: r direction equals: East 
]

{ #category : 'interpreting' }
RooverTest >> testInterpretDirectionWhenGetOverGridBorder [

	| r |
	r := Roover new.
	self assert: r position equals: 1@1.
	self assert: r direction equals: North .
	r interpretDirection: 'LLM'.
	self assert: r direction equals: South.
	self assert: r position equals: 1@1
	 
]

{ #category : 'interpreting' }
RooverTest >> testInterpretDirectionWithMoreSpaces [

	| r |
	r := Roover new.
	r interpretDirection: ' MMR  MM   '.
	self assert: r position equals: 3@3.
	self assert: r direction equals: East 
]

{ #category : 'interpreting' }
RooverTest >> testInterpretDirectionWithNoise [
	| r |
	r := Roover new.
	r interpretDirection: ' MMRV MM AD	 BENAD '.
	self assert: r position equals: 3@3.
	self assert: r direction equals: East 
]

{ #category : 'interpreting' }
RooverTest >> testInterpretFullCommand [

	| r |
	r := Roover new.
	r interpretFullCommand: '5 5
1 2 N 
RMRM'.

	self assert: r position equals: 2@1.
	self assert: r direction equals: South 
]

{ #category : 'interpreting' }
RooverTest >> testInterpretGridSize [

	| r |
	r := Roover new.
	r interpretGridSize: '5 5'.
	self assert: r gridSize equals: 5@5
]

{ #category : 'interpreting' }
RooverTest >> testInterpretGridSizeWithMoreSpaces [

	| r |
	r := Roover new.
	r interpretGridSize: ' 5  5 '.
	self assert: r gridSize equals: 5@5
]

{ #category : 'interpreting' }
RooverTest >> testInterpretGridSizeWithMoreTab [

	| r |
	r := Roover new.
	r interpretGridSize: ' 5 	 5 '.
	self assert: r gridSize equals: 5@5
]

{ #category : 'interpreting' }
RooverTest >> testInterpretInitialPosition [ 
		
	| r |
	r := Roover new.
	r interpretInitialPosition: '1 2 E'.
	
	self assert: r position equals: 1@2.
	self assert: r direction equals: East.
	
]

{ #category : 'interpreting' }
RooverTest >> testInterpretInitialPositionWithMoreSpaces [
		
	| r |
	r := Roover new.
	r interpretInitialPosition: ' 1  2  E '.
	
	self assert: r position equals: 1@2.
	self assert: r direction equals: East.
	
]

{ #category : 'interpreting' }
RooverTest >> testInterpretInitialPositionWithTab [
		
	| r |
	r := Roover new.
	r interpretInitialPosition: ' 1  2 	 E '.
	
	self assert: r position equals: 1@2.
	self assert: r direction equals: East.
	
]

{ #category : 'tests' }
RooverTest >> testMove [

	| r |
	r := Roover new.
	
	r move.
	self assert: r position equals: 1@2.
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
