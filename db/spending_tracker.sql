DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags (
  id SERIAL8 PRIMARY KEY,
  tag VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  spent INT8,
  transaction_time TIMESTAMP(0)
);
