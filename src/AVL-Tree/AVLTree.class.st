"
AVL to check rotations
"
Class {
	#name : #AVLTree,
	#superclass : #Collection,
	#instVars : [
		'root'
	],
	#category : #'AVL-Tree'
}

{ #category : #adding }
AVLTree >> add: newObject [ 
	root isNilNode
		ifTrue: [ root := AVLNode with: newObject ]
		ifFalse: [ | path |
			path := OrderedCollection with: nil -> root.
			root add: newObject path: path.
			self checkPath: path  ].
	^ newObject
]

{ #category : #accessing }
AVLTree >> allChildren [
	| list |
	list := OrderedCollection new.
	self root withAllChildren: list.
	^ list
]

{ #category : #private }
AVLTree >> balance: index path: aCollection [ 
	| x y z a b c |
	z := aCollection at: index.
	y := aCollection at: index + 1.
	x := aCollection at: index + 2.
	c := z value.
	b := y value.
	a := x value.
	(y key and: [ x key ]) ifTrue: [ 
		^ self rrrotationZ: c y: b x: a ].
	(y key not and: [ x key not ]) ifTrue: [ 
		^ self llrotationZ: c y: b x: a ].
	(y key not and: [ x key ]) ifTrue: [ 
		^ self lrrotationZ: c y: b x: a ].
	"(y key and: [ x key not ])"
	^ self rlrotationZ: c y: b x: a.
	"self notYetImplemented."
]

{ #category : #private }
AVLTree >> checkPath: aCollection [ 
	aCollection size < 3 ifTrue: [ ^ self ].
	(1 to: aCollection size - 2) reverseDo: [ :index |
		| assoc |
		assoc := aCollection at: index.
		assoc value isBalanced ifFalse: [ ^ self balance: index path: aCollection ] ]
]

{ #category : #enumerating }
AVLTree >> do: aBlock [ 
	root do: aBlock
]

{ #category : #public }
AVLTree >> height [
	^ root height
]

{ #category : #testing }
AVLTree >> includes: anObject [
	anObject ifNil: [ ^ nil ].
	^ (self search: anObject) notNil
]

{ #category : #initialization }
AVLTree >> initialize [
	super initialize.
	root := AVLNilNode new.
]

{ #category : #testing }
AVLTree >> isBalanced [
	^ root isBalanced
]

{ #category : #private }
AVLTree >> llrotationZ: z y: y x: x [ 
	| a3 a4 new |
	a3 := y right.
	a4 := z right.
	
	new := AVLNode with: z contents.
	new left: a3; right: a4.
	z left: x; contents: y contents; right: new.
	
]

{ #category : #private }
AVLTree >> lrrotationZ: z y: y x: x [ 
	| a1 a2 a3 new |
	a1 := y left.
	a2 := x left.
	a3 := x right.
	new := AVLNode with: y contents.
	new left: a1; right: a2.
	y contents: x contents; left: new; right: a3.
	
	self llrotationZ: z y: y x: new
]

{ #category : #removing }
AVLTree >> remove: oldObject ifAbsent: anExceptionBlock [ 
	^ root remove: oldObject ifAbsent: anExceptionBlock
]

{ #category : #private }
AVLTree >> rlrotationZ: z y: y x: x [ 
	| a1 a2 a3 a4 new |
	a1 := z left.
	a2 := x left.
	a3 := x right.
	a4 := y right.
	new := AVLNode with: y contents.
	new left: a3; right: a4.
	y contents: x contents; left: a2; right: new.
	self rrrotationZ: z y: y x: new
]

{ #category : #accessing }
AVLTree >> root [
	^ root
]

{ #category : #private }
AVLTree >> rrrotationZ: z y: y x: x [
	"right right rotation"
	| a1 a2 new |
	a1 := z left.
	a2 := y left.
	
	new := AVLNode with: z contents.
	new left: a1; right: a2.
	z left: new; right: x; contents: y contents
	
]

{ #category : #search }
AVLTree >> search: anInteger [ 
	^ root search: anInteger
]
