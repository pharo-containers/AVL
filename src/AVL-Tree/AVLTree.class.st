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
	root withAllChildren: list.
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

{ #category : #search }
AVLTree >> isLeaf [ 

	^ root isLeaf 
]

{ #category : #search }
AVLTree >> isNil [ 

	^ root isNilNode  
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

{ #category : #search }
AVLTree >> search: anInteger [ 
	^ root search: anInteger
]
