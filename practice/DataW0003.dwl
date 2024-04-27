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

//payload-02:- Interchange keys and values in Dataweave.
// [
// {
//     "message-01" : "Hello World"
// },    
// {
//     "message-02" : "Hello Mule"
// }
// ]

%dw 2.0
output application/csv  separator= "|"
---
payload map ((item, index) -> 
{
    "id" : item.id ,
    "status" : item.status
})



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
// // payload filter ((item, index) -> item.age >= 20 )
// // payload filter ((item, index) -> item.name == "Virat" )
// // payload orderBy ((item, index) -> item.age )
// // payload orderBy ($.age)


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

// [
// {
//     name : "Marino" ,
//     age  : 37
// },
// {
//     name : "Shoki" ,
//     age  : 30
// },
// {
//     name : "Tomo" ,
//     age  :  25
// },
// {
//     name : "Ana" ,
//     age  : 29
// }

// ] filter ((item, index) -> item.age >= 30 )

// [80 , 11 , 20 , 60 , 5 , 66 , 77] filter (( $$ > 1 and $ >= 30 ))


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
//     "name" : $.firstName ++ " " ++ $.lastName ,
//     "age"  : $.age   
// }

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
//  payload map ((item, index) ->
//  {
//     "Tech" : item.Tech ,
//     "Empid": item.Empid ,
//     "City" : item.City
//  } )

// payload map 
// {
//        "Index": $$ ,
//        "Tech" : $.Tech ,
//        "Empid": $.Empid ,
//        "City" : $.City
// }

// [11 , 22 , 33] map ($ + 100)

// %dw 2.0
// output application/json
// ---
// [10 , 20 , 30 , 40 , 50] map ((item, index) -> 
// {(index ): item + 50} )


//map object
//payload-05:-
// {
//     "english_marks" : 45 ,
//     "maths_marks" : 65 ,
//     "physics_marks" : 87
// }

// %dw 2.0
//  output application/json
//  ---

//    payload mapObject ((value , key , index)->
//    (index):
//    {
//     key : value + 10
//    })



//payload-06:-
// {
//     "Tech" : "JAVA" ,
//     "City" : "New Delhi" ,
//     "Design": "Developer"
// }

//  %dw 2.0
//  output application/json
//  ---
// [ payload mapObject ((value , key , index)->
//  {
//  (key) : value ,
//  index : index
//  }),
//  payload mapObject ((value , key) ->
//  {

//  }),
//  payload mapObject {($$) : $} ,
 
//  payload mapObject ($$$) : {value: $ , key: $$ , index : $$$}
 
//  ]

