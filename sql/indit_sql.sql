create database linux_website;

CREATE TABLE t_users(
userid int not null auto_increment primary key,
username varchar(32) not null unique,
userpwd varchar(64) not null,
user_role int not null default 1,
useremail varchar(32) not null,
registertime datetime default now()
);

insert into t_users(username,userpwd,user_role,useremail,registertime)
values('root','123456','0','123456@qq.com',now());

CREATE TABLE t_materials(
materialsid int not null auto_increment primary key,
materialsname varchar(255) not null unique,
addtime datetime default now()
);

CREATE TABLE `t_experiment` (
  `experimentid` int(11) NOT NULL AUTO_INCREMENT,
  `experimentname` varchar(255) NOT NULL DEFAULT '',
  `experimentbody` varchar(1024) NOT NULL DEFAULT '',
  `experimentfile` varchar(255) DEFAULT '',
  `starttime` datetime DEFAULT CURRENT_TIMESTAMP,
  `finishtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `addtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`experimentid`),
  UNIQUE KEY `experimentname` (`experimentname`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `t_evaluate` (
  `evaluateid` int(11) NOT NULL AUTO_INCREMENT,
  `evaluatename` varchar(255) NOT NULL DEFAULT '',
  `choosenum` int(11) DEFAULT 0,
  `chooselist` varchar(255) DEFAULT '',
  `vacantnum` int(11) DEFAULT 0,
  `vacantlist` varchar(255) DEFAULT '',
  `judgenum` int(11) DEFAULT 0,
  `judgelist` varchar(255) DEFAULT '',
  `shortanswernum` int(11) DEFAULT 0,
  `shortanswerlist` varchar(255) DEFAULT '',
  `addtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`evaluateid`),
  UNIQUE KEY `evaluatename` (`evaluatename`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `t_choose` (
  `chooseid` int(11) NOT NULL,
  `choosebody` varchar(512) NOT NULL DEFAULT '',
  `choosea` varchar(255) DEFAULT '',
  `chooseb` varchar(255) DEFAULT '',
  `choosec` varchar(255) DEFAULT '',
  `choosed` varchar(255) DEFAULT '',
  `chooseanswer` varchar(2) DEFAULT '',
  `addtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`chooseid`),
  UNIQUE KEY `chooseid` (`chooseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_vacant` (
  `vacantid` int(11) NOT NULL,
  `vacantbody` varchar(512) NOT NULL DEFAULT '',
  `vacantanswer` varchar(255) DEFAULT '',
  `addtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacantid`),
  UNIQUE KEY `vacantid` (`vacantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_judge` (
  `judgeid` int(11) NOT NULL,
  `judgebody` varchar(512) NOT NULL DEFAULT '',
  `judgeanswer` varchar(2) DEFAULT '',
  `addtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`judgeid`),
  UNIQUE KEY `judgeid` (`judgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_shortanswer` (
  `shortanswerid` int(11) NOT NULL,
  `shortanswerbody` varchar(1024) NOT NULL DEFAULT '',
  `shortansweranswer` varchar(1024) DEFAULT '',
  `addtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`shortanswerid`),
  UNIQUE KEY `shortanswerid` (`shortanswerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluateid` int(11) NULL,
  `evaluatename` varchar(255) NULL,
  `userid` int(11) DEFAULT '0',
  `username` varchar(32) DEFAULT '',
  `score` int(11) DEFAULT '0',
  `addtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;