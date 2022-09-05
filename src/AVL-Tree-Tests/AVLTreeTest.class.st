"
An AVLTest is a test class for testing the behavior of AVL
"
Class {
	#name : #AVLTreeTest,
	#superclass : #TestCase,
	#category : #'AVL-Tree-Tests'
}

{ #category : #tests }
AVLTreeTest >> testAddForLLrotation [
	| tree data |
	tree := AVLTree new.
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
AVLTreeTest >> testAddForRRrotation [
	| tree data |
	tree := AVLTree new.
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
AVLTreeTest >> testAddOneElement [
	| tree |
	tree := AVLTree new.
	tree add: 1.
	self assert: tree isNotEmpty.
	self assert: (tree includes: 1).
	
]

{ #category : #tests }
AVLTreeTest >> testAddTreeElements [
	| tree |
	tree := AVLTree new.
	tree addAll: { 2. 4. 10 }.
	self assert: (tree includes: 2).
	self assert: (tree includes: 4).
	self assert: (tree includes: 10).
	
]

{ #category : #tests }
AVLTreeTest >> testAllChildren [
	| tree allChildren |
	tree := tree := AVLTree new.
	allChildren := tree allChildren.
	self assert: allChildren isEmpty.
	tree addAll: { 4. 2. 3. 10 }.
	allChildren := tree allChildren.
	self assert: allChildren size equals: 4.
	self assert: allChildren first class equals: AVLNode

]

{ #category : #tests }
AVLTreeTest >> testEmpty [
	| tree |
	tree := AVLTree new.
	self assert: tree isEmpty.
]

{ #category : #tests }
AVLTreeTest >> testHeight [
	| tree |
	tree := AVLTree new.
	self assert: tree height equals: 0.
	tree add: 4.
	self assert: tree height equals: 1.
	tree add: 2.
	self assert: tree height equals: 2.
	tree add: 10.
	self assert: tree height equals: 2.
	
]

{ #category : #tests }
AVLTreeTest >> testIsBalanced [
	| tree |
	tree := AVLTree new.
	self assert: tree isBalanced.
	tree add: 4.
	self assert: tree isBalanced.
	tree add: 2.
	self assert: tree isBalanced.
	tree add: 10.
	self assert: tree isBalanced.
]

{ #category : #tests }
AVLTreeTest >> testIsLeaf [
	| tree |
	tree := AVLTree new.
	self assert: tree root isNilNode.
	tree add: 1.
	self assert: tree root isLeaf.
]

{ #category : #tests }
AVLTreeTest >> testSearch [
	| tree |
	tree := AVLTree new.
	tree addAll: { 4. 2. 3. 10 }.
	self assert: (tree search: 5) isNil.
	self assert: (tree search: 4) equals: 4.
	self assert: (tree search: 2) equals: 2.
	self assert: (tree search: 10) equals: 10.
]

{ #category : #tests }
AVLTreeTest >> testSeriousAdd [
	| tree |
	tree := AVLTree new.
	tree addAll: { 9. 4. 16. 7. 13. 19. 15 }.
	self assert: tree isBalanced.
	tree add: 10.
	self assert: tree isBalanced.
	tree add: 14.
	self assert: tree isBalanced.
]

{ #category : #tests }
AVLTreeTest >> testSeriousRandomAdd [
	| tree r size numbers |
	tree := AVLTree new.
	r := Random new.
	r seed: 1234.
	size := 50.
	numbers := (1 to: size) collect: [ :i | r nextInteger: size. ].
	numbers := numbers asSet.
	
	numbers do: [ :n | 
		tree add: n.
		self assert: tree isBalanced. ].
	
]
