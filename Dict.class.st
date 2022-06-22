Class {
	#name : #Dict,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'z',
		'last',
		'i',
		'j',
		'dictOrbit',
		'dictDistance',
		'str1',
		'size1',
		'elemZsize',
		'orbiter',
		'orbited',
		'distance',
		'key1',
		'value1',
		'str2',
		'a',
		'arr',
		'orderedDistance',
		'astring',
		'destination',
		'start',
		'index',
		'k',
		'k1',
		'k2',
		'arr2',
		'sum',
		'mid',
		'orderedTwo',
		'ind',
		'return',
		'bool',
		'ans'
	],
	#category : #'CPS506-A1'
}

{ #category : #'as yet unclassified' }
Dict >> processOne: key [
key1 := key.
return := ''.
value1 := ''.
return := key1, ' orbits'.
[dictOrbit includesKey: key1] whileTrue: [
	value1 := (dictOrbit at: key1).	
	return := return, ' ', value1.
	key1 := value1.
	].
^return.
]

{ #category : #'as yet unclassified' }
Dict >> processTwo: xyz [

ans := ''.
start := xyz at: 1.
destination := xyz at: 2.
astring := start.
index := 1.
k := 0.
sum := 0.
ans := 'From ', start, ' to ', destination, ' is '.

[ astring = destination ] whileFalse: [
bool := false.
(index <= (orderedDistance size))
ifTrue: [ 
	((orderedDistance at: index) includes: astring)
	ifTrue: [
		"Enters Array where the str is"
		k := ((orderedDistance at: index) indexOf: astring).
		(k = 1) 
		ifTrue: [ 
				bool := (dictOrbit includesKey: ((orderedDistance at: index) at: 2)).
				(bool = true)
				ifTrue: [ 
					sum := sum + (((orderedDistance at: index) at: 3) asInteger).
					astring := ((orderedDistance at: index) at: 2).
					(astring = destination)  
					ifFalse: [
						index := index + 1.
					].
				]
				ifFalse: [
					(((orderedDistance at: index) at: 2) = destination) 
					ifFalse: [
							index := index + 1.
						]
					ifTrue: [ 
							astring := ((orderedDistance at: index) at: 2). 
							sum := sum + (((orderedDistance at: index) at: 3) asInteger).
						].
				].
		].
		(k = 2) 
		ifTrue: [ 
			bool := (dictOrbit includes: ((orderedDistance at: index) at: 1)).
			(bool = true)
			ifTrue: [ 
					sum := sum + (((orderedDistance at: index) at: 3) asInteger).
					astring := ((orderedDistance at: index) at: 1).
					(astring = destination)  
					ifFalse: [
							index := index + 1.
					 ].
			]
			ifFalse: [
					(((orderedDistance at: index) at: 1) = destination) 
					ifFalse: [
							index := index + 1.
						]
					ifTrue: [ 
							astring := ((orderedDistance at: index) at: 1). 
							sum := sum + (((orderedDistance at: index) at: 3) asInteger).
						].
			].
		].
	]
	ifFalse: [
		index := index + 1.
	].
]
ifFalse: [  
	index := 1.	
].
].
ans := ans, sum, 'km'.
^ans.
]

{ #category : #'as yet unclassified' }
Dict >> setUp: str [
x := ''.
x := str.
y := OrderedCollection new. 
z := OrderedCollection new.
y := x splitOn: String cr.
arr := Array new: 3.
orderedDistance := OrderedCollection new.
dictOrbit := Dictionary new. 
last := y size.
i := 1. j:= 1.
[i <= last] whileTrue: [
	str1 := y at: i.
	size1 := str1 size.
	z := str1 splitOn: String space.
	elemZsize := z size.
	elemZsize == 3 ifTrue: [ 
		orbiter := z at: 3.
		orbited := z at: 1.
		distance := z at: 2.
		arr := {orbiter . orbited . distance}.
		orderedDistance add: arr.
		].
	dictOrbit at: orbiter put: orbited.
	i := i+1. 
	].
^ y.
]
