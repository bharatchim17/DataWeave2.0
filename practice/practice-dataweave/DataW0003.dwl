//---------------------------------------------------------
//payload-02:- Dataweave orderBy 
// [{
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
// }]

// %dw 2.0
// output application/json
// ---
// payload orderBy ((item, index) -> - item.age )
// payload orderBy  ($.age)

// payload filter ((item, index) -> item.age >= 20 )
// payload filter $.age >= 20
// payload filter ((item, index) -> item.name == "Virat")
// [1 , 20 , 3 , 52 , 80 , 72 , 10] filter ((item) -> item > 50) 


// Filter function
// %dw 2.0
// output application/json
// ---
// [11 , 22 , 33 , 44] filter ((item, index) -> item > 22 )

// [80 , 11 , 20 , 60 , 5 , 66 , 77] filter (($$ > 1) and
// ($ >= 50)
//  )


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


// lambda function

// %dw 2.0 
//  output application/json
//  ---
// () -> 2 + 3
// (() -> 2 + 3)
// (() -> 2 + 3)() as Number
// (() -> 2 + 3)() as String


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

//----------------------------------------------------------------------------

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

//  %dw 2.0
//  output application/json

// var a = read("<prices>
//             <basic> 9.98 </basic>
//             <premium> 53.00 </premium>
//             <vip> 398099 </vip>
//             </prices>" , "application/xml")
//   var b = [
//     {
//         name : "sravan"
//     },
//     {
//         name : "lingam"
//     }
//   ]
//  ---
// a  pluck(value , key , index) ->{
//     prices: value
// }

// a.prices pluck (($$): $)
// a.prices pluck $$

// --------------------------------------------------------------
// %dw 2.0
// output application/json
//  var numberArray = [0, 1, 2, 3, 3, 2, 1, 4]
// ---
// //numberArray orderBy $
// //numberArray orderBy -$
// //(numberArray orderBy -$)[0]
// //numberArray orderBy ((item , index)-> item)
// //numberArray orderBy ((item , index)-> - item)
// //(numberArray orderBy ((item , index)-> - item))[0]
// (numberArray orderBy ((item , index)-> - item))[0 to -1]
// --------------------------------------------------------------------------
//Dataweave core by functions:
// %dw 2.0
// output application/json

// var numberArray = [0, 1, 2, 3, 3, 2, 1, 4]

// var covidObjectArray = [
// {
//   "firstName": "John",
//   "lastName": "Nix",
//   "phone": "541-754-3010",
//   "email": "john@gmail.com",
//   "caseType": "positive"
// },
// {
//   "firstName": "Mike",
//   "lastName": "Tyson",
//   "phone": "789-655-3878",
//   "email": "john@gmail.com",
//   "caseType": "recovered"
// },
// {
//   "firstName": "Jake",
//   "lastName": "Vend",
//   "phone": "655-789-2345",
//   "email": "jake@yahoo.com",
//   "caseType": "positive"
// }
// ]

// ---
// {
	
// 	"a": numberArray distinctBy $,
// 	"c": covidObjectArray distinctBy $.email,
// 	"e": numberArray orderBy $,
// 	"g": covidObjectArray orderBy $.caseType,
// 	"i": numberArray groupBy $,
// 	"k": covidObjectArray groupBy $.caseType,
// 	"m": numberArray joinBy "-",
// 	"n": covidObjectArray.caseType joinBy ","

// }
//////////////////////////////////////////////////////////////////////////////////////////
%dw 2.0
output application/json

var covidObject = {
  "firstName": "Mike",
  //"lastName": "Tyson",
  "phone": "789-655-3878",
  "email": "mike@gmail.com",
  "caseType": "positive"
}

---
{
  "firstName": if(covidObject.firstName != null) covidObject.firstName else "Undefined",
  "lastName": covidObject.lastName default "Undefined",
  "phone": covidObject.phone,
  "email": if(covidObject.email != null) covidObject.email ,
  "caseType": if(covidObject.caseType == "positive") "POS" else if(covidObject.caseType == "recovered")
   "REC" else ""
}


%dw 2.0
output application/json

var covidObject = {
  "firstName": "Mike",
  "lastName": "Tyson",
  "phone": "789-655-3878",
  "email": "",
  "caseType": "Recovered"
} 

---
{
  "firstName": covidObject.firstName,
  "lastName": covidObject.lastName,
  "phone": covidObject.phone,
  "email": covidObject.email,
  "caseType-if-else": if(covidObject.caseType == "positive") "POS" else if(covidObject.caseType == "Recovered")
  "REC" else "",
  "caseType-match": covidObject.caseType match {
  	case "positive" -> "POS"
  	case "Recovered" -> "REC"
  	else -> ""
  }
}
----------------------------------------------------------------------
%dw 2.0 output application/json

 var messageAttributes = payload.attributes map (item) ->
 attributes: 
 item filterObject(objItem, objKey) ->
 ["key", "creationTimestamp", "partition", "offset"] contains objKey as String
 --- 
