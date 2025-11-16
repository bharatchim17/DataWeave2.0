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