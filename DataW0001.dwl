// %dw 2.0
// output application/json
// ---
// // "Mule" ++ "Soft"  // to concanate use ++ 
//  3 / 2

// Object is always enclosed with {} and contains key:value pairs.
// An Array is always enclosed with [] and contains only Value
// MapObject use for object and object of object -> output is object
// Map use for Array and array of object -> output is array
// reduce use for Array --> output form is object with single value
// pluck use for object --> output form is Array
// flatten work on array it accepts single argument i.e.(one parameter)as input  --> output form is Array (Turn set of array into single array as output)
// $ represent value $$ represent index
// if(condition) value1 else value2

//////////////////////////////////////////////////////////////
/////// Map operator -

// %dw 2.0
// var a = 
// [
//         {"name" : "sravan" , "id"   : 2 },
//         {"name" : "sardar" , "id"   : [ 3 , 7 , 9] },
//         {"name" : "Mule"   , "id"   : [14 , 78 , 25 ,40] }
// ]

//  output application/json
//  ---
// //  a map {
// //     "UpperCase" : upper($.name) 
// //        }

// a map (key, index) -> {
//      "UpperCase" : upper(key.name),
//      "empId" : key.id 
// } 

////////////////////////////////////////////////////
/////// Flatten

// %dw 2.0
// output application/json
// var a = [1 , 2 , 3 , 4 ]
// var x = [14 , 17 ,98 , 78]
// var z = [a , x]
// var b = [{name : "Sravan"} , {name: "Lingam"}]
// var c = {"id" : 2}
// var d = [a , b , c]
// ---  
// // flatten([name : "sravan"])
// // flatten([a , x ])
// //  flatten(z)
// // flatten([[a] , x ,[ b.name]]


///////////////////////////////////////////////////////////////
///// pluck

//  %dw 2.0
//  output application/json

// var a = read("<prices>
//             <basic> 9.98 </basic>
//             <premium> 53.00 </premium>
//             <vip> 398099 </vip>
//             </prices>" , "application/xml")
//   var b = [
//     {
//         name : "sravan"
//     },
//     {
//         name : "lingam"
//     }
//   ]
//  ---
// // a pluck(x , y , z) -> 
// // {
// //     test : x
// // }

// // a.prices pluck $$


//////////////////////////////////////////////////////////
// Reduce

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
// ---

// // a reduce ((item, accumulator) -> item ++ accumulator )
// // a.id reduce ($)


// // [1 , 2 , 3 , 4 , 5]  reduce ($$ ++ $ )
// // [1 , 2 , 3 , 4 , 5]  reduce ($$ + $ )
// // [1 , 2 , 3 , 4 , 5]  reduce ((item, accumulator) -> item)
// // [1 , 2 , 3 , 4 , 5]  reduce ($)

//////////////////////////////////////////////////////////////////////////
//// If else statement
// if (true) "success" else "false"
// if (false) "success" else "false"

// %dw 2.0
// output application/json
// var a = 2
// ---
// // {
// //      ("name" : "sravan") if (a >= 30) ,
// //      ("name" : "Mule") if (a <= 20)
// // }

// // if (a >= 50)  "pass" else "fail"  

// // if (a > 50) "FirstClass" else if (a <= 50 and a >= 30) "secondClass"
// // else  "fail"

/////////////////////////////////////////////////////////////////////////

%dw 2.0
output application/json
---
{
   // "currentTime" : now() ,
   // "CST-Time" : now () >> "CST" ,
   // "IST-Time" : now () >> "IST" ,
   // "OnlyYear" : now().year ,
   // "OnlyMonth": now().month ,
   // "OnlyDay" : now().day ,
   // "AddYear"  : now() + |P2Y| ,
   // "AddMonth" : now() + |P2M| ,
   // "sbtract Months" : now() - |P3M| ,
   // "yyyyMMdd format": now() as String {format : "yyyyMMdd"} ,
   // "OnlyDate" : now() as Date ,
   //  "yyyy-MMMM-dd format": now() as String {format : "yyyy/MMMM/dd"} ,
   //  "yyyy-MMM-dd format": now() as String {format : "yyyy-MMM-dd"} ,
   // "String to Date" : "2019-02-09" as Date {format: "yyyy-dd-MM"},
   // "daysBetween" : (now() - (now()-|P2D|)) ,
   // "BC/AD" : now() as String {format : "G"} ,
   //  "Weekend" : now() as String {format : "eeee"},
   // "AM/PM?" : now() as String {format: "a"} ,
   // "24hrs format" : now() as String {format : "k"} ,
   // "12hr format" : now() as String {format : "K"} ,
   // "TimeZone" : now() as String {format : "0000"}
   
}