CREATE TABLE `order_headers` (
  `orderId` char(14) NOT NULL,
  `orderCreatedTS` datetime(3) NOT NULL,
  `customerEMailAddress` varchar(70) NOT NULL,
  `orderState` varchar(25) NOT NULL,
  `orderUpdatedTS` datetime(3) DEFAULT NULL,
  `muleCorrelationId` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order_positions` (
  `orderId` char(14) NOT NULL,
  `positionId` smallint unsigned NOT NULL,
  `itemId` mediumint unsigned NOT NULL,
  `quantity` smallint unsigned NOT NULL,
  `muleCorrelationId` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order_cancellations` (
  `orderId` char(14) NOT NULL,
  `orderCanceledTS` datetime(3) NOT NULL,
  `muleCorrelationId` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `failed_messages` (
  `topicName` varchar(128) NOT NULL,
  `messageKey` varchar(128) NOT NULL,
  `messagePublishedTS` datetime(3) NOT NULL,
  `topicPartition` smallint unsigned NOT NULL,
  `topicPartitionOffset` int unsigned NOT NULL,
  `errorMessage` varchar(256) NOT NULL,
  `muleCorrelationId` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `correlationid_log` (
  `topicName` varchar(128) NOT NULL,
  `muleCorrelationId` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;