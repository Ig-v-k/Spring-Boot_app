insert into usr (id,
                 activation_code,
                 username,
                 password,
                 active,
                 email,
                 card_number,
                 room_number) values (1,
                                      1,
                                      'admin',
                                      '$2y$08$By93BhTtUkfvVGokKgCLz.TCIDCshiVlnYq2uIIKuPhhBLTL3eYPG',
                                      true,
                                      'lgorvysocky@gmail.com',
                                      1,
                                      1);

insert into user_role (user_id,
                       roles) values (1, 'USER'),
                                     (1, 'ADMIN');

# For to the encrypt data,
# someone people say that need to use a api,
# between front-end <-> db, where a role(api),
# will be check validation and pass to continue.

# Or, is a standard function, to use, in the MySQL how -
# AES_ENCRYPT('data', @key)
# AES_DECRYPT(@encrypted, @key)