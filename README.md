# Exploring Artistic Masterpieces: Analyzing the Famous Paintings Dataset Using SQL

### Introduction

The "Famous Paintings Analysis SQL" project explores a comprehensive dataset of renowned artworks and museums, sourced from Kaggle. The project's aim is to leverage SQL to uncover insights and patterns within the dataset, offering a deeper understanding of various aspects of famous paintings, museums, and artists. Through rigorous data analysis and querying, this project highlights significant trends and provides valuable insights into the art world.

### Problem Statement

This project addresses a range of analytical questions related to the famous paintings and museum dataset. The goal is to extract meaningful insights through SQL queries to understand the distribution of paintings, the performance of museums, and the prominence of artists. Key problems include identifying paintings not displayed in museums, analyzing price discrepancies, determining popular painting styles, and investigating museum operations.

### Objectives

- **Data Management:** Efficiently ingest, clean, and manage the dataset using SQL to ensure data integrity and accessibility.
- **Analytical Insights:** Formulate and execute SQL queries to answer specific questions about paintings, museums, and artists.
- **Trend Analysis:** Analyze trends related to painting prices, styles, museum operations, and geographical distribution.
- **Data Quality Improvement:** Identify and rectify data issues such as duplicates and invalid entries.

### Dataset Overview

The dataset used for this project includes information about famous paintings, museums, artists, and related metadata. It is composed of multiple CSV files:

- **artist:** Details about artists, including their names and nationalities.
- **canvas_size:** Information about different canvas sizes used for paintings.
- **image_link:** Links to images of the paintings.
- **museum_hours:** Operating hours of various museums.
- **museum:** Information about museums, including their names, locations, and contact details.
- **product_size:** Details about the sizes and prices of paintings.
- **subject:** Information about the subjects of the paintings.
- **work:** Metadata related to individual paintings.
  
**Link of the dataset:** [Kaggle Dataset](https://www.kaggle.com/datasets/mexwell/famous-paintings?resource=download) 
**Entity Relationship Diagram** 
!(https://github.com/binoy-patra/Famous-Paintings-Analysis-with-SQL/blob/main/ERD.jpg)

### Tools

- **Python:** Used for scripting and automating the data ingestion process from CSV files into the SQL database.
- **SQL:** Employed for querying the database and performing data analysis to extract insights.
- **pgAdmin 4:** A web-based interface used to manage the PostgreSQL database, run SQL queries, and visualize the data.

### Methodology

1. **Data Acquisition and Preparation:**
   - **Dataset Source:** Downloaded the dataset from Kaggle, which includes multiple CSV files related to famous paintings and museums.
   - **Data Files:** Consisted of detailed CSV files for artists, canvas sizes, image links, museum hours, museums, product sizes, subjects, and works.

2. **Data Ingestion and Database Setup:**
   - **Python Scripting:** Utilized Python scripts to automate the loading of CSV files into a PostgreSQL database using the `psycopg2` library.
   - **Database Creation:** Created tables in the PostgreSQL database to store the imported data, ensuring proper schema design and normalization.

3. **Data Upload:**
   - **CSV to SQL:** Loaded the data from CSV files into the database tables, handling any discrepancies and ensuring accurate data mapping.

4. **Data Analysis and Querying:**
   - **SQL Queries:** Formulated and executed a series of SQL queries to address the specific analytical problems outlined in the project.
   - **Query Execution:** Used pgAdmin 4 to run SQL queries, analyze results, and derive insights from the dataset.

5. **Data Quality Improvement:**
   - **Duplicate Removal:** Identified and deleted duplicate records from relevant tables to ensure data accuracy.
   - **Invalid Data Handling:** Addressed and corrected invalid entries, such as incorrect city information and erroneous museum hours.

### Business Probles to Solved

1) Fetch all the paintings which are not displayed on any museums?
2) Are there museuems without any paintings?
3) How many paintings have an asking price of more than their regular price? 
4) Identify the paintings whose asking price is less than 50% of its regular price
5) Which canva size costs the most?
6) Delete duplicate records from work, product_size, subject and image_link tables
7) Identify the museums with invalid city information in the given dataset
8) Museum_Hours table has 1 invalid entry. Identify it and remove it.
9) Fetch the top 10 most famous painting subject
10) Identify the museums which are open on both Sunday and Monday. Display museum name, city.
11) How many museums are open every single day?
12) Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)
13) Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist)
14) Display the 3 least popular canva sizes
15) Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?
16) Which museum has the most no of most popular painting style?
17) Identify the artists whose paintings are displayed in multiple countries
18) Display the country and the city with most no of museums. Output 2 seperate columns to mention the city and country. If there are multiple value, seperate them with comma.
19) Identify the artist and the museum where the most expensive and least expensive painting is placed. Display the artist name, sale_price, painting name, museum name, museum city and canvas label
20) Which country has the 5th highest no of paintings?
21) Which are the 3 most popular and 3 least popular painting styles?
22) Which artist has the most no of Portraits paintings outside USA?. Display artist name, no of paintings and the artist nationality.


