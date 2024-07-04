<!-- Made from this template: See: https://github.com/othneildrew/Best-README-Template/ -->
<!-- Thanks othneildrew!!-->
<a id="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <h3 align="center">PostgreSQL-Basics</h3>
  <p align="center">
    Code repository to demo and store the files from the PostgreSQL course from <a href="https://cursos.alura.com.br/course/introducao-postgresql-primeiros-passos">this Alura course</a>
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<!-- PROJECT SHIELDS -->
<!-- [![ NAME HERE ][ SHIELD URL VAR HERE ]][ URL VARIABLE HERE ] --> 

[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
[![PostgreSQL][postgresql-shield]][postgresql-url]

### Built With

Just some PostgreSQL scripts, learning purpose.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites
* [PostgreSQL][postgresql-url]
* [pgAdmin][pgadmin-url] - or other database visualizer or administration tool

Test the installation running on the [psql](https://www.postgresql.org/docs/current/app-psql.html) or pgAdmin:
```bash
Server [localhost]: # BLANK ENTER
Database [postgres]: # BLANK ENTER
Port [5432]: # BLANK ENTER
Username [postgres]: # BLANK ENTER
Password to the postgres user: # PASSWORD REGISTERED IN THE INSTALLER

psql (16.3)

postgres=#
```
```sql
SELECT NOW();
```
Should return **something like (time will NOT be the same)**:
`"2024-06-28 15:08:59.069911-03"`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

Here are some generic cases of use for the PostgreSQL Basics, but **I do recommend using the complete .sql files in this repo, the list below is proposed only for DOCUMENTATION & STUDY PURPOSES.**

### Creating and deleting databases ([Class 01 file](./Class01-Firststeps.sql))
```sql
CREATE DATABASE test;
DROP DATABASE test;
```
### Listing databases (from psql shell) ([Class 01 file](./Class01-Firststeps.sql))
```sql
postgres=# \l
                                                                      Lista de bancos de dados
   Nome    |   Dono   | Codificaτπo | Provedor de localidade |       Ordenaτπo        |         Ctype          | Localidade ICU | Regras ICU | PrivilΘgios de acesso
-----------+----------+-------------+------------------------+------------------------+------------------------+----------------+------------+-----------------------
 postgres  | postgres | UTF8        | libc                   | Portuguese_Brazil.1252 | Portuguese_Brazil.1252 |                |            |
 template0 | postgres | UTF8        | libc                   | Portuguese_Brazil.1252 | Portuguese_Brazil.1252 |                |            | =c/postgres          +
           |          |             |                        |                        |                        |                |            | postgres=CTc/postgres
 template1 | postgres | UTF8        | libc                   | Portuguese_Brazil.1252 | Portuguese_Brazil.1252 |                |            | =c/postgres          +
           |          |             |                        |                        |                        |                |            | postgres=CTc/postgres
(3 linhas)
```
### PostgreSQL Datatypes ([Class 01 file](./Class01-Firststeps.sql))
- SERIAL - Autoincrementing integer
- VARCHAR - Variable length range char data
- CHAR - Defined length char data
- TEXT - Undefined length range char data
- INTEGER - Typical int type with 4 bytes ranging from -2147483648 to +2147483647
- NUMERIC - Numeric data with user specified precision 
- BOOLEAN
- DATE - Date format including years, months and days
- TIME - Time format including only time metrics
- TIMESTAMP - Time format including year, months, days, hours, minutes, seconds, milliseconds and timezone 

### Creating and deleting tables in a database ([Class 01 file](./Class01-Firststeps.sql))
```postgresql
CREATE TABLE table_name(
  id SERIAL PRIMARY KEY,
  param1 TEXT,
  param2 REAL
  -- other fields
);
SELECT * FROM table_name;
DROP TABLE table_name;
```

### CRUD Operations ([Class 02 file](./Class02-CRUD.sql))
```postgresql
-- Create  
INSERT INTO table_name(param1, param2)
  VALUES ('value_param1', 2.5);
```
```postgresql
-- Read
SELECT * FROM table_name;

SELECT id
  FROM table_name
  WHERE param1 = 'value_param1';

SELECT id
  FROM table_name
  WHERE param2 = CAST(2.5 AS REAL);

SELECT * FROM table_name
  WHERE (param1, param2) IN (SELECT param1, param2 FROM table_name WHERE param1 = 'param1_value' AND param2 = CAST(2.5 AS REAL));
```
```postgresql
-- Update
UPDATE table_name
	SET param1 = 'new_value_param1', param2 = CAST(5.0 AS REAL)
	WHERE id IN (SELECT * FROM table_name WHERE param2 = CAST(2.5 AS REAL));
```
```postgresql
-- Delete
DELETE FROM table_name
  WHERE id IN (SELECT * FROM table_name WHERE param2 = CAST(5.0 AS REAL))
  RETURNING *;
```

### Selecting specific columns and changing their name presentation ([Class 03 file](Class03-Selectfilters.sql))
```postgresql
SELECT 
  id AS Register,
  param1 AS Title,
  param2 AS "Value of"
  FROM table_name;
```
The double quotes are used to names that have whitespaces.
```postgresql
SELECT *
  FROM table_name
  WHERE id != 1;
```
Returns only the rows where id is different than 1, `!=` could be replaced with `<>`.
```postgresql
SELECT *
  FROM table_name
  WHERE param1 LIKE '%param1'
```
To filter text we can use `%` or `_` operators, but they only work with `LIKE` operator, and will not function with `=` comparisons.

`%` - any text

`_` - any single character 

### Filtering null values ([Class 03 file](Class03-Selectfilters.sql))
```postgresql
SELECT *
	FROM table_name
	WHERE param2 IS NULL;

SELECT *
	FROM table_name
	WHERE param1 IS NOT NULL;
```

### Filters for numeric data ([Class 03 file](Class03-Selectfilters.sql))
We can use all the comparisons operators in the queries, for example: `!= / <>`, `=`, `<`, `<=`, `>`, `>=`. 
```postgresql
SELECT * 
  FROM table_name
  WHERE param2 > CAST(1.5 AS REAL);
```
It is also possible to use BETWEEN to query a specific range of values
```postgresql
SELECT *
  FROM table_name
  WHERE param2 BETWEEN CAST(1.5 AS REAL) AND CAST(2.5 AS REAL);
```

### Keys, constraints and references ([Class 04 file](Class04-Relations.sql))
As said in the [PostgreSQL Docs](https://www.postgresql.org/docs/16/index.html) - "A primary key constraint indicates that a column, or group of columns, can be used as a unique identifier for rows in the table."

Primary keys should always be UNIQUE and NOT NULL, that's what the PRIMARY KEY operator implements in a database entity.

```postgresql
CREATE TABLE table2_name(
  id SERIAL PRIMARY KEY
)
```

It is also possible to compose keys like shown below:
```postgresql
CREATE TABLE table2_name(
  table2_entity_id INTEGER,
  table1_entity_id INTEGER,
  PRIMARY KEY (table2_entity_id, table1_entity_id)
);

INSERT INTO table2_name(table2_entity_id, table1_entity_id) VALUES (1, 1); --Returns successfull query

INSERT INTO table2_name(table2_entity_id, table1_entity_id) VALUES (1, 1); --Primary keys can't be repeated, so this query executed after the query above will return error.

INSERT INTO table2_name(table2_entity_id, table1_entity_id) VALUES (1, 1); --Would return successfull query
```

### Foreign keys and relating different tables
Foreign keys are essential to guarantee that a foreign table entity exists before it is related to in a different table.

To create a foreign key:
```postgresql
CREATE TABLE table2_name(
  id SERIAL PRIMARY KEY,
  table1_entity_id INTEGER,
  param TEXT,
  FOREIGN KEY (table1_entity_id)
    REFERENCES table_name(id)
);

INSERT INTO table2_name(1, 'TEST');
```
### Basic JOINs for selecting a field in a foreign table
```sql
SELECT table2_name.*, table_name.param2
  FROM table2_name  
  JOIN table_name ON table2_name.table1_entity_id = table_name.id

-- Should return
-- id | table1_entity_id | param | param2 |
-- 1  |        1         | TEST  |  5.0   |
```

### Different types of joins (LEFT, RIGHT, CROSS, FULL)
In some cases, rows of the column that doesn't relate to other tables can be hidden in a SELECT query, considering that the're not in the join cases - that example can be observed in the SELECT + JOIN query above, rows in the `table_name` table that aren't related in any rows in `table2_name` won't appear. 

A `LEFT JOIN` considers that the data/row may not exist on the right side (**secondary table of the query, table_name in the case above**) of the query. Visual example from the [W3Schools website](https://www.w3schools.com/sql):

![W3Schools left join example](https://www.w3schools.com/sql/img_left_join.png)

A `RIGHT JOIN` considers that the data/row may not exist on the **main table of the query, table2_name in the case above** of the query. Visual example from the [W3Schools website](https://www.w3schools.com/sql):

![W3Schools right join example](https://www.w3schools.com/sql/img_right_join.png)

_For more examples, please refer to the [PostgreSQL Docs](https://www.postgresql.org/docs/16/index.html)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap
- [x] PostgresSQL first steps
    - [x] Environment config and versions
    - [x] Creating and deleting databases
    - [x] Creating tables and deleting
- [x] CRUD operations
    - [x] Inserting operations
    - [x] Update operations
    - [x] Delete operations
- [x] SELECT operations with filters
    - [x] Specific columns
    - [x] Text filters
    - [x] Numeric, data and boolean filters
    - [x] AND / OR operators
- [x] Data and key relations
    - [x] Primary keys
    - [x] Foreign keys and relations
- [x] JOIN operations
- [ ] Using CASCADE

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are essential in the tech world, especially for beginners like me, they are what makes the open-source and dev world such an amazing place to learn and create. Any contributions you make are appreciated.

If you have a suggestion that would make this better, please fork the repo and create a pull request. Please give the project a star!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Pedro Santos - pedrosalviano170@gmail.com

Project Link: [https://github.com/P-py/PostgreSQL-Basics](https://github.com/P-py/PostgreSQL-Basics)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Nice docs and content related:

* [Curso de PostgreSQL](https://cursos.alura.com.br/course/introducao-postgresql-primeiros-passos)
* [PostgreSQL Docs - Chapter 8: Data types](https://www.postgresql.org/docs/16/datatype.html)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
[postgresql-shield]: https://img.shields.io/badge/PostgreSQL-689dc8?style=for-the-badge&logo=postgresql&logoColor=white
[postgresql-url]: https://www.postgresql.org/
[pgadmin-url]: https://www.pgadmin.org/download/
