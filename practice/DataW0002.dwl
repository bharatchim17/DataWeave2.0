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

//-----------------------------------------------------------------------------
//DateTime

// %dw 2.0
// output application/json
// type customDate = String {format: "uuuu/MM-dd"}
// ---
// {
//     "date1" : |2022-07-09T16:10:35| as String {format:"uuuu-MMM-dd"} ,
//     "date2" : |2022-07-09T16:10:35| as customDate
// }


// %dw 2.0
// output application/json
// var daysNo = 20
// var monthNo = 12
// var yearsNo = 25
// ---
// {
//    "subDateperios": |2022-07-09T17:23:21Z| - |P1D| ,
//    "subYearperios": |2022-07-09T17:23:21Z| - |P1Y| ,
//    "subMonthperios": |2022-07-09T17:23:21Z| - |P1M|
// }

//--------------------------------------------------------------------------

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


// %dw 2.0
// output application/json
// var learnDT = |2024-04-30T11:10:14.45|
// ---
// {
//     "k1": learnDT.nanoseconds ,
//     "k2": learnDT.minutes ,
//     "k3": learnDT.day,
//     "k4": learnDT.milliseconds ,
//     "k5": now() as DateTime >> "Asia/Calcutta" ,
//     "k6": now() as Date as String {format: "yyyy-MM-dd"} ,
//     "k7": now().hour ,
//     "k8": now() as Date - |P2D|
// }
// --------------------------------------------------------------------

// ...Skip null...

/* payload-01:-  
{
 "Technology" : "mulesoft" ,
   "City" : "Delhi" ,
   "Coutry" : "India" ,
   "EmpID" : null
}

*/

%dw 2.0
output application/json
// skipNullOn = "everywhere"
 ---
 {
//     "Technology" : payload.Technology ,
//    "City" : payload.City ,
//    "Coutry" : payload.City ,
//    "EmpID" : payload.EmpID
 }
 
//  %dw 2.0
//  output application/xml
// skipNullOn = "everywhere"
// ---
// demo:
// {
//    "Technology" : payload.Technology ,
//    "City" : payload.City ,
//    "Coutry" : payload.City ,
//    "EmpID" : payload.EmpID
// }

//  %dw 2.0
//  output application/java

//  ---

// {
//  "Technology" : payload.Technology ,
//    "City" : payload.City ,
//    "Coutry" : payload.City ,
// ("EmpID" : payload.EmpID) if payload.EmpID != null
// }

//////////////////////////////////////////////////////////////////////////////////////////

//...Find-Type...

//  %dw 2.0
//  output application/json

//  ---
// {
//      "String": typeOf("hello") , 
//      "Number": typeOf(1254) , 
//     "Boolean": typeOf(true), 
//     "Array": typeOf([]),
//     "Object": typeOf({}),
//     "null": typeOf(null) 
// }
////////////////////////////////////////////////////////////////////////////////////////////////
//Selectors:-

/* payload-02 :-  
{
    "id" : 1 ,
    "id" : 11 ,
    "secondLevel" : {
        "id" : 2 ,
        "id" : 22 ,

        "thirdLevel" : 
        {
       "id" : 3 ,
       "id" : 33
       
        }
    }
}
*/
 %dw 2.0
 output application/json
 ---
// payload.id //1 (single value selector)
// payload..id //[1 , 2 , 3] (decendent selector select first value in object/nested-object)
// payload.*id //[1 , 11] (multivalue selector select all value but , not work in nested object)
// payload..*id //[1 , 11 , 2 , 22 , 3 ,33](combination of multi-value and decendent selector select all values)
{
"decendent"  : payload..id ,
"multivalue" : payload.*id ,
"multiValueSecondLevel": payload.secondLevel.*id ,
"multiValueThirdLevel" : payload.secondLevel.thirdLevel.*id ,
"allTheId" : payload..*id
}
//////////////////////////////////////////////////////////////////////////////////////////
// Functions:-

// %dw 2.0
// output application/json
// // fun sum(num1 , num2) = 
// // num1 + num2
// fun add(n , m) =
// n + m
//  ---
// // sum(2 , 8)
// add(10,20)

// %dw 2.0 
// output application/json
// var data = 
// {
// "name" : "max the mule" ,
// "location" : 
// [
//     {
//         "name" : "BharatChim" ,
//         "address" : "jalaka Bhadang" ,
//         "street" : "M.P.M. School"
//     }
// ]
// }
// ---
// [
// data..name ,
// data.location[0].address ,
// data.location.address == "khamgaon"
// ]


//// lambda function:-
// %dw 2.0
//  output application/json
//  var add = (n , m)-> n + m 
//  ---
//  add(2 , 3)
////  ( () -> 2 + 3 ) ()

//// lambda function (H.O.F):-
// %dw 2.0
//  output application/json
//  ---
//   (1 to 5)          //array
//   (1 mod 2) == 1    //true
//   (2 mod 2) == 1    //false

// %dw 2.0
// output application/json
// fun isOddNum(n) = 
// (n mod 2) == 1
// var numbers = (1 to 5)
// ---
// filter(numbers , (n , idx) -> isOddNum(n))

// %dw 2.0
// output application/json
// var numbers = (1 to 5)
// ---
// filter (numbers,(n , idx ) -> (n mod 2) == 1 )


//prefix-notation:-

// %dw 2.0
//  output application/json
//  var numbers = (1 to 5)
//  ---
// //  numbers filter ((n , idx) -> (n mod 2) == 1)

// numbers 
// filter ((n , idx) -> (n mod 2) == 1)


// $ , $$ , $$$ :-
//  %dw 2.0
//  output application/json
//  var numbers = (1 to 5)
//  ---
// numbers filter (($ mod 2) == 1) // here $ is n represent name , number
//////////////////////////////////////////////////////////////////////////////////////////////
payload:
[
 {
"id" : 1 ,
 "item": "cheese" ,
 "price": 4.00  
},
{
 "id" : 2 ,
 "item": "snack",
 "price": 15.00 
},
 {
"id" : 3  ,
"item": "cereal",
"price": 5.00 
 },
 {
"id" : 4 ,
"item": "apples",
 "price": 2.00 
}
]
// %dw 2.0 
// output application/json
// ---
// payload filter $.price > 5
// payload filter $.price >= 15

// DO statement :- 

// %dw 2.0 
// output application/json
// fun diff(n) = do 
// {
//     var start = n[0] 
//     var end = n[-1]
//     ---
//     end - start
//  }
// ---
// diff([1990 , 1995 , 2002 , 2008 , 2021])


/////////////////////////////////////////////////////////////////////////////////////////////
//// Flow Control:-

/// payload-03:- if else

// {
//     "price" : 150.00
// }

// %dw 2.0
// output application/json
// var action = if (payload.price < 100 ) "buy" else if( payload.price > 140 ) "sell" else "hold" 
// ---
// {
//  "price"  : payload.price,
//  "action" : action 
// }

// payload-04:- pattern matching
    // {
    //     "id"     : 290505 ,
    //     "status" : 1 ,
    //     "name"   : "cabin outdoor light"
    // }


// %dw 2.0
// output application/json
// ---
// payload.status match  
// {
//     case 0 -> "light off"
//     case 1 -> "light on"
//     else   -> "invalid input"
// }

// %dw 2.0
// output application/json
// var a = 12
// ---
// // if (false) "execute True result" else "excecute False result"
// if (a > 10) "yes , a is greater than your value" else "excecute False result"

////////////////////////////////////////////////////////////////////////

