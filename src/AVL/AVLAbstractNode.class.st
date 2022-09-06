"
Abstract class to use nil pattern
"
Class {
	#name : #AVLAbstractNode,
	#superclass : #Object,
	#category : #AVL
}

{ #category : #accessing }
AVLAbstractNode >> children [
	^ {  }
]

{ #category : #enumerating }
AVLAbstractNode >> do: aBlock [
]

{ #category : #accessing }
AVLAbstractNode >> height [
	^ 0
]

{ #category : #testing }
AVLAbstractNode >> isBalanced [
	^ true
]

{ #category : #testing }
AVLAbstractNode >> isNilNode [
	^ false
]

{ #category : #testing }
AVLAbstractNode >> isTotalBalanced [
	^ true
]

{ #category : #removing }
AVLAbstractNode >> remove: anObject path: list [
	^ nil
]

{ #category : #accessing }
AVLAbstractNode >> withAllChildren: aCollection [ 
]
