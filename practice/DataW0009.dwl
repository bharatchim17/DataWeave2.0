//----------------------------------------------------------------------------
// %dw 2.0 
// import * from dw::Runtime
// var result = []
// output application/json
// ---
// {
//     "k1": "ggv"
// }wait 8000

// if(10 > 0) "Greater than zero" else fail("less than zero")

// if(sizeOf(result) <= 0) fail('Data was empty') else result

//----------------------------------------------------------------------------

// %dw 2.0
// import * from dw::Runtime
// var result = []
// output application/json
// ---
// if(sizeOf(result) <= 0) fail('Data was empty') else result

//----------------------------------------------------------------------------
// %dw 2.0
// import * from dw::core::Arrays

// output application/json
// ---
// // [100 , 200 , 300 , 400 , 500] splitAt 2
// [100 , 200 , 300 , 400 , 500] dropWhile ((item) -> item < 400)



%dw 2.0
output application/json
import * from dw::core::Arrays
var join1 = 
[{
"studentId": 101 ,
"studentName": "bharat chim"
} ,
{
"studentId": 102 ,
"studentName": "arvind chim"
}]

var join2 = 
[{
"studentId": 101 ,
"studentName": "rutuja chim"
} ,
{
"studentId": 102 ,
"studentName": "shubhangi chim"
}]
---
join(join1 , join2 , (join1)-> join1.studentId , (join2)-> join2.studentId)


//-------------------------------------------------------------------------------

// %dw 2.0
// output application/json
// ---
// // [0 , 1 , 2 , 3 , 4 , 5 , 1 , 2 , 3 , 4] distinctBy ((item, index) -> item )
// [0, 1, 2, 3, 3, 2, 1, 4] distinctBy (value) -> { "unique" : value }

//-------------------------------------------------------------------------------

// %dw 2.0
// output application/json
// var readXML = read("<students>
// <studentInfo>Bharat</studentInfo>
// <id>100</id>
// <id>200</id>
// <id>300</id>
// <id>100</id>
// <id>200</id>
// <id>300</id>
// </students>" , "application/xml")
// ---

//     students: {
//         "studentInfo": readXML.students.studentInfo ,
//         "duplicateId": readXML.students.&id distinctBy $
//     }

// ----------------------------------------------------------------