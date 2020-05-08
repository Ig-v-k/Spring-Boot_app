create table hibernate_sequence (next BIGINT);
insert into hibernate_sequence values (1);
# insert into hibernate_sequence values ( 1 );

# create sequence hibernate_sequence start 1 increment 1;

create table user_role (
                           user_id bigint not null,
                           roles varchar(255)
);

create table usr (
                     id bigint not null AUTO_INCREMENT,
                     activation_code varchar(255),
                     active boolean not null,
                     email varchar(255),
                     password varchar(255) not null,
                     username varchar(255) not null,
                     card_number INT not null,
                     room_number INT not null,
                     primary key (id)
);

alter table user_role
    add constraint user_role_user_fk
    foreign key (user_id) references usr(id);