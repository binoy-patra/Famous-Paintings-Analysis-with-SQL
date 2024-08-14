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