payload map (item) -> do{
  var attrObj = {(item.attributes)}
  ---
  {
    attributes: attrObj ,
     messageKey: attrObj.key,
      messagePublishedTS: attrObj.creationTimestamp,
      topicPartition: attrObj.partition,
      topicPartitionOffset: attrObj.offset
    
  }
}

payload:
[
  {
    "payload": "\u0000\u0000\u0000\u0000\u0001\u001a180-82108051902007-06-26T14:22:00.830Z(email91@domain09.com\u0002\u0002\ufffdޘ\t\n\u0000\u000eShipped\u0000.2007-07-01T16:01:56.83Z",
    "serByteArray": {
      "inputStream": "\u0000\u0000\u0000\u0000\u0001\u001a180-82108051902007-06-26T14:22:00.830Z(email91@domain09.com\u0002\u0002\ufffdޘ\t\n\u0000\u000eShipped\u0000.2007-07-01T16:01:56.83Z"
    },
    "attributes": {
      "headers": {
        
      },
      "logAppendTimestamp": null,
      "serializedKeySize": 15,
      "offset": 22,
      "serializedValueSize": 106,
      "consumerCommitKey": "60f16abb-b50f-4ade-8cbd-12099f7cd6da",
      "partition": 2,
      "leaderEpoch": 36,
      "creationTimestamp": "2026-04-25T14:15:52.3+05:30",
      "topic": "orders",
      "key": "\"180-821080519\""
    }
  },
  {
    "payload": "\u0000\u0000\u0000\u0000\u0001\u001a722-85747279902013-11-19T13:46:08.267Z(email20@domain30.com\n\u0002\ufffd\ufffd\ufffd\u0005\u0006\u0004\ufffdԡ\u0005\n\u0006\ufffd\ufffd\ufffd\u0002\u0004\b\ufffd\ufffd\ufffd\u0002\u0002\n\ufffd\ufffd\ufffd\u0003\b\u0000\u000eShipped\u000002013-11-24T21:30:03.267Z",
    "serByteArray": {
      "inputStream": "\u0000\u0000\u0000\u0000\u0001\u001a722-85747279902013-11-19T13:46:08.267Z(email20@domain30.com\n\u0002\ufffd\ufffd\ufffd\u0005\u0006\u0004\ufffdԡ\u0005\n\u0006\ufffd\ufffd\ufffd\u0002\u0004\b\ufffd\ufffd\ufffd\u0002\u0002\n\ufffd\ufffd\ufffd\u0003\b\u0000\u000eShipped\u000002013-11-24T21:30:03.267Z"
    },
    "attributes": {
      "headers": {
        
      },
      "logAppendTimestamp": null,
      "serializedKeySize": 15,
      "offset": 23,
      "serializedValueSize": 131,
      "consumerCommitKey": "60f16abb-b50f-4ade-8cbd-12099f7cd6da",
      "partition": 2,
      "leaderEpoch": 36,
      "creationTimestamp": "2026-04-25T14:15:52.316+05:30",
      "topic": "orders",
      "key": "\"722-857472799\""
    }
  },
  {
    "payload": "\u0000\u0000\u0000\u0000\u0001\u001a282-14306732902014-07-14T03:33:16.062Z(email92@domain39.com\n\u0002\ufffd҇\u0001\u0002\u0004\ufffd\ufffd\u0006\u0002\u0006\ufffd\ufffd\ufffd\u0007\u0002\b\ufffdޏ\u0006\n\n\ufffd\ufffd\ufffd\u0005\u0002\u00000Preparation for Shipment\u000002014-07-19T19:26:11.062Z",
    "serByteArray": {
      "inputStream": "\u0000\u0000\u0000\u0000\u0001\u001a282-14306732902014-07-14T03:33:16.062Z(email92@domain39.com\n\u0002\ufffd҇\u0001\u0002\u0004\ufffd\ufffd\u0006\u0002\u0006\ufffd\ufffd\ufffd\u0007\u0002\b\ufffdޏ\u0006\n\n\ufffd\ufffd\ufffd\u0005\u0002\u00000Preparation for Shipment\u000002014-07-19T19:26:11.062Z"
    },
    "attributes": {
      "headers": {
        
      },
      "logAppendTimestamp": null,
      "serializedKeySize": 15,
      "offset": 24,
      "serializedValueSize": 148,
      "consumerCommitKey": "60f16abb-b50f-4ade-8cbd-12099f7cd6da",
      "partition": 2,
      "leaderEpoch": 36,
      "creationTimestamp": "2026-04-25T14:15:52.307+05:30",
      "topic": "orders",
      "key": "\"282-143067329\""
    }
  }
]
-------------------------------------------------------------------------------