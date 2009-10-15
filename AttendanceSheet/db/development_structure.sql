CREATE TABLE `attendance_types` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL auto_increment,
  `employee_id` int(11) default NULL,
  `signin_datetime` datetime default NULL,
  `signout_datetime` datetime default NULL,
  `attendance_type_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

CREATE TABLE `employee_details` (
  `id` int(11) NOT NULL auto_increment,
  `employee_id` int(11) default NULL,
  `first_name` varchar(255) default NULL,
  `middle_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `address1` varchar(255) default NULL,
  `address2` varchar(255) default NULL,
  `address3` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `zip_code` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `marital_status` varchar(255) default NULL,
  `dob` datetime default NULL,
  `passport_number` varchar(255) default NULL,
  `doj` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE `employee_roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL auto_increment,
  `employee_role_id` int(11) default NULL,
  `user_name` varchar(255) default NULL,
  `crypted_password` varchar(255) default NULL,
  `salt` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

CREATE TABLE `employees_groups` (
  `group_id` int(11) default NULL,
  `employee_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20091012154512');

INSERT INTO schema_migrations (version) VALUES ('20091012154650');

INSERT INTO schema_migrations (version) VALUES ('20091012155741');

INSERT INTO schema_migrations (version) VALUES ('20091012160702');

INSERT INTO schema_migrations (version) VALUES ('20091012162534');

INSERT INTO schema_migrations (version) VALUES ('20091012164008');

INSERT INTO schema_migrations (version) VALUES ('20091012164047');