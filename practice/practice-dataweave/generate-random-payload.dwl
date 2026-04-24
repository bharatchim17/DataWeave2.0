%dw 2.0
output application/json
import * from dw::core::Strings
import * from dw::core::Periods
---
(1 to 10) as Array map (value) -> do {
    var orderCreatedTS = ((randomInt(24) + 2000) ++ "-"
                           ++ ((randomInt(11) + 1) as String {format: "00"}) ++ "-"
                           ++ ((randomInt(27) + 1) as String {format: "00"})) as Date
                           + (randomInt(3) match {
                               case 0 -> |P0D|
                               case 1 -> |P1D| 
                               case 2 -> |P2D|
                               case 3 -> |P3D|
                           }) ++ "T"
                           ++ randomInt(23) as String {format: "00"} ++ ":"
                           ++ randomInt(59) as String {format: "00"} ++ ":"
                           ++ randomInt(23) as String {format: "00"} ++ "."
                           ++ randomInt(999) as String {format: "000"} ++ "Z"
    var orderState = randomInt(4) match {
            case 0 -> "In Progress"
            case 1 -> "Preparation for Shipment"
            case 2 -> "Shipped"
            case 3 -> "Delivered"
        }
    ---
    {
        "orderId": randomInt(899) + 100 ++ "-" ++ randomInt(899999999) + 10000000,
        "orderCreatedTS": orderCreatedTS,
		"customerEMailAddress": "email" ++ ((randomInt(99) + 1) as String {format: "00"}) ++ "@domain"
                                        ++ ((randomInt(99) + 1) as String {format: "00"}) ++ ".com",
        "positions": (1 to randomInt(9) + 1) as Array map (posValue, posIndex) -> {
            "positionId": posIndex + 1,
            "itemId": randomInt(8999999) + 1000000,
            "quantity": randomInt(5) + 1
        },
        "orderState": orderState,
        "orderUpdatedTS": if (orderState == "In Progress") null
                            else orderCreatedTS + seconds(randomInt(604800))
    }
}
