//////////////////////////////////////////////////////////////////////////////////
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
// Check specific key:-

// %dw 2.0 
// output application/json
// var check = 
// {
// "name" : "Ana" ,
// "age"  :  29 ,
// "dynamickey" : "age"
// }
// ---
// // check.name?
// //  check.name1?
////////////////////////////////////////////////////////
