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
RooverTest >> testDefaultRooverGridsizeIsAt5time5 [

	self assert: Roover new gridSize equals: 5@5
]

{ #category : 'initialization' }
RooverTest >> testDefaultRooverHasEmptyHistory [
	self assert: Roover new history size equals: 0
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
RooverTest >> testInterpretDirectionWalkBack [

	| r |
	r := Roover new.
	r interpretDirection: 'MMB'.
	self assert: r position equals: 1 @ 2.
	self assert: r direction equals: North
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
	r interpretDirection: ' MMRV MM AD	 ENAD '.
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
RooverTest >> testInterpretFullCommandWithHistory [

	| r |
	r := Roover new.
	self assert: (r interpretFullCommand: '5 5
1 2 N 
RMM
C') equals: '(1 2) (2 2) (3 2)'.
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
RooverTest >> testInterpretHistory [

	| r |
	r := Roover new.
	r history: { 1@3 . 2@5}.
	self assert: (r interpretHistory: 'C') equals:  '(1 3) (2 5)'
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

{ #category : 'RooverAction' }
RooverTest >> testMove [
	| r |
	r := Roover new.
	r move.
	self assert: r position equals: 1@2.
]

{ #category : 'RooverAction' }
RooverTest >> testMoveWhenOverGridEast [
	| r |
	r := Roover new.
	r position: r gridSize.
	r direction: East.
	r move.
	self assert: r position equals: 5@5.
]

{ #category : 'RooverAction' }
RooverTest >> testMoveWhenOverGridNorth [
	| r |
	r := Roover new.
	r position: r gridSize.
	r move.
	self assert: r position equals: 5@5.
]

{ #category : 'RooverAction' }
RooverTest >> testMoveWhenOverGridSouth [
	| r |
	r := Roover new.
	r direction: South.
	r move.
	self assert: r position equals: 1@1.
]

{ #category : 'RooverAction' }
RooverTest >> testMoveWhenOverGridWest [
	| r |
	r := Roover new.
	r direction: West.
	r move.
	self assert: r position equals: 1@1.
]

{ #category : 'interpreting' }
RooverTest >> testRooverMoveHistory [

	| r |
	r := Roover new.
	r interpretDirection: 'M'.
	self assertCollection: r history hasSameElements: {1@2}
]

{ #category : 'RooverAction' }
RooverTest >> testRotateLeft [
|r|
 r := Roover new.
r turnLeft.

self assert: r direction equals: West.

]

{ #category : 'RooverAction' }
RooverTest >> testRotateRight [

	| r |
	r := Roover new.
	r turnRight.

	self assert: r direction equals: East 
]
