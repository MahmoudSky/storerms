-- CREATE DATABASE InventorySystem;
/* NOTE THAT:- no relation was written in the SQL Code until the testing phase passes */
/* users table which will be modified in later versions to include more information */
CREATE TABLE users (
  id INT NOT NULL,
  name VARCHAR(128) NOT NULL,
  username VARCHAR(64) NOT NULL UNIQUE,
  /* not using the password word as in some DB they might get confilicted with what password keywords */
  user_password VARCHAR(256) NOT NULL,
  user_type_id INT NOT NULL DEFAULT 0,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by INT NOT NULL DEFAULT 0,
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_by INT NOT NULL DEFAULT 0,
  CONSTRAINT PK_user PRIMARY KEY (id)
);

/* user type (Admin, sales, hr, etc)*/
CREATE TABLE user_types (
  id INT NOT NULL,
  name VARCHAR(64) NOT NULL UNIQUE,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by INT NOT NULL DEFAULT 0,
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_by INT NOT NULL DEFAULT 0,
  CONSTRAINT PK_user_type PRIMARY KEY (id)
);

/* user type prmissions:- what each user type is able to do and what he is not able to do */
CREATE TABLE user_type_permissions (
  user_type_id INT NOT NULL,
  permission_name VARCHAR(64) NOT NULL,
  permission_value INT NOT NULL DEFAULT 0,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by INT NOT NULL DEFAULT 0,
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_by INT NOT NULL DEFAULT 0,
  CONSTRAINT PK_user_type_permissions PRIMARY KEY (user_type_id, permission_name)
);

/* category for the inventrory and items */
CREATE TABLE item_category (
  id INT NOT NULL,
  name VARCHAR(64) NOT NULL UNIQUE,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by INT NOT NULL DEFAULT 0,
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_by INT NOT NULL DEFAULT 0,
  CONSTRAINT PK_item_category PRIMARY KEY (id)
);

/* items in the inventory itself */
CREATE TABLE items (
  id INT NOT NULL,
  name VARCHAR(64) NOT NULL UNIQUE,
  /* rethink about this one */
  quantity INT NOT NULL DEFAULT 0,
  price FLOAT NOT NULL DEFAULT 0,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by INT NOT NULL DEFAULT 0,
  modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_by INT NOT NULL DEFAULT 0,
  CONSTRAINT PK_items PRIMARY KEY (id)
);
