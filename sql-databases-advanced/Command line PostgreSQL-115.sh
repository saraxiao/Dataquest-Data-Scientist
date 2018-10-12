## 1. The psql tool ##


psql <<EOF
EOF

## 2. Running SQL queries ##


psql <<EOF
CREATE DATABASE bank_accounts;
EOF

## 3. Special PostgreSQL commands ##


psql <<EOF
\l
EOF

## 4. Switching databases ##


psql -d bank_accounts <<EOF
CREATE TABLE deposits (
    id integer PRIMARY KEY,
    name text,
    amount float
);
EOF

## 5. Creating users ##


psql <<EOF
CREATE ROLE sec WITH LOGIN CREATEDB PASSWORD 'test';
EOF

## 6. Adding permissions ##


psql -d bank_accounts <<EOF
GRANT ALL PRIVILEGES ON deposits TO sec;
EOF

## 7. Removing permissions ##


psql -d bank_accounts <<EOF
REVOKE ALL PRIVILEGES ON deposits FROM sec;
EOF

## 8. Superusers ##


psql <<EOF
CREATE ROLE aig WITH LOGIN PASSWORD 'test' SUPERUSER;
EOF