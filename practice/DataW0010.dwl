// ----------------------------------------------------------------------------------
//payload
// {
// "Tittle": "Mr" ,
// "Name": "Bharat Chim" ,
// "Mobile": 9075720192
// }

// %dw 2.0 output application/json
// var countryCode = "+91-" 
// ---
// {
//     "Name": payload.Tittle ++ " " ++ payload.Name ,
//     "Mobile": countryCode ++ payload.Mobile
// }
// ------------------------------------------------------------------------------------
// %dw 2.0 output application/json
// var countryCode = "+91-" 
// fun detail(pay) = 
// {
// "Name": pay.Tittle ++ " "++ pay.Name ,
// "Mobile": countryCode ++ pay.Mobile

// }
// ---
// detail(payload)
// ------------------------------------------------------------------------------------
// %dw 2.0 output application/json
// ---
// ["a" , "b" , "c" , "d" , "e" , "f"] map (value, index) -> {
//     (index): value
// }
// ----------------------------------------------------------------------------
//dataweave-core-string-functions:

// %dw 2.0
// output application/json
// var name = "Chinna"
// ---
// {
// 	"contains example": "mulesoft" contains("mule"),
// 	"find example": "aabccdbceaa" find "a",
// 	"isBlank example": isBlank("hello"),
// 	"isEmpty example array": isEmpty([1, 2, 3]),
// 	"isEmpty example string": isEmpty(null),
// 	"empName": if(! isEmpty(name)) name else "Not provided",
// 	"lower example": lower("MULESOFTesb"),
// 	"upper example": upper("MULEesb"),
// 	"matches example": "me@mulesoft.com" matches(/([a-z]*)@([a-z]*).com/),
// 	"replace example": "admin123" replace "123" with("ID"),
// 	"splitBy example": ("a-b-c" splitBy("-")),
// 	"startsWith example": "Mariano" startsWith("Mar"),
// 	"endsWith example": "Mariano" endsWith("no"),
// 	"trim example": trim("   my really long  text     ")
// }
// --------------------------------------------------------------------------------

// //dataweave-core-of-functionsFlow:
// %dw 2.0
// output application/json
// var name="Chinna"
// var caseTypes=["positive", "recovered", "positive"]
// var covidObject = {
//   "firstName": "Mike",
//   "lastName": "Tyson",
//   "phone": "789-655-3878",
//   "email": "mike@gmail.com"
// }
// var covidObjectArray = [
// {
//   "firstName": "John",
//   "lastName": "Nix",
//   "phone": "541-754-3010",
//   "email": "john@gmail.com"
// },
// {
//   "firstName": "Jake",
//   "lastName": "Vend",
//   "phone": "655-789-2345",
//   "email": "jake@yahoo.com"
// }
// ]
// ---
// {
// 	"sizeOf-FieldLevel": sizeOf(name),
// 	"sizeOf-ArrayLevel": sizeOf(caseTypes),
// 	"sizeOf-ObjectLevel": sizeOf(covidObject),
// 	"sizeOf-ArrayOfObjectLevel": sizeOf(covidObjectArray),
// 	"typeOf-FieldLevel": typeOf(name),
// 	"typeOf-ArrayLevel": typeOf(caseTypes),
// 	"typeOf-ObjectLevel": typeOf(covidObject),
// 	"typeOf-ArrayOfObjectLevel": typeOf(covidObjectArray),
// 	"namesOfObject": namesOf(covidObject),
// 	"keysOfObject": keysOf(covidObject),
// 	"valuesOfObject": valuesOf(covidObject),
// 	"indexOf-ArrayLevelSyntax1": indexOf(caseTypes, "positive"),
// 	"indexOf-ArrayLevelSyntax2": caseTypes indexOf "recovered",
// 	"lastIndexOf-ArrayLevel": lastIndexOf(caseTypes, "positive"),
// 	"entriesOfObject": entriesOf(covidObject),
// }
// // -----------------------------------------------------------------------------------
//map and mapObject function:

// %dw 2.0
// output application/json

// var covidObject = {
//   "firstName": "John",
//   "lastName": "Nix",
//   "phone": "541-754-3010",
//   "email": "john@gmail.com",
//   "caseType": "positive"
// }

// ---
// {
// 	"a": covidObject mapObject {
// 		($$): $
// 	},
	
