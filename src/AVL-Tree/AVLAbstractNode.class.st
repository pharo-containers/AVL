"
Abstract class to use nil pattern
"
Class {
	#name : #AVLAbstractNode,
	#superclass : #Object,
	#category : #'AVL-Tree'
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

{ #category : #accessing }
AVLAbstractNode >> withAllChildren: aCollection [ 
]
