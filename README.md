# Volunteer Database (Week 3 Ruby Project)

#### By Jonathon Kang

## Description

Exercise in Ruby, Sinatra, and Postgres/SQL for setting up a SQL database for a fictional non-profit. Allows CRUD functionality for volunteers and projects. Volunteers and projects are arranged in a one-to-many table setup within the SQL database.

## Setup/Installation Requirements
You must have Postgres installed. Clone the directory and run the database setup instructions below. Open your Ruby terminal and run $ bundle, followed by $ ruby app.rb. Open a web browser and navigate to /localhost:4567.

### PSQL commands
1. CREATE DATABASE volunteer_tracker;
2. CREATE TABLE projects (id serial PRIMARY KEY, name varchar)
3. CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int)
4. CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker_test

## Technologies Used

HTML/CSS
Bootstrap
Ruby
Sinatra
Postgres/SQL

### License

Copyright 2017 Jonathon Kang

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
