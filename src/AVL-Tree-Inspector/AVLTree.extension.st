Extension { #name : #AVLTree }

{ #category : #'*AVL-Tree-Inspector' }
AVLTree >> inspectorCanvas [
	<inspectorPresentationOrder: 90 title: 'AVL'>
	^ AVLTreeVisualizer new
		tree: self;
		asPresenter
]
