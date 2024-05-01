//https://docs.mulesoft.com/dataweave/latest/dataweave-formats-xml

// %dw 2.0
// output application/xml encoding = "UTF-8"
// ns st http://bharat.com/stnamespace
// var example1 = 
// [
//   {
//     "id": 1
//   },
//   {
//     "id": 2
//   },
//   {
//     "id": 3
//   }
// ]
// ---
// // st#studentDetails:
// // {
// //  firstName: "bharat" ,
// //   lastName: "chim"
// // }

// st#studentDetails: {(
//   example1
// )}

// -----------------------------------------------------------------------------------

// %dw 2.0
// output application/xml encoding= "UTF-8"
// ns st http://bharat.com/stnamespace
// var x1 = 10
// var setJson =
// [
    
// {
//     "fName":  "mangesh", 
//     "lName":  "chim",
//     "id": 101
// }  ,
// {
//     "fName": "manju" , 
//     "lName":  "deshmukh",
//     "id": 205
// }    ,
// {
//     "fName":  "golusing", 
//     "lName": "pille" ,
//     "id": 404
// }
// ]
// ---
// st#studentDetails @("value": x1):{(
//   setJson map studentInformation :{
//  "fName": $.fName ,
//  "lName": $.lName ,
//  "id": $.id
//   }
// )}

// ----------------------------------------------------------------------


//payload
// <?xml version='1.0' encoding='UTF-8'?>
// <st:studentDetails xmlns:st="http://bharat.com/stnamespace">
//   <studentInformation>
//     <fName>mangesh</fName>
//     <lName>chim</lName>
//     <id>101</id>
//   </studentInformation>
//   <studentInformation >
//     <fName>manju</fName>
//     <lName>deshmukh</lName>
//     <id>205</id>
//   </studentInformation>
//   <studentInformation>
//     <fName>golusing</fName>
//     <lName>pille</lName>
//     <id>404</id>
//   </studentInformation>
// </st:studentDetails>
// --------------------------------------------------------------------------------

// %dw 2.0
// output application/json 
// ---
// payload.studentDetails.*studentInformation filter ($.id >= 102) map{
//   fullName: $.fName ++ " " ++ $.lName ,
//   studentId : $.id
// }
// --------------------------------------------------------------------------------
//payload:
// <?xml version='1.0' encoding='windows-1252'?>
// <k1><![CDATA[This is <scripting> lan]]></k1>

// %dw 2.0
// output application/xml encoding="UTF-8"
// ---
// // {
// //   k1: "This is <scripting> lan" as CData
// // }

// {
//   k1: payload.k1 is CData
// }
// -------------------------------------------------------------------------------
//payload:
// <?xml version='1.0' encoding='UTF-8'?>
// <students>
//   <student id = "101">
//     <name>bharat</name>
//     <age>32</age>
//     <location>uk</location>
//   </student>
//   <student id = "102">
//     <name>arvind</name>
//     <age>72</age>
//     <location>usa</location>
//   </student>
//   <student id = "103">
//     <name>mayank</name>
//     <age>7</age>
//     <location>india</location>
//   </student>
// </students>


// %dw 2.0
// output application/json duplicateKeyAsArray=true
// ---
// payload.students.*student map ((item, index) ->{
//   extractName: item.name
// } ) 
// -------------------------------------------------------------------------------
// %dw 2.0
// output application/json
// ---
// flatten("www.mathoman.com" scan(/([a-z]*).([a-z]*).([a-z]*)/))

//------------------------------------------------------------------------
// %dw 2.0
// output application/json
// var x = read('{
//   "k1": "10 ",
//   "k2": "20"
// }' , "application/json")
// ---
// {
//   "key1": x
// }
//-----------------------------------------------------------------------------
// %dw 2.0
// output application/xml
// var x = read('{
//   "k1": "10 ",
//   "k2": "20"
// }' , "application/json")
// ---

//   "mysampledata": x
//--------------------------------------------------------------------------------
//groupBy:

// %dw 2.0
// output application/json
// ---
// ["a" , "b" , "you"] groupBy((item , index) -> index)

// ---------------------------------------------------------------------------------
// %dw 2.0
// output application/json
// var x1 = ["1" , "2" , "3"]
// var x2 = ["a" , "b" , "c"]
// ---
// unzip(x1 zip  x2)
// ---------------------------------------------------------------------------------
// %dw 2.0
// output application/json
// var x1 = {
//   "key1": "Mulesoft"
// }
// ---
// {
//   example1: x1.key1 match  {
//     case "Mulesoft" -> $
//     else -> "Wrong input"
//   }
// }
// ---------------------------------------------------------------------------------
// %dw 2.0 
// import * from dw::util::Values
// output application/json
// ---
// // [1 , 2 , 3 , 4 , 5]   update 0 with 10  // here 0 is index
// {
//   "k1": "Manju"
// }update  "k1" with "Mulesoft"
// ---------------------------------------------------------------------------------
// %dw 2.0
// import * from dw::util::Values
// output application/json
// ---
// {
//  "k1": "ramrao" ,
//  "k2": "shamrao" 
// } mask  "k2" with "*******" then ((result) -> result)
//--------------------------------------------------------------------------------
// %dw 2.0 output application/json
// ---
// example1: [10 , 20 , 30 , 40 , 50 ] reduce ((item, accumulator) -> item + accumulator)
//  then ((result) -> result)

// %dw 2.0
//  output application/json
//  ---
// {
//      "chainResult": ["mariano", "de Achaval"]
//              reduce ((item, accumulator) -> item ++ accumulator)
//             then ((result) -> sizeOf(result)),
//     "referenceResult" : ["mariano", "de Achaval"]
//                           map ((item, index) -> upper(item))
//                           then {
//                              name: $[0],
//                              lastName: $[1],
//                              length: sizeOf($)                         },
//      "onNullReturnNull": []
//                  reduce ((item, accumulator) -> item ++ accumulator)
//                  then ((result) -> sizeOf(result))
//  }
// -------------------------------------------------------------------------

// %dw 2.0
// import * from dw::util::Coercions
// output application/json
// ---
// {
//   "k1": toString(["M" , "u" , "l" , "e"]) ,
//   "k2": toString([]),
//   "k3": toString(|2022-05-01|) 
// }
// ---------------------------------------------------------------------------

// %dw 2.0
// output application/json
//  import * from dw::util::Coercions
// ---
// keysOf({
//   "k1": toString(["M" , "u" , "l" , "e"]) ,
//   "k2": toString([]),
//   "k3": toString(|2022-05-01|) 
// })


// %dw 2.0
// var myVar = read('<users xmlns="http://test.com">
//                      <user name="Mariano" lastName="Achaval"/>
//                      <user name="Stacey" lastName="Duke"/>
//                   </users>', 'application/xml')

// output application/json
// ---
// { keysOfExample: flatten([keysOf(myVar.users) map $.#,
//                           keysOf(myVar.users) map $.@])
// }

// ------------------------------------------------------------------------
//csv:

%dw 2.0
output application/json
---
payload