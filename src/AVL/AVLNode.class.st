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
	#category : #AVL
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

{ #category : #testing }
AVLNode >> isTotalBalanced [
	^ self isBalanced 
		and: [ (left isNil or: [ left isTotalBalanced ]) 
			and: [ right isNil or: [ right isTotalBalanced ] ] ]
		
		
]

{ #category : #accessing }
AVLNode >> largerNode [
	| size1 size2 isLeft |
	size1 := left ifNil: [ 0 ] ifNotNil: [ left height ].
	size2 := right ifNil: [ 0 ] ifNotNil: [ right height ].
	isLeft := size1 > size2.
	^ isLeft not -> (isLeft ifTrue: [ left ] ifFalse: [ right ])
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

{ #category : #removing }
AVLNode >> remove: anObject path: list [
	contents = anObject ifTrue: [
		^ self
	] ifFalse: [ 
		| node nodeToRemove isLeft |
		node := (isLeft := anObject < contents)
			ifTrue: [ left ]
			ifFalse: [ right ].
		node ifNil: [ ^ nil ].
		list add: self.
		nodeToRemove := node remove: anObject path: list.
		nodeToRemove == node ifTrue: [
			| successor |
			successor := node successor: list.
			isLeft 
				ifTrue: [ left := successor ]
				ifFalse: [ right := successor ]
		] .
		^ nodeToRemove
	].
]

{ #category : #removing }
AVLNode >> removeMinimum: list [
	| res |
	left ifNil: [
		res := self class with: contents.
		contents := right contents.
		left := right left.
		right := right right ]
	ifNotNil: [ 
		list add: self.
		left isLeaf ifTrue: [
			res := left.
			left := nil ]
		ifFalse: [ res := left removeMinimum: list ] ].
	^ res
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

{ #category : #removing }
AVLNode >> successor: list [
	^ self isLeaf
		ifTrue: [ nil ]
		ifFalse: [ 
			(left notNil and: [ right notNil ]) ifTrue: [ 
				right isLeaf
					ifTrue: [ list add: (right left: left; yourself) ]
					ifFalse: [ | min newList |
						newList := OrderedCollection new.
						min := right removeMinimum: newList.
						list add: min.
						list addAll: newList.
						min left: left.
						min right: right.
						right := min ]
			] ifFalse: [ 
				list add: (left ifNil: [ right ] ifNotNil: [ left ]) ] ].
		
]

{ #category : #accessing }
AVLNode >> withAllChildren: aCollection [ 
	aCollection add: self.
	self childrenDo: [ :child | child withAllChildren: aCollection ]
]
