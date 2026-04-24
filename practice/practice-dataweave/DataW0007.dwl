//--------------------------------------------------------------------------
//payload-04:-

// [
// {
//     "Tech" : "java" ,
//     "Empid": 123   ,
//     "City" : "Delhi"
// },
// {
//     "Tech" : "python" ,
//     "Empid":  124  ,
//     "City" : "pune"
// },
// {
//     "Tech" : "javaScript" ,
//     "Empid":  125  ,
//     "City" : "khamgaon"
// }    
// ]

// %dw 2.0
//  output application/json
//  ---
// payload map ((item, index) ->{
//     "tech" : item.Tech ,
//     "empId": item.Empid ,
//     "city" : item.City
// } )

// payload map{
//        "index": $$ ,
//        "tech" : $.Tech ,
//        "empid": $.Empid ,
//        "city" :  $.City
// }
// ---------------------------------------------------------------
//payload-01:- Array of object to csv.

// [
// {
//  "id" : "1" ,
//  "status": "Active"
// },
// { "id" : "1" ,
//  "status": "Active"
// }
// ]

// %dw 2.0
// output application/csv  separator= "|"
// ---
// payload map ((item, index) -> 
// {
//     "id" : item.id ,
//     "status" : item.status
// })

//payload-02:- Interchange keys and values in Dataweave.
// [
// {
//     "message-01" : "Hello World"
// },    
// {
//     "message-02" : "Hello Mule"
// }
// ]

// %dw 2.0
// output application/json
// ---
// // payload map ((item, index) -> 
// // item mapObject (value, key, index) -> {
// // (value ): key
// // })
//--------------------------------------
//payload:
// [

// {
//     "firstName" : "Sachin" ,
//     "lastName"  : "tendulakar" ,
//     "age"  : 40
// },
// {
//     "firstName" : "rahul" ,
//     "lastName"  : "dravid" ,
//     "age"  : 42
// },
// {
//     "firstName" : "Rohit" ,
//     "lastName"  : "sharma" ,
//     "age"  : 35
// },
// {
//     "firstName" : "hardik" ,
//     "lastName"  : "pandya" ,
//     "age"  : 30
// }
// ]

// %dw 2.0
// output application/json
// ---
// payload map 
// {
//     "name" : $.firstName as String ++  " "  ++ $.lastName as String ,
//     "age"  : $.age   
// }

// payload map ((item, index) ->{
//     "name" : item.firstName as String ++  " "  ++ item.lastName as String ,
//     "age"  : item.age  
// } )
// ----------------------------------------------------------------

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



// %dw 2.0 
// output application/json
// var studentArrayList = 
// [

// {
//     "studentName": "bharat_chim" ,
//     "studentId" : 1 ,
//     "studentLocation" : "mumbai"
// },
// {
//     "studentName": "ajinkya_deshmukh" ,
//     "studentId" : 2 ,
//     "studentLocation" : "pune"
// },
// {
//     "studentName": "sagar_gawai" ,
//     "studentId" : 3 ,
//     "studentLocation" : "khamgaon"
// }

// ]
// ---
// studentArrayList map ((item, index) ->
// {
//     "index" : index ,
//     "studentName" : item.studentName , 
//     "studentId": item.studentId ,
//     "studentLocation" :item.studentLocation
// } )

// studentArrayList map (item, index) ->
// {
//     "index" : index ,
//      "studentName" : item.studentName , 
//     "studentId": item.studentId ,
//     "studentLocation" :item.studentLocation 
// } 

// studentArrayList map 
// {
//    "index" : $$ ,
//    "studentName" : $.studentName , 
//    "studentId": $.studentId ,
//    "studentLocation" :$.studentLocation
// }


// studentArrayList map 
// {
//      ($$) : $
// }


// %dw 2.0
// output application/json
// ---
// [
//     "bharat" ,
//     "ajinkya" ,
//     "sugat"
// ]

//  map ((item, index) ->
// {
//     (index + 1) : item
// } )

// map
// {
//     ($$ + 1) : $
// }

///////////////////////////////////////////////////////////////

// %dw 2.0
// output application/json
// ---
// {
//     "key1" : "value1" ,
//     "key2" : "value2" ,
//     "key3" : "value3" 

// }

// mapObject ((value, key, index) -> 
// {
//     (index + 1): 

//     {
//     (key) : value
//     }
// })

