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
UPDATE athlete 
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
Returns only the lines where id is different than 1, `!=` could be replaced with `<>`.
```postgresql
SELECT *
  FROM table_name
  WHERE param1 LIKE '%param1'
```
To filter text we can use `%` or `_` operators, but they only work with `LIKE` operator, and will not function with `=` comparisons.

`%` - any text

`_` - any single character 

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
- [] SELECT operations with filters
    - [x] Specific columns
    - [x] Text filters
    - [ ]
    - [ ] AND / OR operators
- [ ] Data and key relations
- [ ] Using CASCADE
- [ ] JOIN operations

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

Project Link: [https://github.com/P-py/CineSearch](https://github.com/P-py/CineSearch)

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