### SQL Code Overview

- **SQL Script File:** All SQL queries used in the project are contained within the provided `.sql` file. This file includes solutions to various analytical problems related to the famous paintings and museum dataset.

- **Code Summary:**
  - **Data Retrieval:** Queries to fetch data about paintings, museums, and artists, such as identifying paintings not displayed in museums and finding museums with invalid city information.
  - **Aggregation and Analysis:** Queries for counting, ranking, and aggregating data, such as determining the most expensive paintings, the top museum based on the number of paintings, and the most popular painting styles.
  - **Data Cleaning:** Queries for removing duplicate records and handling invalid entries in the dataset.
  - **Advanced Analysis:** Complex queries for identifying trends, such as the top 5 most popular museums, the country with the 5th highest number of paintings, and artists with paintings displayed in multiple countries.

### Key Sections in the SQL Script:

1. **Data Filtering and Selection:** 
   - Queries that filter and select data based on specific criteria.

2. **Aggregation and Ranking:**
   - Aggregations and rankings to analyze data distribution and popularity.

3. **Data Cleaning and Validation:**
   - Scripts for data cleaning, handling duplicates, and validating data integrity.

4. **Complex Queries:**
   - Advanced queries involving multiple joins, subqueries, and ranking functions to extract meaningful insights.

### Conclusion

The project "Famous Paintings Dataset Analysis" utilized SQL to explore and analyze a comprehensive dataset of renowned artworks and associated museum data. Through the execution of various queries, significant insights were derived, shedding light on multiple facets of the dataset.

**Key Findings:**
- **Uncovered Insights:** The analysis revealed crucial information about paintings, such as those not displayed in museums and those with asking prices exceeding their regular prices. Notable trends in painting styles, canvas sizes, and popular subjects were also identified.
- **Museum Analysis:** Insights into museum operations were gained, including those open on specific days, museums with invalid city data, and the most popular museums based on the number of paintings.
- **Artist and Painting Trends:** The project highlighted the most prolific artists and the most expensive and least expensive paintings, offering valuable information for stakeholders in the art world.

**Impact:**
The findings from this project provide a deeper understanding of the dataset, revealing patterns and trends that can inform decisions related to museum operations, artwork valuation, and art collection strategies. The insights gained can assist museums in optimizing their exhibitions and artists in understanding market trends.

**Future Work:**
Future analyses could explore additional aspects of the dataset, such as trends in artwork styles over time or a more detailed examination of geographical distribution. Expanding the dataset to include more variables or integrating external data sources could further enhance the insights derived from the analysis.

Overall, the project effectively demonstrated the use of SQL for managing and analyzing complex datasets, yielding valuable insights into the world of famous paintings and museums.
