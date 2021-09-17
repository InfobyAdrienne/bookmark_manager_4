CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
-- saved adding the new column after it had been done in terminal 
ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);

