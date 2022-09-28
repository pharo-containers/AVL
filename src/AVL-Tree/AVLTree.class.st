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
	root := root addChild: newObject.
	^ newObject
]

{ #category : #accessing }
AVLTree >> allChildren [
	| list |
	list := OrderedCollection new.
	self root withAllChildren: list.
	^ list
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

{ #category : #testing }
AVLTree >> isTotalBalanced [

	^ root isTotalBalanced
]

{ #category : #removing }
AVLTree >> remove: oldObject ifAbsent: anExceptionBlock [
	| toRemove path |
	path := OrderedCollection new.
	toRemove := root remove: oldObject path: path.
	toRemove ifNil: [ ^ anExceptionBlock value ].
	
	toRemove == root ifTrue: [ 
		root := root successor: path.
		root ifNil: [ root := AVLNilNode new ] ].
	root checkRemovingPath: path.
	
	
	^ toRemove contents
]

{ #category : #accessing }
AVLTree >> root [
	^ root
]

{ #category : #search }
AVLTree >> search: anInteger [ 
	^ root search: anInteger
]
