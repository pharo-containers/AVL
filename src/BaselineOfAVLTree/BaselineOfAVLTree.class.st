"
I am a baseline
"
Class {
	#name : #BaselineOfAVLTree,
	#superclass : #BaselineOf,
	#category : #BaselineOfAVLTree
}

{ #category : #baselines }
BaselineOfAVLTree >> baseline: spec [

	<baseline>
	spec for: #common do: [

		"Packages"
		spec package: 'AVL-Tree'.
		spec package: 'AVL-Tree-Tests' with: [ spec requires: #( 'AVL-Tree' )].
		spec package: 'AVL-Tree-Inspector' with: [ spec requires: #( 'AVL-Tree' )].
		
		"Define groups"
		spec
			group: 'Core' with: #( 'AVL-Tree' 'AVL-Tree-Inspector' );
			group: 'Tests' with: #( 'AVL-Tree-Tests' ).

		spec group: 'default' with: #( 'Core' 'Tests' )	]
		
	
]
