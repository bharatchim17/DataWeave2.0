////////////////////////////////////////////////////////////////////////////
 
//map and mapObject:-

// %dw 2.0 
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