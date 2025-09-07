// ----------------------------------------------------------------------------------
//payload
// {
// "Tittle": "Mr" ,
// "Name": "Bharat Chim" ,
// "Mobile": 9075720192
// }

// %dw 2.0 output application/json
// var countryCode = "+91-" 
// ---
// {
//     "Name": payload.Tittle ++ " " ++ payload.Name ,
//     "Mobile": countryCode ++ payload.Mobile
// }
// ------------------------------------------------------------------------------------
// %dw 2.0 output application/json
// var countryCode = "+91-" 
// fun detail(pay) = 
// {
// "Name": pay.Tittle ++ " "++ pay.Name ,
// "Mobile": countryCode ++ pay.Mobile

// }
// ---
// detail(payload)
// ------------------------------------------------------------------------------------
// %dw 2.0 output application/json
// ---
// ["a" , "b" , "c" , "d" , "e" , "f"] map (value, index) -> {
//     (index): value
// }
// ----------------------------------------------------------------------------

%dw 2.0 output application/json
---
{
    "a": abs(10 * 2)
}