
-- 添加超级管理员用户
insert into t_users(username,userpwd,user_role,useremail,registertime)
values('root','123456','0','123456@qq.com',now());

-- 添加管理员用户
insert into t_users(username,userpwd,user_role,useremail,registertime)
values('admin1','123456','1','123456@qq.com',now());
insert into t_users(username,userpwd,user_role,useremail,registertime)
values('admin2','123456','1','123456@qq.com',now());
insert into t_users(username,userpwd,user_role,useremail,registertime)
values('admin3','123456','1','123456@qq.com',now());

-- 添加普通用户
insert into t_users(username,userpwd,user_role,useremail,registertime)
values('user1','123456','2','123456@qq.com',now());
insert into t_users(username,userpwd,user_role,useremail,registertime)
values('user2','123456','2','123456@qq.com',now());
insert into t_users(username,userpwd,user_role,useremail,registertime)
values('user3','123456','2','123456@qq.com',now());
insert into t_users(username,userpwd,user_role,useremail,registertime)
values('user4','123456','2','123456@qq.com',now());
insert into t_users(username,userpwd,user_role,useremail,registertime)
values('user5','123456','2','123456@qq.com',now());
insert into t_users(username,userpwd,user_role,useremail,registertime)
values('user6','123456','2','123456@qq.com',now());
insert into t_users(username,userpwd,user_role,useremail,registertime)
values('user7','123456','2','123456@qq.com',now());


