"
Real node for AVL tree
"
Class {
	#name : #AVLNode,
	#superclass : #AVLAbstractNode,
	#instVars : [
		'left',
		'contents',
		'right'
	],
	#category : #'AVL-Tree'
}

{ #category : #'instance creation' }
AVLNode class >> with: anInteger [ 
	^ self new
		contents: anInteger;
		yourself
]

{ #category : #adding }
AVLNode >> add: anInteger path: list [
	anInteger < contents  ifTrue: [ 
		left 
			ifNil: [ 
				left := self class with: anInteger.
				list add: false -> left ]
			ifNotNil: [ 
				list add: false -> left.
				left add: anInteger path: list ]
	] ifFalse: [ 
		right 
			ifNil: [ 
				right := self class with: anInteger.
				list add: true -> right ]
			ifNotNil: [ 
				list add: true -> right.
				right add: anInteger path: list ] ]
	
]

{ #category : #accessing }
AVLNode >> children [
	^ { left. right } reject: #isNil
]

{ #category : #enumerating }
AVLNode >> childrenDo: aFullBlockClosure [ 
	left ifNotNil: aFullBlockClosure.
	right ifNotNil: aFullBlockClosure.
]

{ #category : #accessing }
AVLNode >> contents [
	^ contents
]

{ #category : #accessing }
AVLNode >> contents: anInteger [ 
	contents := anInteger
]

{ #category : #enumerating }
AVLNode >> do: aFullBlockClosure [ 
	left ifNotNil: [ left do: aFullBlockClosure ].
	aFullBlockClosure value: self contents.
	right ifNotNil: [ right do: aFullBlockClosure ].
]

{ #category : #accessing }
AVLNode >> height [
	| leftHeight rightHeight |
	leftHeight := left ifNil: [ 0 ] ifNotNil: [ left height ].
	rightHeight := right ifNil: [ 0 ] ifNotNil: [ right height ].
	^ (leftHeight max: rightHeight) + 1
	
]

{ #category : #testing }
AVLNode >> isBalanced [
	| leftHeight rightHeight |
	leftHeight := left ifNil: [ 0 ] ifNotNil: [ left height ].
	rightHeight := right ifNil: [ 0 ] ifNotNil: [ right height ].
	
	^ (leftHeight - rightHeight) abs <= 1
]

{ #category : #testing }
AVLNode >> isLeaf [
	^ left isNil and: [ right isNil ]
]

{ #category : #accessing }
AVLNode >> left [
	^ left
]

{ #category : #accessing }
AVLNode >> left: aNode [ 
	left := aNode
]

{ #category : #printing }
AVLNode >> printOn: stream [
	contents printOn: stream
]

{ #category : #accessing }
AVLNode >> right [
	^ right
]

{ #category : #accessing }
AVLNode >> right: anObject [ 
	right := anObject
]

{ #category : #search }
AVLNode >> search: anInteger [ 
	^ contents = anInteger ifTrue: [
		contents
	] ifFalse: [
		| node |
		node := anInteger < contents
			ifTrue: [ left ]
			ifFalse: [ right ].
		node ifNil: [ nil ] ifNotNil: [ node search: anInteger ]
	]
]

{ #category : #accessing }
AVLNode >> withAllChildren: aCollection [ 
	aCollection add: self.
	self childrenDo: [ :child | child withAllChildren: aCollection ]
]
