Class {
	#name : #AVLTreeInspectorTest,
	#superclass : #TestCase,
	#category : #'AVL-Tree-Inspector'
}

{ #category : #tests }
AVLTreeInspectorTest >> testCreateCanvas [

	| tree canvas |
	tree := tree := AVLTree new.
	tree addAll: { 4. 2. 3. 10 }.
	canvas := tree createCanvas.
	self assert: canvas nodes size equals: tree size
]
