Extension { #name : #AVLTreeVisualizer }

{ #category : #'*AVL-Tree-Inspector' }
AVLTreeVisualizer >> createNode: node [ 
	| label w h back |
	label := RSLabel new 
		text: node contents asString;
		color: 'black';
		yourself.
	w := label width.
	h := label height.
	back :=RSEllipse new
		size: (w max: h)+5;
		border: (RSBorder new color: 'black');
		color: (node isBalanced
			ifTrue: ['green']
			ifFalse: ['red']);
		yourself.
		
	^ { back. label } asShape
		model: node;
		padding: 7;
		draggable;
		yourself.
]
