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
// 	"c": ([covidObjectArray1 + covidObjectArray2]) flatMap ((item, index) -> item )
//  "d" : ([covidObjectArray1 + covidObjectArray2]) flatMap $	
// }

// // ------------------------------------------------------------
// reduce function:
%dw 2.0
import * from dw::core::Arrays
output application/json
var numberArray = [2,3,4]
---
{
	"a": numberArray reduce($+$$),
	"b": numberArray reduce ((item, accumulator) -> item + accumulator ),
    "c": numberArray sumBy((item) -> item ),
    "d": numberArray sumBy $ ,
    "e": numberArray reduce ((last , first) -> last)
}

// %dw 2.0 
// output application/json

// var a = 
// [
//  {
//     name: "sravan",
//      id :   406  
//  },
//  {
//     name: "lingam",
//      id :   102  
//  }
// ]
// var arr = [10, 25, 30, 45]

// ---
// a reduce ((item, accumulator) -> item ++ accumulator )

// // arr reduce ((item, accumulator = []) -> 
// // if(item > 20) accumulator ++ [item] else accumulator
// // )

// %dw 2.0 
// output application/json
// ---
//   reduce ($$ ++ $ )
// // [1 , 2 , 3 , 4 , 5]  reduce ($$ + $ )
// // [1 , 2 , 3 , 4 , 5]  reduce ((item, accumulator) -> item)
// // [1 , 2 , 3 , 4 , 5]  reduce ($)

// [1 , 2 , 3 , 4 , 5] reduce ($$ ++ $ )  //"12345"
//  [1 , 2 , 3 , 4 , 5]  reduce ((item, accumulator) -> accumulator ++ item) //"12345"

// [1 , 2 , 3 , 4 , 5] reduce ($ ++ $$ )  //"54321"
//  [1 , 2 , 3 , 4 , 5]  reduce ((item, accumulator) -> item ++ accumulator) //"54321"
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

// ------------------------------------------------------------------------------
// Dataweave-arithemetic-relational-logical-operators:

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
