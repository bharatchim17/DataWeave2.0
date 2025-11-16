%dw 2.0
output application/json
---
 {
// //     "k1" : 1 < 1 ,
// //     "k2" : 1 <= -8 ,
// //     "k3" : 56 > 98 ,
// //     "k4" : 876 >= 876.0 ,
// //     "k5" : 1 == 1 ,
// //     "k6" : "bharat" == "bharat" ,
// //     "k6" : 12 ~= "12" ,
// //     "k7" : "45" == 45 , 
// //     "k7" : "45" != 45
 } 

// {

// "andOperator" : 
// {
//  "k1" : true and true ,
//  "k2" : true and false ,
//  "k3" : false and false ,
//  "k4" : (1 + 1 == 2) and (10 + 10 == 20)
// },

// "orOperator" :
// {
//  "k1" : true or true ,
//  "k2" : true or false ,
//  "k3" : false or false ,
//  "k4" : (1 + 1 == 2) or (10 + 10 == 20)
// },

// "notOperator" :
// {
// "k1" : not true ,
// "k2" : not false ,
// "k3" : not (1 + 1 == 2) or (10 + 10 == 20)

// },

// "!=Operator" :
// {
// "k1" : ! true ,
// "k2" : ! false ,
// "k3" : ! (1 + 1 == 2) or (10 + 10 == 20)
// },

// "combineNot!" :
// {
//     "k1" : not true or true , // not (true or true)
//     "k2" : ! true or true   ,  // (!true) or true
//     "k3" : !true or !true ,
//     "k4" : !(true or true)
// }  

// }


// %dw 2.0
// output application/json
// ---
// {
//     "stringValue" : "this is string" ,
//     "numberValue" :
//     {
//         "key1" : 1 ,
//         "key2" : 23.45
//     },
    
//     "thisIsBoolean" : 
//     {
//         "key1" : true ,
//         "key2" : false
//     },
    
//     "thisIsArray" :
//     [
//         {
//             //this is array of objects
//         }
//     ],

//     "thisIsObject" :
//     {
//       key1:  
//       [ 
//         // this is object of array
        
//       ]
        
//     }

// }


// %dw 2.0 
// output application/json
// ---
//  typeOf("india")  
//  ,
// typeOf(100)
//,
// typeOf(true)
//,
// typeOf({}) 
//,
// typeOf([])
//,
// typeOf(null) 
// ,
// typeOf('')


// %dw 2.0 
// output application/json
// var info =
// {
//     "firstName" : "bharat" ,
//     "lastName"  : "chim",
//     "age" : 28 ,
//     "location" : "India" ,
//     "ZipCode" : 12385

// }
// ---
// // info.firstName
// // typeOf(info.firstName)
// // info.age 
// // typeOf(info.age)
// // upper(info.firstName)
// // info


//payload01:- index and range selector.

// [
//     "india" ,
//     "china" ,
//     "United Kingdum" ,
//     "United State" ,
//     "Russia"
// ]

//  %dw 2.0
//  output application/json
//  ---
// // payload
// // payload[-1]
// // payload[0]            //index value selector 

// // payload[0 to 2]          //Range value selector 



// // payload02:- multivalue selector
// // {
// //     "k1": "india" ,
// //     "k2": "japan" ,
// //     "k1": "usa" ,
// //     "k1": "maharashrtra"
// // }

// %dw 2.0
// output application/json
// ---
// payload.*k1


//payload03:-  Descendent + multivalue Selector


// {
//     "k1" : "manju" ,
//     "k2" : 
//     {
//         "k2.1": "india" ,
//         "k2.2": "mumbai"
//     },
//     "k3" : ["1" , "2" , 3 , 4 ] ,
//     "k4" : 
//     [
// {
//     "k4.1": "pakistan" 
// },
// {
//     "k4.2": "canada" 
// },
// {
//     "k4.3.1": "pune" ,
//     "k4.3.2": "khamgaon" 
// }

//     ]
// }

// %dw 2.0
// output application/json
// ---
// payload..*"k4.1"
//  payload..*"k4.2"
// payload..*"k4.3.2"


