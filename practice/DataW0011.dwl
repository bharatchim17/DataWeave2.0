// ---------------------------------------------------------------------------------
// %dw 2.0
// output application/json

// var numberArray = [2,3,4]
// var stringArray = ["Mule","ESB"]
// var covidObjectArray1 = [{
// 	"firstName": "John",
// 	"lastName": "Nix",
// 	"phone": "541-754-3010",
// 	"email": "john@gmail.com",
// 	"caseType": "positive"
// },
// {
// 	"firstName": "Jake",
// 	"lastName": "Vend",
// 	"phone": "655-789-2345",
// 	"email": "jake@yahoo.com",
// 	"caseType": "positive"
// }]
// var covidObjectArray2 = [{
// 	"firstName": "Mike",
// 	"lastName": "Tyson",
// 	"phone": "789-655-3878",
// 	"email": "mike@gmail.com",
// 	"caseType": "recovered"
// }]
// ---
// {
// 	"a": flatten(numberArray + stringArray),
// 	"b": flatten(covidObjectArray1 + covidObjectArray2) map $.firstName,
// 	"c": (covidObjectArray1 + covidObjectArray2) flatMap$	
// }
// --------------------------------------------------------------------------
//Dataweave core by functions:
// %dw 2.0
// output application/json

// var numberArray = [0, 1, 2, 3, 3, 2, 1, 4]

// var covidObjectArray = [
// {
//   "firstName": "John",
//   "lastName": "Nix",
//   "phone": "541-754-3010",
//   "email": "john@gmail.com",
//   "caseType": "positive"
// },
// {
//   "firstName": "Mike",
//   "lastName": "Tyson",
//   "phone": "789-655-3878",
//   "email": "john@gmail.com",
//   "caseType": "recovered"
// },
// {
//   "firstName": "Jake",
//   "lastName": "Vend",
//   "phone": "655-789-2345",
//   "email": "jake@yahoo.com",
//   "caseType": "positive"
// }
// ]

// ---
// {
	
// 	"a": numberArray distinctBy $,
// 	"b": numberArray distinctBy(v, index) -> v,
// 	"c": covidObjectArray distinctBy $.email,
// 	"d": covidObjectArray distinctBy(v, index) -> v.email,
// 	"e": numberArray orderBy $,
// 	"f": numberArray orderBy(v,i) -> (-v),
// 	"g": covidObjectArray orderBy $.caseType,
// 	"h": covidObjectArray orderBy(v,i) -> v.caseType,
// 	"i": numberArray groupBy $,
// 	"j": numberArray groupBy(v, index) -> v,
// 	"k": covidObjectArray groupBy $.caseType,
// 	"l": covidObjectArray groupBy(v, index) -> v.caseType,
// 	"m": numberArray joinBy "-",
// 	"n": covidObjectArray.caseType joinBy ","

// }
// // ------------------------------------------------------------
// reduce function:
// %dw 2.0
// output application/json
// var numberArray = [2,3,4]
// ---
// {
// 	"a": numberArray reduce($+$$),
// 	"b": numberArray reduce(i, a) -> (i + a)
// }
// ---------------------------------------------------------------
// %dw 2.0
// output application/json
// var numberArray = [2,3,4]
// var stringArray = ["Mule","ESB"]
// var mixedArray = [ [0,"a"], [1,"b"], [2,"c"],[ 3,"d"] ]
// var covidObject = {
//   "firstName": "Mike",
//   "lastName": "Tyson",
//   "phone": "789-655-3878",
//   "email": "mike@gmail.com"
// }
// var covidObjectArray1 = [{
// 	"firstName": "John",
// 	"lastName": "Nix",
// 	"phone": "541-754-3010",
// 	"email": "john@gmail.com",
// 	"caseType": "positive"
// },
// {
// 	"firstName": "Jake",
// 	"lastName": "Vend",
// 	"phone": "655-789-2345",
// 	"email": "jake@yahoo.com",
// 	"caseType": "positive"
// }]
// ---
// {
// 	"++ ex1": numberArray ++ stringArray,
// 	"++ ex2": covidObject ++ {"caseType": "positive"},
// 	"++ ex3": stringArray[0] ++ " " ++ stringArray[1],
// 	"-- ex1": numberArray -- [4],
// 	"-- ex2": covidObject -- {"phone": "789-655-3878"},
// 	"pluck ex-keys": covidObject pluck $$,
// 	"pluck ex-values": covidObject pluck $,
// 	"pluck ex-indexes": covidObject pluck $$$,
// 	"to-ex": 1 to 10,
// 	"uuid-ex": uuid(),
// 	"zip-ex": zip(numberArray, stringArray),
// 	"unzip-ex": unzip(mixedArray)
// }
// --------------------------------------------------------------
// %dw 2.0
// output application/json
//  var numberArray = [0, 1, 2, 3, 3, 2, 1, 4]
// ---
// //numberArray orderBy $
// //numberArray orderBy -$
// //(numberArray orderBy -$)[0]
// //numberArray orderBy ((item , index)-> item)
// //numberArray orderBy ((item , index)-> - item)
// //(numberArray orderBy ((item , index)-> - item))[0]
// (numberArray orderBy ((item , index)-> - item))[0 to -1]
// ------------------------------------------------------------------------------
Dataweave-arithemetic-relational-logical-operators:

