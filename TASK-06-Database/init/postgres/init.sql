CREATE TABLE todos (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  done BOOLEAN DEFAULT FALSE
);

INSERT INTO todos (title, done) VALUES
('Setup Database PostgresSQL', false);
