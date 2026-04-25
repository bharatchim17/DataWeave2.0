%dw 2.0
output application/java
var messageValues = vars.payloadDeserialized map value: $.payload
var messageAttributes = payload.attributes map (item) ->
	attributes:
		item filterObject (objItem, objKey) ->
			["key", "creationTimestamp", "partition", "offset"] contains objKey as String
---
(messageValues zip messageAttributes) map (item) -> do {
	var attrObj = {(item.attributes)}
	---
	{
		attributes: attrObj,
		value: {(item.value)} ++ {
			messageKey: attrObj.key,
			messagePublishedTS: attrObj.creationTimestamp,
			topicPartition: attrObj.partition,
			topicPartitionOffset: attrObj.offset
		}
	}
}