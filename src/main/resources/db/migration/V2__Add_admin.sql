insert into usr (id,
                 activation_code,
                 active,
                 user_date,
                 password,
                 username,
                 card_number,
                 room_number) values (1,
                                      1,
                                      true,
                                      1,
                                      '$2a$08$K.OjpDN4PB5s98O69EoOF.I.Sa5iyDGrFWvIwBYKYjCmh93kzf3Ay',
                                      'admin',
                                      1,
                                      1);

insert into user_role (user_id,
                       roles) values (1, 'USER'),
                                     (1, 'ADMIN');