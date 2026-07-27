create table users(username varchar(50) not null primary key,password varchar(500) not null, enabled boolean not null);
create table authorities(username varchar(50) not null primary key,authority varchar(50) not null, constraint fk_authorities_users foreign key(username) references users(username));
create unique index ix_auth_username on authorities (username, authority);


INSERT IGNORE INTO `users` VALUES ("user", "{noop}EazyBytes@12345", "1");
INSERT IGNORE INTO `authorities` VALUES ("user", "read");

INSERT IGNORE INTO `users` VALUES ("admin", "{bcrypt}$2a$12$Juvgfd4tFLdszR0GKR3HXeNIsKUkr.k6S2X/ai67TA1KXfs3C/JMi", "1");
INSERT IGNORE INTO `authorities` VALUES ("admin", "admin");


CREATE TABLE `customer` (
                       `id` int NOT NULL AUTO_INCREMENT,
                       `email` varchar(45) NOT NULL,
                       `pwd` varchar(200) NOT NULL,
                       `role` varchar(45) NOT NULL,
                        PRIMARY KEY (`id`)
);

INSERT  INTO `customer` (`email`, `pwd`, `role`) VALUES ('happy@example.com', '{noop}EazyBytes@12345', 'read');
INSERT  INTO `customer` (`email`, `pwd`, `role`) VALUES ('admin@example.com', '{bcrypt}$2a$12$Juvgfd4tFLdszR0GKR3HXeNIsKUkr.k6S2X/ai67TA1KXfs3C/JMi', 'admin');