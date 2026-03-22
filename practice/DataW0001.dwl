// %dw 2.0
// output application/json
// ---
// // "Mule" ++ "Soft"  // to concanate use ++ 
//  3 / 2


// %dw 2.0 
// output application/json
// ---
// {
//     "addNumber" : [1 , 2 , 3 ] ++ [4 , 5 , 6] ++ ["a"] ,
//     "subNumber" : [1 , 2 , 3 ] -- [1] ,
//     "addString" : "hi" ++ " " ++ "bharat chim"
// }

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
// a  pluck(value , key , index) ->{
//     prices: value
// }

// a.prices pluck (($$): $)
// a.prices pluck $$


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

//////////////////////////////////////////////////////////////////////////
//// If else statement
// if (true) "success" else "False"
// if (false) "Unsuccess" else "success"

// %dw 2.0
// output application/json
// var a = 101
// ---
// //  if (a >= 50)  "pass" else "fail"  

// if(a >= 70 and a <= 100) "FirstClass" else if( a <= 70 and a >= 55) "secondClass" else "Fail"

/////////////////////////////////////////////////////////////////////////

%dw 2.0
output application/json
---
{
"currentTime" : now() ,         //2026-03-19T17:24:21.065535Z
"CST-Time" : now () >> "CST" , //"2026-03-19T12:25:51.892723-05:00"
"IST-Time" : now () >> "IST" ,    //"2026-03-19T22:56:17.882086+05:30"
"OnlyYear" : now().year ,   //2026
"OnlyMonth": now().month , //3
"OnlyDay" : now().day  , //19
"AddYear"  : now() + |P2Y| , //"2028-03-19T17:30:44.811534Z"
"AddMonth" : now() + |P2M| , //"2026-05-19T17:31:28.062845Z"
"sbtract Months" : now() - |P3M| ,
"yyyyMMdd format": now() as String {format : "yyyy-MM-dd"} , //"2026-03-19"
"OnlyDate" : now() as Date , //"2026-03-19"
"yyyy-MMMM-dd format": now() as String {format : "yyyy/MMMM/dd"} ,//"2026/March/19"
"String to Date" : "2019-02-09" as Date {format: "yyyy-dd-MM"},//"2019-02-09"
"daysBetween" : (now() - (now()-|P1D|)) , //"PT23H59M59.999998S"
"BC/AD" : now() as String {format : "G"} , //AD
"Weekend" : now() as String {format : "eeee"}, //"Thursday"
"AM/PM?" : now() as String {format: "a"}  //PM
}
//////////////////////////////////////////////////////////////////////////
//To check media type:
%dw 2.0
output application/json
---
payload.^mediaType