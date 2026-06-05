use master
go

create login hr_analyst_login with password = 'P@ssw0rd'; -- check_expiration = on, check_policy = on;
create login finance_analyst_login with password = 'P@ssw0rd'; -- check_expiration = on, check_policy = on;
create login sales_analyst_login with password = 'P@ssw0rd'; -- check_expiration = on, check_policy = on;
create login it_analyst_login with password = 'P@ssw0rd'; -- check_expiration = on, check_policy = on;
go

use TechCorp
go

create user hr_analyst_user for login hr_analyst_login;
create user finance_analyst_user for login finance_analyst_login;
create user sales_analyst_user for login sales_analyst_login;
create user it_analyst_user for login it_analyst_login;
go

create schema hr authorization hr_analyst_user;
go
create schema finance authorization finance_analyst_user;
go
create schema sales authorization sales_analyst_user;
go
create schema it authorization it_analyst_user;
go

create role db_hr_read;
create role db_hr_write;
create role db_finance_read;
create role db_finance_write;
create role db_sales_read;
create role db_sales_write;
create role db_it_admin;
go

alter role db_hr_read add member hr_analyst_user;
alter role db_hr_write add member hr_analyst_user;
alter role db_finance_read add member finance_analyst_user;
alter role db_finance_write add member finance_analyst_user;
alter role db_sales_read add member sales_analyst_user;
alter role db_sales_write add member sales_analyst_user;
alter role db_it_admin add member it_analyst_user;
go

grant select on schema::hr to db_hr_read;
grant insert, update, delete on schema::hr to db_hr_write;
grant select on schema::finance to db_finance_read;
grant insert, update, delete on schema::finance to db_finance_write;
grant select on schema::sales to db_sales_read;
grant insert, update, delete on schema::sales to db_sales_write;
grant control on schema::it to db_it_admin;
go