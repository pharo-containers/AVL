"
An AVLTest is a test class for testing the behavior of AVL
"
Class {
	#name : #AVLTest,
	#superclass : #TestCase,
	#category : #'AVL-Tests'
}

{ #category : #tests }
AVLTest >> testAddForLLrotation [
	| tree data |
	tree := AVL new.
	tree add: 3.
	self assert: tree isBalanced.
	tree add: 2.
	self assert: tree isBalanced.
	tree add: 1.
	self assert: tree isBalanced.
	data := tree collect: #yourself.
	self assert: data asArray equals: { 1. 2. 3 }
	
]

{ #category : #tests }
AVLTest >> testAddForRRrotation [
	| tree data |
	tree := AVL new.
	tree add: 1.
	self assert: tree isBalanced.
	tree add: 2.
	self assert: tree isBalanced.
	tree add: 3.
	self assert: tree isBalanced.
	data := tree collect: #yourself.
	self assert: data asArray equals: { 1. 2. 3 }
	
]

{ #category : #tests }
AVLTest >> testAddOneElement [
	| tree |
	tree := AVL new.
	tree add: 1.
	self assert: tree isNotEmpty.
	self assert: (tree includes: 1).
	
]

{ #category : #tests }
AVLTest >> testAddTreeElements [
	| tree |
	tree := AVL new.
	tree addAll: { 2. 4. 10 }.
	self assert: (tree includes: 2).
	self assert: (tree includes: 4).
	self assert: (tree includes: 10).
	
]

{ #category : #tests }
AVLTest >> testAllChildren [
	| tree allChildren |
	tree := tree := AVL new.
	allChildren := tree allChildren.
	self assert: allChildren isEmpty.
	tree addAll: { 4. 2. 3. 10 }.
	allChildren := tree allChildren.
	self assert: allChildren size equals: 4.
	self assert: allChildren first class equals: AVLNode

]

{ #category : #tests }
AVLTest >> testCreateCanvas [
	| tree canvas |
	tree := tree := AVL new.
	tree addAll: { 4. 2. 3. 10 }.
	canvas := tree createCanvas.
	self assert: canvas nodes size equals: tree size.
]

{ #category : #tests }
AVLTest >> testEmpty [
	| tree |
	tree := AVL new.
	self assert: tree isEmpty.
]

{ #category : #tests }
AVLTest >> testHeight [
	| tree |
	tree := AVL new.
	self assert: tree height equals: 0.
	tree add: 4.
	self assert: tree height equals: 1.
	tree add: 2.
	self assert: tree height equals: 2.
	tree add: 10.
	self assert: tree height equals: 2.
	
]

{ #category : #tests }
AVLTest >> testIsBalanced [
	| tree |
	tree := AVL new.
	self assert: tree isBalanced.
	tree add: 4.
	self assert: tree isBalanced.
	tree add: 2.
	self assert: tree isBalanced.
	tree add: 10.
	self assert: tree isBalanced.
]

{ #category : #tests }
AVLTest >> testIsLeaf [
	| tree |
	tree := AVL new.
	self assert: tree root isNilNode.
	tree add: 1.
	self assert: tree root isLeaf.
]

{ #category : #tests }
AVLTest >> testRemove [
	| tree |
	tree := AVL new.
	tree addAll: { 9. 4. 16. 7. 13. 19. 15 }.
	tree add: 10.
	tree add: 14.
	tree add: 11.
	tree remove: 13.
	self assert: tree isTotalBalanced.
]

{ #category : #tests }
AVLTest >> testRemoveBranchWithOneChild [
	| tree |
	tree := AVL new.
	tree addAll: { 9. 4. 16. 13. 15 }.
	tree add: 14.
	tree remove: 9.
	self deny: (tree includes: 9).
	self assert: (tree includes: 14).
	
]

{ #category : #tests }
AVLTest >> testRemoveBranchWithTwoChildren [
	| tree |
	tree := AVL new.
	tree addAll: { 9. 4. 16. 13. 15. 10}.
	tree add: 14.
	tree remove: 15.
	self deny: (tree includes: 15).
	self assert: (tree includes: 14).
	self assert: (tree includes: 16).
	
	
]

{ #category : #tests }
AVLTest >> testRemoveBranchWithTwoChildren2 [
	| tree |
	tree := AVL new.
	tree addAll: { 9. 4. 16. 13. 15. 10. 14. 20}.
	tree remove: 15.
	self deny: (tree includes: 15).
	self assert: (tree includes: 20).
	self assert: (tree includes: 14).
	self assert: (tree includes: 16).
]

{ #category : #tests }
AVLTest >> testRemoveBranchWithTwoChildren3 [
	| tree |
	tree := AVL new.
	tree addAll: { 9. 4. 17. 13. 15. 10. 14. 20. 16}.
	tree remove: 15.
	self deny: (tree includes: 15).
	self assert: (tree includes: 20).
	self assert: (tree includes: 14).
	self assert: (tree includes: 16).
	self assert: (tree includes: 17).
]

{ #category : #tests }
AVLTest >> testRemoveRootChildren [
	| tree |
	tree := AVL new.
	tree addAll: { 9 }.
	tree remove: 9.
	self assert: tree isEmpty.
]

{ #category : #tests }
AVLTest >> testRemoveRootChildren1 [
	| tree |
	tree := AVL new.
	tree addAll: { 9. 7. 10 }.
	tree remove: 10.
	self assert: tree size equals: 2.
	self assert: (tree includes: 9).
	self assert: (tree includes: 7).
]

{ #category : #tests }
AVLTest >> testRemoveRootChildren2 [
	| tree |
	tree := AVL new.
	tree addAll: { 9. 7 }.
	tree remove: 7.
	self assert: tree size equals: 1.
	self assert: (tree includes: 9)
]

{ #category : #tests }
AVLTest >> testRemoveRootChildren3 [
	| tree |
	tree := AVL new.
	tree addAll: { 9. 7. 10 }.
	tree remove: 9.
	self assert: tree size equals: 2.
	self deny: (tree includes: 9).
	self assert: (tree includes: 10).
	self assert: (tree includes: 7).
]

{ #category : #tests }
AVLTest >> testRemoveZero [
	| tree value |
	tree := AVL new.
	value := false.
	tree remove: 1 ifAbsent: [ value := true ].
	self assert: value.
]

{ #category : #tests }
AVLTest >> testSearch [
	| tree |
	tree := AVL new.
	tree addAll: { 4. 2. 3. 10 }.
	self assert: (tree search: 5) isNil.
	self assert: (tree search: 4) equals: 4.
	self assert: (tree search: 2) equals: 2.
	self assert: (tree search: 10) equals: 10.
]

{ #category : #tests }
AVLTest >> testSeriousAdd [
	| tree |
	tree := AVL new.
	tree addAll: { 9. 4. 16. 7. 13. 19. 15 }.
	self assert: tree isBalanced.
	tree add: 10.
	self assert: tree isBalanced.
	tree add: 14.
	self assert: tree isBalanced.
]

{ #category : #tests }
AVLTest >> testSeriousRandomAdd [
	| tree r size numbers |
	tree := AVL new.
	r := Random new.
	r seed: 1234.
	size := 50.
	numbers := (1 to: size) collect: [ :i | r nextInteger: size. ].
	numbers := numbers asSet.
	
	numbers do: [ :n | 
		tree add: n.
		self assert: tree isTotalBalanced. ].
	
]

{ #category : #tests }
AVLTest >> testSeriousRandomRemove [
	| tree r size numbers toRemove |
	tree := AVL new.
	r := Random new.
	r seed: 1234.
	size := 50.
	numbers := (1 to: size) collect: [ :i | r nextInteger: size. ].
	numbers := numbers asSet.
	tree addAll: numbers.
	
	self assert: tree isTotalBalanced.
	toRemove := (1 to: 20) collect: [ :i | numbers atRandom: r ] as: Set.
	toRemove do: [ :number |
		tree remove: number.
		self assert: tree isTotalBalanced ].

]
