SELECT *  FROM `mule`.`order_headers`;
SELECT *  FROM `mule`.`order_positions`;
SELECT *  FROM `mule`.`failed_messages`;
SELECT *  FROM `mule`.`order_cancellations`;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM `mule`.`order_headers`;
DELETE FROM `mule`.`order_positions`;
DELETE FROM `mule`.`failed_messages`;
DELETE FROM `mule`.`order_cancellations`;

 ALTER TABLE order_positions MODIFY itemId INT UNSIGNED NOT NULL;

SELECT topicPartition, MIN(topicPartitionOffset) FROM failed_messages GROUP BY (topicPartition) ;

SELECT * FROM order_positions ORDER BY orderId DESC;

SELECT * FROM correlationid_log;

SELECT * FROM order_headers WHERE muleCorrelationId IN (SELECT muleCorrelationId FROM correlationid_log);

-- error-code: 1175. we are using safe update mode and you tried to update a table without a WHERE that 
-- uses a KEY column.  To disable safe mode,edit --> preferences --> sql-editor uncheck safe update and 
-- reconnect or use 'SET SQL_SAFE_UPDATES = 0;'

-- error-truncation: Out of range value for column 'itemId' at row 1 is MININT so,
-- DESCRIBE `mule`.`order_positions`;


-- ALTER TABLE order_positions MODIFY itemId INT UNSIGNED NOT NULL ;

-- Explanation:
-- ALTER TABLE order_positions
-- → Changes the structure of the order_positions table.
-- MODIFY itemId
-- → Modifies the existing itemId column.
-- INT
-- → Sets the datatype of itemId to an integer.
-- UNSIGNED
-- → Allows only positive numbers and zero, negative values are not permitted.
-- NOT NULL
-- → Ensures the column must always contain a value, Empty (NULL) values are not allowed.
-- {
-- Truncation means, data is cut-off or shortened because it exceeds the allowed size or range.

-- ALTER TABLE `mule`.`order_positions`
-- MODIFY itemId BIGINT;

-- SELECT * FROM order_headers WHERE muleCorrelationId IN (SELECT muleCorrelationId FROM correlationid_log);

-- SELECT * FROM order_headers <-- This part selects all columns and records from the order_headers table.
-- WHERE muleCorrelationId IN (...) <-- The WHERE clause filters the records based on the muleCorrelationId 
-- values.
-- SELECT muleCorrelationId FROM correlationid_log <-- This subquery fetches all muleCorrelationId values 
-- stored in the correlationid_log table.

-- }