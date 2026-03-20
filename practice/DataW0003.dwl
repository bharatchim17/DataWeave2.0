////////////////////////////////////////////////////////

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

//payload-02:- Dataweave orderBy and filterfunction.
// [
// {
//     "name" : "Virat" ,
//     "age"  : "19"
// },
// {
//     "name" : "Rahul" ,
//     "age"  : "24"
// },
// {
//     "name" : "Akshay" ,
//     "age"  : "20"
// }

// ]

// %dw 2.0
// output application/json
// ---
// payload filter ((item, index) -> item.age >= 20 )
// payload filter $.age >= 20
// payload filter ((item, index) -> item.name == "Virat")

// payload orderBy ((item, index) -> - item.age )
// payload orderBy  ($.age)


//Even Odd in DataWeave

// %dw 2.0
// output application/json
// var arr = [1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 ,10]
// ---
// {
//     "Even" : arr filter (( $ mod 2) == 0 ),
//     "Odd"  : arr filter !(($ mod 2) == 0)
// }

// {
//     "Even" : arr filter isEven($) ,
//     "Odd"  : arr filter isOdd($)
// }

// Filter function
// %dw 2.0
// output application/json
// ---
// [11 , 22 , 33 , 44] filter ((item, index) -> item > 22 )

// [80 , 11 , 20 , 60 , 5 , 66 , 77] filter (($$ > 1) and
// ($ >= 50)
//  )


//pluck function
// %dw 2.0
// output application/json

// var  obj = 
// {
//     "name" : "Sachin" ,
//     "age"  : 40 ,
//     "Tech" : "java" ,
//     "City" : "New Delhi"
// }
// ---

// obj pluck 
// {
//     "Name" : obj.name ,
//     "Technology" : obj.Tech
// }

// obj pluck 
// {
//     "index" : $$$ ,
//     "keys"  : $$ ,
//     "value" : $ 
// }
//////////////////////////////////////////////////////////////////////////////////////////

//Map function
//payload-03:-

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

///////////////////////////////////////////////////////////////////////////////////////////////////
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
///////////////////////////////////////////////////////////////////////////