// mapObject 
// {
//     ($$$ + 1):

//     {
//         ($$) : $
//     }
// }

// %dw 2.0
//  output application/json
//  ---
// [10 , 20 , 30 , 40 , 50] map ((item , index) -> {
//     (index): item + 50
// })

// [10 , 20 , 30 , 40 , 50] map {
//     ($$): $ + 50
// }

// [11 , 22 , 33] map ($ + 100)

//map object
//payload-05:-
// {
//     "english_marks" : 45 ,
//     "maths_marks" : 65 ,
//     "physics_marks" : 87
// }


//payload-06:-
// {
//     "Tech" : "JAVA" ,
//     "City" : "New Delhi" ,
//     "Design": "Developer"
// }

// %dw 2.0
// output application/json
//  ---
// [ 
// payload mapObject ((value , key , index)->{
//  index : index,
//  (key) : value 
//  })
// ,
// payload mapObject ((value , key , index)->
//    (index):
//    {
//     (key) : value + 10
//    })  ,
//    payload mapObject ($$$):{
//     ($$): $
// },
// payload mapObject ($$$):{subject: $$ , marks: $}
// ]

//-------------------------------------------------------------------

// filter:- 

//  %dw 2.0 
//  output application/json
// var studentArrayList = 
// [

// {
//     "studentName": "bharat_chim" ,
//     "studentId" : 1 ,
//     "studentLocation" : "mumbai"
// },
// {
//     "studentName": "ajinkya_deshmukh" ,
//     "studentId" : 2 ,
//     "studentLocation" : "pune"
// },
// {
//     "studentName": "sagar_gawai" ,
//     "studentId" : 3 ,
//     "studentLocation" : "khamgaon"
// }

// ]
// ---
// studentArrayList  map 
// {
//     "index" : $$ + 1 ,
//    "studentNam" : $.studentName , 
//    "studentid": $.studentId ,
//    "studentLoc" :$.studentLocation
// } filter($.studentid == 1 and ($.studentLoc startsWith "mu"))


// studentArrayList filter($.studentId == 1 and ($.studentLocation startsWith "mu")) map 
// {
//     "index" : $$ + 1 ,
//    "studentName" : $.studentName , 
//    "studentId": $.studentId ,
//    "studentLocation" :$.studentLocation
// } 

// studentArrayList[0] filterObject 
// (

// (value , key) -> (value startsWith 1) and (key startsWith "s")

// )

//---------------------------------------------------------------------------------------
//  %dw 2.0 
//  output application/json
// var studentArrayList = 
// [

// {
//     "studentName": "bharat_chim" ,
//     "studentId" : 1 ,
//     "studentLocation" : "mumbai"
// },
// {
//     "studentName": "ajinkya_deshmukh" ,
//     "studentId" : 2 ,
//     "studentLocation" : "pune"
// },
// {
//     "studentName": "sagar_gawai" ,
//     "studentId" : 3 ,
//     "studentLocation" : "khamgaon"
// }

// ]
// ---
// studentArrayList filter ($.studentId > 1) map (item, index) -> 
// item filterObject ((value, key, index) -> 
// // value startsWith("")
// // value startsWith("p")
// index == 2)
// -------------------------------------------------------

// studentArrayList  map ((item, index) ->{
//   (item mapObject {
 
// ($):$$

//     })
// } )

// -----------------------------------------------------------
// studentArrayList map (item, index) -> {
// (item mapObject 
// if ($ == "sagar_gawai"){
//     ($$): upper($)
// }
// else {
//     ($$): $
// })}

//-----------------------------------------------------------------

// %dw 2.0
// output application/json
// ---
// {
//     "reduce": [1 , 2 , 3 , 4 , 5 , 89] reduce $  , //89
//     "accumm": [1 , 2 , 3 , 4 , 5 , 89] reduce $$ , //1
//     "concatenate": [1 , 2 , 3 , 4 , 5 , 89] reduce ( $$ ++ $) , //1234589 
//     "addValue": [10 , 20 , 30] reduce ($ + $$) ,
//     "addValue": [10 , 20 , 30] reduce (item  , acc=2) -> acc + item  ,
//     "emptyObject": ([10 , 20 , 30] reduce ((item, accumulator = {}) ->
//     accumulator ++ {
//         "key1": item
//     } ))pluck ((value, key, index) -> value)
// }

// ----------------------------------------------------------------------------------
