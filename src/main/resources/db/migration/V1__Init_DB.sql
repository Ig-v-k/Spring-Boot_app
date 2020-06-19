 create table hibernate_sequence (next BIGINT);
 insert into hibernate_sequence values (1);

# create sequence hibernate_sequence start 1 increment 1;

create table user_role (
                           user_id bigint not null,
                           roles varchar(255)
);

create table usr (
#                      id serial not null,
                     id bigint not null AUTO_INCREMENT,
                     activation_code varchar(255),
                     active boolean not null,
                     user_date varchar(255),
--                       email varchar(255),
                     password varchar(255) not null,
                     username varchar(255) not null,
                     card_number INT not null,
                     room_number INT not null,
                     primary key (id)
);

alter table user_role
    add constraint user_role_user_fk
    foreign key (user_id) references usr(id);

create event my_event1 on schedule every 1 minute do begin update usr set user_date = null where card_number > 1 and room_number > 1; end;

# SELECT cron.schedule('1 * * * *', $$UPDATE usr SET user_date = null WHERE card_number \gr 1'1 minutes'$$)

set global event_scheduler = on;