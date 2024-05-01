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

//-----------------------------------------------------------------------------
//pluck

//  %dw 2.0 
//  output application/json
// ---

// {   
//      "key1": "value1" ,
//     "key2": "value2"
// }
// pluck {
//     ($$$): {
//         ($$): $
//     }
// }

//-----------------------------------------------------------------

//read function 

// %dw 2.0
// output application/xml
// ---
// read('{ "hello" : "world" }','application/json')

//  %dw 2.0 
//  output application/json
// var readXML  = read(
//     "
//     <student>
//     <name>Bharat chim</name>
//     <id>466</id>
//     </student>
//     " , "application/xml"
// )
// ---
// readXML.student pluck $ 
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
//Coersion:

// %dw 2.0 
// output application/json
// ---
// {
// "key1" : "22" as Number ,
// "key2": 12.3 as String {format: "##"} as Number ,
// "key3": 12.32596 as String {format: "##.##"} as Number ,
// "key4": "2025-07-09" as Date as String {format: "dd-MMM-yy" , locale: "in"}
// }
//--------------------------------------------------------------------------
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