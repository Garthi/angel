CREATE TEMPORARY TABLE numbas (
  i int NOT NULL UNIQUE,
  parent int,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY(i)
);