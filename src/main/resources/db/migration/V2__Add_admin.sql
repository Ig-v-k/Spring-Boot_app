insert into usr (id, username, password, active, email) values (1, 'admin', 'admin1', true, 'lgorvysocky@gmail.com');

insert into user_role (user_id, roles) values (1, 'USER'), (1, 'ADMIN');

# For to the encrypt data,
# someone people say that need to use a api,
# between front-end <-> db, where a role(api),
# will be check validation and pass to continue.

# Or, is a standard function, to use, in the MySQL how -
# AES_ENCRYPT('data', @key)
# AES_DECRYPT(@encrypted, @key)