## bookmark-manager

### Intro

This project will allow users to interact with Bookmarks on the website. It will include:

- Show a list of bookmarks
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks

### User Stories

```
As a User
So that I can see my bookmarks
I want to see a list of bookmarks
```

```
As a User
So that I can customise my bookmarks
I want to be able to add new bookmarks to the list
```

```
As a User
So that I can edit my bookmarks
I want to be able to delete bookmarks from the list
```

```
As a User
So that I can manage my bookmarks
I want to be able to update my bookmarks
```

### To set up the database

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

Connect to the database using the pqsl command \c bookmark_manager;

Run the query we have saved in the file 01_create_bookmarks_table.sql

### Set up the test database 

Make sure to set up the test database using the SQL query saved in db/migrations/01_create_bookmarks_table.sql to create a bookmarks table.

$> psql
admin=# CREATE DATABASE "bookmark_manager_test";
admin=# CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));

### To run the Bookmark Manager app:

```
run rackup
```
```
To view bookmarks, navigate to `localhost:9292/bookmarks`.
```

### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```
