
DROP DATABASE offtheblockchain;
CREATE DATABASE offtheblockchain;
\connect offtheblockchain

\i otbc-schema.sql



DROP DATABASE otbc_test;
CREATE DATABASE otbc_test;
\connect otbc_test

\i otbc-schema.sql
