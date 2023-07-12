# SQL Data Analysis Project: Rockbuster

## Background:
Rockbuster Stealth is a fictional movie rental company that used to have stores worldwide.  Facing stiff competition from streaming services such as Netflix and Amazon Prime, the Rockbuster Stealth management team is planning to use its existing movie licenses to launch an online video rental service in order to stay competitive.  
## Goal:
Provide data-driven answers that can be used for their 2020 company strategy, which includes the launch of the new online video service.
## Key Business Questions:
* Which movies contributed the most/least to revenue gain?
* What was the average rental duration for all videos?
* Which countries are Rockbuster customers based in?
* Where are customers with a high lifetime value based?
* Do sales figures vary between geographic regions?

## Process:
* Create data dictionary for Rockbuster ERD
* Clean data
  - Remove duplicate or irrelevant observations
  - Fix structural errors
  - Filter unwanted outliers
  - Handle missing data
  - Validate data
* Determine summary and descriptive statistics for key variables
* Use subqueries and common table expressions to answer business questions
* Create visualizations in Tableau of results
  - Link to visualizations: [Rockbuster Visuals](https://public.tableau.com/app/profile/erin.swift/viz/RockbusterCustomerCountry/CustomersbyCountry)

## Script Summary
* [Customer Lifetime Value](CustLifetimeVale.sql):  List of all customers, ranked by their lifetime value in descending order
* [Number of Customers by Country](CustperCountry.sql): List of the number of customers per country, ranked in descending
* [Top Five Customers per Country using Subquery and CTE](TopFivePerCountrySQandCTE.sql): List of total customers and customers in the top 5 per country using subqueries and CTE
* [Top Five Customers per Country using CTE](TopFivePerCountryCTE.sql): List of total customers and customers in the top 5 per country using CTE
