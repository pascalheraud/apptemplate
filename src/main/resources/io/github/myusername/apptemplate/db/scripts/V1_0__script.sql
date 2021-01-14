create table apptemplate_templatebean (
	id bigserial PRIMARY KEY,
	name text not null
);


-- sample data to be displayed
insert into apptemplate_templatebean(name) values ('apptemplate data 1');
insert into apptemplate_templatebean(name) values ('apptemplate data 2');
insert into apptemplate_templatebean(name) values ('apptemplate data 3');
