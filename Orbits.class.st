Class {
	#name : #Orbits,
	#superclass : #Object,
	#category : #'CPS506-A1'
}

{ #category : #'instance creation' }
Orbits class >> from: str [ 
	^ self new from: str.
]

{ #category : #'instance creation' }
Orbits >> from: str [
|obj1 temp string num limit_1 this temp1 size1 this1 temp2|
string := ''.
obj1 := Dict new. 
temp := obj1 setUp: str.
temp1 := OrderedCollection new.
num := 1.
limit_1 := ((temp size)-1).

[num <= limit_1] whileTrue: [  
	this := (temp at: num).
	temp1 := this splitOn: String space.
	(temp1 size) == 1 ifTrue: [ 
		string := obj1 processOne: (temp1 at: 1), '
'.
		 ].
	(temp1 size) == 2 ifTrue: [ 
		string := obj1 processTwo: temp1, '
'.
		 ].
	num := num + 1.
	].
this1 := (temp at: (temp size)).
temp2 := this1 splitOn: String space.
(temp2 size) == 1 ifTrue: [ 
		string := obj1 processOne: (temp1 at: 1).
		 ].
(temp2 size) == 2 ifTrue: [ 
		string := obj1 processTwo: temp1.
		 ].

^string.
]