// %dw 2.0
// output application/json
// ---
// {
//     "key1": 15 >> [25] ,
//     "key2": [10] << 20 ,
//     "key3": "bharat" >> ["chim"] ,
//     "key4": [76] + 109 ,
//     "key5": [154 , 187 , 234] - 187 ,
//     "key6": ["ravi" , "akash" , "location"] - "location" - "ravi" ,
//     "key7": 
//     (
//         [
//             {
//           "a" : "b"
//             },
//             {
//           "c" : "d"
//             },
//             {
//          "e" : "f"
//             }
//         ] - 
//            {
//          "c" : "d"
  
//            }
//     )
// }



// //s and if else construct 

// %dw 2.0
// output application/json
// // global variable

// var myName = "its my name" 
// var firstArray = [1 , 2 , 3 , 4 , 5 , 6]
// var createObject = 
// {
//     "object1" : "Mule" ,
//     "object2" : "Soft" ,
//     "object3" : myName 

// }
// ---
// {
// key1 : createObject.object1 ++ " " ++ createObject.object2 ,
// key2 : firstArray >> [7] ,
// key3 : firstArray << 7 ,
// key4 : createObject.object3

// }


// %dw 2.0
// output application/json
// var fName = "Mule" 
// var lName = "Soft"
// ---
// do
// {
// var concatenateFL = fName ++ lName
// ---
// concatenateFL
// }

// %dw 2.0
// output application/json
// var fName = "Mule" 
// var lName = "Soft"

// var x =  do
// {
// var concatenateFL = fName ++ lName
// ---
// concatenateFL
// }
// ---
// {
//     key1 : fName ,
//     key2 : x
// }



// %dw 2.0
//  output application/json
//  var myObject = 
//  {
// "myCountry" : "Indisa"
//  }
//  ---
//  {
//  k1 :if(myObject.myCountry == "India") myObject.myCountry
//  else "invalid"
//  }

//payload03:- if else statement

// {
//     "name" : "bharat chim" ,
//     "location" : "india" ,
//     "id" : 1 ,
//     "age": 65 ,
//     "salery" : 10000 
// }

// %dw 2.0
//  output application/json

//  // function has created for  moduleAgeId
// fun ModuleAgeId(name , location , id , age , salery)=
// {
// k1 : if (age > 60 and id >= 1 ) name

//     else if (age < 60  and  id >= 1 )location
    
//      else salery 
// }

// fun moduleAgeSalery(name , location , id , age , salery)=
// {
// k1 : if (age > 60 and salery >= 10000 ) name

//     else if (age < 60  and  salery >= 10000 )location
    
//      else salery 
// }

// fun emptyFunction() =
// [
//     k1 : "hello"
// ]
//  ---

//  {
// // Invoke the function moduleAgId
// k1 : ModuleAgeId("bhrat" , "india" , 2 , 28 , 10000) ,
// k2 : ModuleAgeId("rahul" , "usa" , 1 , 78 , 10000) ,
// k3 : moduleAgeSalery("ajay" , "usa" , 2 , 28 , 100) ,
// k4 : emptyFunction()
//  }


// %dw 2.0
//  output application/json
//  fun twoParams(name1 , name2 , name3 = "soft") = name1 ++ " " ++ name2 ++ " " ++ name3
//  ---
// {

// k1 : twoParams("hello" , "mule" , "bharat") ,
// k1 : twoParams("hello" , "mule" ) ,

// }

// %dw 2.0
//  output application/json
//  fun functionParam1(p1 , p2 = 2 , p3 = 3) =
//  {
//     k1 : p1 ,
//     k2 : p2 ,
//     k3 : p3
//  }

//   fun functionParam2(p1=10 , p2 = 2 , p3 = 3) =
//  {
//     k1 : p1 ,
//     k2 : p2 ,
//     k3 : p3
//  }
 
//  ---
// {
// k1 : functionParam1(10) , 
// k2 : functionParam1(10 , 20) , 
// k3 : functionParam1(10 , 20 , 30),

// k4 : functionParam2(100 ),
// k5 : functionParam2(100 , 200 ),
// k6 : functionParam2(100 , 200 , 300)
// }

