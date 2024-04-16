# Bounce Analytics Engineer Challenge: Leveraging DbT for Data Excellence

Welcome to the Bounce Analytics Engineer Challenge! This challenge is designed to assess your proficiency with DbT (Data Build Tool) in solving real-world data problems. You will have the opportunity to demonstrate your capabilities in data modeling, transformation, quality assurance, and applying analytical insights to drive business decisions at Bounce. The challenge is divided into three main parts:

## Part 1: Data Modeling

- Objective: Develop a scalable data model that represents Bounce’s core business entities such as bookings, user interactions and partner stores, with implementation in DbT.
- Data Source Provision: Access to a set of source tables in CSV, emulating Bounce's operational data, will be provided.
- Requirements: Your model should facilitate scalability, efficiency, and in-depth analytical capabilities.

## Part 2: Implementation and Quality Assurance in DbT

- Transformation and Enhancement: Implement necessary data transformations using DbT to clean, aggregate, and enrich the provided raw data and implement the model developed in Part 1.
- Quality and Testing: Establish a suite of tests to ensure the accuracy, integrity, and reliability of your data models and transformations. Document your work thoroughly for clarity and maintainability.

  Note: You can use either Postgres or GCP’s BigQuery to store your data and process transformations

## Part 3: Candidate’s Choice of Focus

Choose one of the following tasks:

- **Option 1**: Web Scraping with Python and Scrapy
  - Develop a web scraper to download data from Numbeo for all available cities, storing the output in JSON or a database. Focus on efficiency, robustness and testing.
- **Option 2**: Implementing a DbT Semantic Layer for Business Metrics
  - Calculate Gross Merchandise Value (GMV) and Cancellation Rate, breaking down by geography, partner stores, and acquisition channels. Focus on DbT implementation and documentation. Note that these should be used to see a specific point in time's value and its cumulative version.
  - Formulas:
    - GMV = sum(reservation amount)
    - Cancellation Rate = canceled reservations / total reservations

Submission Guidelines:

- Document your approach, design choices, and methodologies clearly, including any assumptions made and challenges overcome.
- Provide SQL scripts, DbT project files, and any other relevant documentation in a version-controlled repository.
- Prepare to discuss your submission in a follow-up interview, focusing on how your work can support Bounce's data-driven decision-making processes.

Evaluation Criteria:

- Technical proficiency with DbT and optionally Python and Scrapy.
- Creativity in problem-solving and data modeling.
- Clarity and thoroughness of documentation and testing.
- Ability to derive actionable insights and demonstrate the business impact of your solutions.

This challenge offers a comprehensive platform to showcase your skills and creativity in tackling real-world data problems using state-of-the-art tools and technologies. We look forward to seeing your innovative approaches and discussing how your skills and insights can contribute to Bounce's success.
Good luck!

## Setting up the project

### Pre requisites

- Docker and docker-compose installed
- [dbt](https://docs.getdbt.com/docs/installation) installed

### Steps

1. Clone the repository
2. Run `docker-compose up` to start the database
3. Run `dbt seed` to load the data into the database
4. Done. You can now run `dbt run` to run the models and `dbt test` to run the tests

## Implementation Details

### First Steps

I have added a few files to complement the models and to the models:

- Exchange Rates: Added file with historical information. For the challenge purposes I have kept these constant.
- Celebrities: I have added Basketball players names to check if any of them are present and be aware of them in support. (Social media is relevant these days and tools like Sprinklr help mitigate this)

For this project I decided to go with the [One Big Table(OBT)](https://dataengineering.wiki/Concepts/One+Big+Table) approach to make it easier for domain anaylsis.

### Assumptions

I have not found connection points between the orders and the partner stores as well as customers, so I couldn't add extra information to make other relationships like geographic data, types of partners and so on.

I didn't have time to finish the Semantic Layer properly but manage to get the fields with the data models built.

The branch name is `guenade` .
I have learned using DBT core over the weekend so testing could be better.

### Model

![Lineage Image](lineage.png)

### Testing

In terms of testing I made sure that each model had test to validate( whenever applicable):

- Unique values
- Expected values
- Null values
- Relationships

Also added macro test to have assertion tests to make sure we see values within expected range.

### Results

This model should answer a business questions but could be richer with connections with partner stores so we can do deep dives and figure out the best sources of revenue and how to improve the customer support.