// 	"b": covidObject mapObject(v, k, i) -> {
// 		(i): v
// 	}
// }
// ------------------
// %dw 2.0
// output application/json

// var caseTypes=["positive", "recovered", "negative"]

// var covidObjectArray = [
// {
//   "firstName": "John",
//   "lastName": "Nix",
//   "phone": "541-754-3010",
//   "email": "john@gmail.com"
// },
// {
//   "firstName": "Jake",
//   "lastName": "Vend",
//   "phone": "655-789-2345",
//   "email": "jake@yahoo.com"
// }
// ]
// ---
// {
// 	"a": caseTypes map {
// 		($$): $
// 	},
// 	"b": caseTypes map(caseType, indexOfCaseType) -> {
// 		(indexOfCaseType): caseType
// 	},
// 	"c": covidObjectArray map {
// 		($$): $
// 	},
// 	"d": covidObjectArray map(covidPayload, indexOfCovidPayload) -> {
// 		(indexOfCovidPayload): covidPayload
// 	},
// 	"e": covidObjectArray map(covidPayload, indexOfCovidPayload) -> {
// 		"fullName": covidPayload.firstName ++ " " ++ covidPayload.lastName,
// 		"phone": covidPayload.phone,
// 		"email": covidPayload.email
// 		}
// }
// // ---------------------------------------------------------------------------
//Filter & filterObject function:

// %dw 2.0
// output application/json

// var numberArray = [9,2,3,4,5]

// var covidObjectArray = [
// {
//   "firstName": "John",
//   "lastName": "Nix",
//   "phone": "541-754-3010",
//   "email": "john@gmail.com",
//   "caseType": "positive"
// },
// {
//   "firstName": "Jake",
//   "lastName": "Vend",
//   "phone": "655-789-2345",
//   "email": "jake@yahoo.com",
//   "caseType": "positive"
// },
// {
//   "firstName": "Mike",
//   "lastName": "Tyson",
//   "phone": "789-655-3878",
//   "email": "mike@gmail.com",
//   "caseType": "Recovered"
// } 
// ]
// ---
// {
// 	"a": numberArray filter($ > 3),
	
// 	"b": numberArray filter(v, i) -> v > 3,
	
// 	"c": covidObjectArray filter($.caseType == "positive"),
	
// 	"d": covidObjectArray filter(covidPayload, indexOfCovidPayload) -> covidPayload.caseType == "Recovered"	
// }


// %dw 2.0
// output application/json

// var covidObject = {
//   "firstName": "John",
//   "lastName": "Nix",
//   "phone": "",
//   "email": null,
//   "caseType": "positive"
// }

// ---
// {
// 	"a": covidObject filterObject(! isEmpty($)),
	
// 	"b": covidObject filterObject(v, k, i) -> (! isEmpty(v))
// }
// --------------------------------------------------------------------------------------
// %dw 2.0
// output application/json

// var covidObjectArray = [
// {
//   "firstName": "John",
//   "lastName": "Nix",
//   "phone": "541-754-3010",
//   "email": "john@gmail.com",
//   "caseType": "positive"
// },
// {
//   "firstName": "Jake",
//   "lastName": "Vend",
//   "phone": "655-789-2345",
//   "email": "jake@yahoo.com",
//   "caseType": "positive"
// },
// {
//   "firstName": "Mike",
//   "lastName": "Tyson",
//   "phone": "789-655-3878",
//   "email": "mike@gmail.com",
//   "caseType": "recovered"
// } 
// ]

// ---

// {
// 	"covidCases": (covidObjectArray map(covidPayload , indexOfCovidPayload)->{
// 		"fullName": covidPayload.firstName ++ " " ++ covidPayload.lastName ,
// 		"phoneNumber": covidPayload.phone  ,
// 		"emailId": covidPayload.email ,
// 		"covidCaseType": covidPayload.caseType
// 	})filter($.covidCaseType == "positive") 
// }
// // best practices:
// {
	
// 	"covidCases": covidObjectArray filter($.caseType == "recovered")  map(covidPayload, indexOfCovidPayload) -> {
// 		"fullName": covidPayload.firstName ++ " " ++ covidPayload.lastName,
// 		"phoneNumber": covidPayload.phone,
// 		"emailAddress": covidPayload.email,
// 		"covidCaseType": covidPayload.caseType }
// }
// ------------------------------------------------------------------