%dw 2.0
output application/json
var number1 = 1
var number2 = 2
var boolean1 = true
var boolean2 = false
var numberArray = [1,2,3]
var stringArray = ["3","hello","mule"]
var mixedArray = [1,1,2,3,"hello","mule"]
---
[{
	"mathemeticalOperators": {
		"+": number1+number2,
		"-": number2-number1,
		"*": numberArray[1] * numberArray[2],
		"/": numberArray[2]/numberArray[1],
	},
	"relationalOperators": {
		"<": number1 < number2,
		">": number1 > number2,
		"<=": numberArray[1] <= numberArray[2],
		">=": numberArray[1] >= numberArray[2],
		"==": mixedArray[0] == mixedArray[1],
		"~=": numberArray[2] ~= stringArray[0]
	},
	"logicalOperator": {
		"and-ex1": boolean1 and boolean2,
		"and-ex2": (number1 < number2) and (number1 + 1 == number2),
		"or-ex1": boolean1 or boolean2,
		"or-ex2": (number1 > number2) or (number1 + 2 == number2),
		"not-ex1": not (boolean1 or boolean2),
		"not-ex2": not ((number1 < number2) or (number1 + 1 == number2)),
		"!-ex1": ! (boolean1 or boolean2),
		"!-ex2": ! ((number1 < number2) or (number1 + 1 == number2))
	}
		
}]

*dataweave-append-prepend-(+)-(-)-operators:

%dw 2.0
output application/json
var numberArray = [1,2,3]
var stringArray = ["3","hello","mule"]
var mixedArray = [1,1,2,3,"hello","mule"]
var covidObject = {
  "firstName": "Mike",
  "lastName": "Tyson",
  "phone": "789-655-3878",
  "email": "mike@gmail.com"
}
var covidObjectArray = [
{
  "firstName": "John",
  "lastName": "Nix",
  "phone": "541-754-3010",
  "email": "john@gmail.com"
},
{
  "firstName": "Jake",
  "lastName": "Vend",
  "phone": "655-789-2345",
  "email": "jake@yahoo.com"
}
]
---
[{
  	 // Array on right side when prepending.
      "prepend" : 1 >> numberArray,
      "prepend-string" : "a" >> stringArray,
      "prepend-object" :  covidObject >> covidObjectArray,
  	 // Array is on left side when appending.
      "append-number" : numberArray << 2 ,
      "append-string" : stringArray << "a" ,
      "append-object" : covidObjectArray <<  covidObject ,
     // + always appends within the array
      "append-with-+" : numberArray + 2 ,
      "removeNumberFromArray" : numberArray - 2 ,
      "removeObjectFromArray" : covidObjectArray -  {
		  "firstName": "John",
		  "lastName": "Nix",
		  "phone": "541-754-3010",
		  "email": "john@gmail.com"
		}
  }]
//   -----------------------------------------------------------------------------