Class {
	#name : 'AVLTreeInspectorTest',
	#superclass : 'TestCase',
	#category : 'AVL-Tree-Inspector',
	#package : 'AVL-Tree-Inspector'
}

{ #category : 'tests' }
AVLTreeInspectorTest >> testCreateCanvas [

	| tree presenter |
	tree := tree := AVLTree new.
	tree addAll: { 4. 2. 3. 10 }.
	
	presenter := tree inspectorCanvas.
	self assert: presenter isPresenter.
	self assert: presenter canvas nodes size equals: tree size.
]

{ #category : 'tests' }
AVLTreeInspectorTest >> testTree [
	
    |visualizer|
    tree := AVLTree new.
    visualizer := AVLTreeVisualizer new.
    visualizer tree: tree.
    
    self assert: (visualizer tree) equals: tree.
]
