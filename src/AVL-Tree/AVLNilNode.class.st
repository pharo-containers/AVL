"
Nil node for empty AVL
"
Class {
	#name : #AVLNilNode,
	#superclass : #AVLAbstractNode,
	#category : #'AVL-Tree'
}

{ #category : #adding }
AVLNilNode >> addChild: newObject [
	^ AVLNode with: newObject
]

{ #category : #private }
AVLNilNode >> checkRemovingPath: path [
]

{ #category : #testing }
AVLNilNode >> isNilNode [
	^ true
]
