CREATE DATABASE simpleapi;

CREATE TABLE `users` (
  `name` varchar(64) NOT NULL,
  `birthday_epoch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `users`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);
COMMIT;
