--Autores:
--Quezada Ferreira Fernando
--Novas Santamaría José Manuel

connect sys/system as sysdba

create user qn_proy_admin
identified by admin123
quota unlimited on users;

create user qn_proy_user
identified by user123;

grant
  create session,
  create table,
  create sequence,
  create synonym,
  create view,
  create trigger,
  create procedure 
to qn_proy_admin;

grant create session
to qn_proy_user;

commit;