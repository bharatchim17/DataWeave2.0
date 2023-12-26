//////////////////////////////////////////////////////////////////////////////////////////

 %dw 2.0
// import * from dw::core::Arrays
 output application/json
 ---
 {
//     // "countBy1" :  [ 1 , 2 , 3 , 4 , 5 , 6 ] countBy (($ mod 2) == 0) ,
//     // "countBy2" :  [ 1 , 2 , 3 , 4 , 5 , 6 ] countBy (($ / 2) == 0) ,
//     // "countBy3" :  [ 1 , 2 , 3 , 4 , 5 , 6 ] countBy (($ / 2) == 2) 
    
//     "divideBy2" :  [ 1 , 2 , 3 , 4 , 5 , 6 ] divideBy 2 ,
//     "divideBy4" :  [ 1 , 2 , 3 , 4 , 5 , 6 ] divideBy 4 ,
//     "divideBy5" :  [ 1 , 2 , 3 , 4 , 5 , 6 ] divideBy 5 
 }


// %dw 2.0
// import * from dw::core::Arrays
// output application/json
// var userName = ["user1" , "user2" , "user3" ]
// ---
// //  indexOf(userName , "user0")  // is -1 because  "user0" / null value does not present in array...
//  indexOf(userName , "user2") 

// %dw 2.0
// import * from dw::core::Arrays
// output application/json
// var sliceHead = [  10 , 20 , 30 , 40 , 50 , 60 ]
// ---
// slice(sliceHead , 2 , 5)

// %dw 2.0
// import * from dw::core::Arrays
// output application/json
// ---
// // {
// //     "sumBy" : 
// //     [
// //         {
// //       "k1" : 10
// //         },

// //         {
// //      "k1" : 20

// //         },

// //         {
// //     "k1" : 30

// //         }
// //     ] sumBy ($.k1 )
// // }


// // {
// //   "sumBy" : [
// //     [ { a: 1 }, { a: 2 }, { a: 3 } ] sumBy $.a,
// //     sumBy([ { a: 1 }, { a: 2 }, { a: 3 } ], (item) -> item.a)
// //   ]
// // }


// {
//     "itemDetails" : 
//     [
//         {
//    item1 : 500 ,
//    item2 : 700
//         } ,

//         {
//   item1 : 200 ,
//    item2 : 400
//         }
//     ] //  sumBy ((item) -> item.item1 )
//     // sumBy $.item2
//      sumBy ($.item2 + $.item1) / 2
// }

//////////////////////////////////////////////////////////////////////////////////////////


// %dw 2.0 
// import * from dw::core::Strings
// output application/json
// ---
// {
//     "camelize": camelize("hi_mule") ,
//     "capitalise" : capitalize("hello , bharat chim") ,
//     "upper" : upper("hello , bharat chim") ,
//     "lower" : lower("HELLO , BHARAT CHIM") ,
//     "isUpperCase" : isUpperCase("hi") ,
//     "isLowerCase" : isLowerCase("hi")  ,
//     "replaceAll" : replaceAll("Hello , BHARAT CHIM" , "BHARAT CHIM" , "Mule") ,
//     "subString" : substring("bharat" , 0 , 6) ,
//     "singularize" : singularize("boys") ,
//     "purelize" :  pluralize("there is so many girl"),
//     "wrapwith" : wrapWith("bharat" , "*")
// }

////////////////////////////////////////////////////////////////////////////////////////////

// %dw 2.0 
// output application/json
// ---
// {
// "avg1" : avg([80 , 90])   ,  // (80 + 90 ) / 2
// "avg2" : avg([70 , 80 , 90])   // (70 + 80 + 90 ) / 3
// }


// %dw 2.0 
// output application/json
// ---
// [1 , 0 , 0 , 5 , 4 , 5 ,  3 , 7 , 3 , 9 , 8 , 10 , 9] distinctBy ((item) -> 
// {
//     "removeDuplicateElement" : item
// })

// %dw 2.0 
// output application/json

// var studentDetails = 
// {
//     "name" : "bharat" ,
//     "subjects" :
//     [
//         "maths" ,
//         "physics" ,
//         "geometry" ,
//         "maths" ,
//         "science"
//     ] ,
//     "semester" : "1st"
// }
// ---
// // studentDetails.subjects distinctBy (item) -> item 
// studentDetails.subjects distinctBy $


//  %dw 2.0 
//  output application/json
//  ---

