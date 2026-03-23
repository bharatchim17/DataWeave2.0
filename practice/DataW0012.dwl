//Index "0", "1" depends on route order:
{
  "0": {
    "payload": {
      "name": "Bharat",
      "id": 101
    }
  },
  "1": {
    "payload": {
      "orderId": "ORD123",
      "amount": 500
    }
  },
  "2": {
    "payload": {
      "status": "PAID"
    }
  }
}

// DataWeave to Aggregate:
%dw 2.0
output application/json
---
{
  customer: payload."0".payload,
  order: payload."1".payload,
  payment: payload."2".payload
}

// Better (dynamic way):
%dw 2.0
output application/json
---
{
  customer: payload.*payload[0],
  order: payload.*payload[1],
  payment: payload.*payload[2]
}