CREATE TABLE IF NOT EXISTS todos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  done BOOLEAN DEFAULT FALSE
);

INSERT INTO todos (title, done) VALUES
('Setup Database MariaDB', false);