// // "mulesoft"  endsWith("ft")
// //  ["a" , "b" , "d" , "a"] find ("a")
//  {
//     // "key1" : ["a" , "b" , "c" , "d"] indexOf  "i" , //output:- -1 is null
//     // "key2" : "bharat"  indexOf  "a" ,
//     // "key3" : ["a" , "b" , "c" , "d"] indexOf  "d" 

//    "isblank":
//    {
    // "isBlank1": isBlank("") ,     //true
    // "isBlank2": isBlank('') ,      //true
    // "isBlank3": isBlank(null) ,   //true
    // "isBlank4": isBlank("mule")  //false
//    },

//   "isDecimal" :
//   {
//     "isDecimal01" : isDecimal(1.22) , // true
//     "isDecimal02" : isDecimal(1)     // false
//   } ,

//   "isEmpty":
//   {
//     "isEmpty1" : isEmpty([]) ,   //true
//     "isEmpty2" : isEmpty({}) ,   //true
//     "isEmpty3" : isEmpty(null),  //true
//     "isEmpty4" : isEmpty("") ,   //true
//     "isEmpty5" : isEmpty(" ") ,  //false , because it contain space.
//     "isEmpty6" : isEmpty('mule') //false
//   }

// }


// %dw 2.0 
// output application/dw
// ---

// {
 // "maximum" : max([1000 , 100 , 1000.1 , 10]) ,
// "minimum" : min([1000 , 100 , 1000.1 , 10]) 
// }

//  [(3 mod 2) , (4 mod 2) ,(1 mod 2) , (7 mod 2)]


// %dw 2.0 
// output application/dw
// var a1 = [18 , 25 , 54 , 84 , 72 , 62] 
// var a2 = [8 , 5 , 4 , 8 , 7 , 6] 
// var a3 = [ 105 , 872 , 932 , 721]

// var consolidateArray = [ a1 , a2 , a3]
// ---
// // consolidateArray
// flatten(consolidateArray)

////////////////////////////////////////////////////////////////////////////////////////
// payload01 :- Anonymus function 
// {
  
//  "field1" : "Bharat" ,
//  "field2" : "Chim" ,
//  "field3" : "CS" 
 
// }

// %dw 2.0 
//  output application/json
// //  fun loadEmpDetails (value) = 
// //   {
// //     "firstName" :  payload.field1 ,
// //     "lastName" :  payload.field2 ,
// //     "department" :  payload.field3 
// //   }

//   var loadEmpDetails = (value) -> 
//   {
//     "firstName" :  payload.field1 ,
//     "lastName" :  payload.field2 ,
//     "department" :  payload.field3 
//   }
//  ---
// loadEmpDetails(payload)



// %dw 2.0 
//  output application/json
//  var employeesName = 
//  [
//     "bharat" ,
//     "ajinkya" ,
//     "mayank"
//  ]
//  ---
// employee : employeesName map ((argument) -> upper(argument))

///////////////////////////////////////////////////////////////////////////////////////
// lambda function

// %dw 2.0 
//  output application/json
//  ---
// () -> 2 + 3
// (() -> 2 + 3)
// (() -> 2 + 3)() as Number
// (() -> 2 + 3)() as String


// [1 , 20 , 3 , 52 , 80 , 72 , 10] filter ((item) -> item > 50) 


// [
//     {
//         "name" : "bharat" ,
//         "id" :255
//     } ,

//      {
//         "name" : "Rahul" ,
//         "id" : 105
//     }
// ] filter ((item) -> item.id > 110 )


// %dw 2.0 
//  output application/json
//  var Numbers = (1 to 10)
//  ---
// //  filter (Numbers , (item , index) -> (item / 2)== 1)

// // arg1 function arg2

// // Numbers filter ((item , index) -> (item / 5) == 1)

// Numbers  filter((item , index) -> (item) > 1)
//          filter((item , index) -> (item) < 5)
//          filter((item , index) -> (item mod 2) == 1)


//  %dw 2.0 
//  output application/json
//  var Numbers = (6 to 15)
// ---
//  Numbers filter ((argument1) -> (argument1 mod 2) == 1)
//  Numbers filter ((argument1) -> (argument1 > 2) and (argument1 < 10) )
// Numbers filter(($ > 2 and $ < 10))

// payload02 :- 
// [
//     {
//         "empId" : 1 ,
//         "empName" : "bharat" ,
//         "empSalery" : 10000
//     } ,

//     {
//         "empId" : 2 ,
//         "empName" : "ajinkya" ,
//         "empSalery" : 100000
//     }
// ]

//  %dw 2.0 
//  output application/json
//  ---
// payload filter $.empSalery > 20000