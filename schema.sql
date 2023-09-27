-- Define the movies table
CREATE TABLE movies (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    publish_date DATE,
    archived BOOLEAN,
    genre VARCHAR(255),
    author VARCHAR(255),
    source VARCHAR(255), -- Assuming source is a string, adjust data type if needed
    label VARCHAR(255),
    silent BOOLEAN -- Assuming silent is a boolean, adjust data type if needed
);

-- Define the sources table
CREATE TABLE sources (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);
