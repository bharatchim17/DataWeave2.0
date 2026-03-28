// ------------------------------------------------------------------------------------------------------

//To check media type:
%dw 2.0
output application/json
---
payload.^mediaType

//JSON string:
%dw 2.0
output application/json
---
write(payload , "application/json")


%dw 2.0
output application/json
---
attributes.headers.'x-correlation-id' default ""

%dw 2.0
output application/json
---
attributes.headers.'x-transaction-id' default uuid()


//variable Name: inpPayload 
%dw 2.0 
output application/json
var inpPayload = []
---
inpPayload << payload reduce ((item, accumulator) -> item)

// Set logger message in ""

----------------
#['\n']

#['\n']
----------------