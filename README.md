# Tools Used 
Excel - Data Cleaning 
Mysql - Data Transformation And Data Analysis

# Dataset Information 
invoice_id: A unique identifier for each invoice, likely stored as a string of up to 50 characters.

branch: The branch associated with the transaction, stored as a string of up to 50 characters.

city: The city associated with the transaction, stored as a string of up to 50 characters.

customer_type: Type of customer (e.g., individual, corporate), stored as a string of up to 50 characters.

gender: Gender of the customer, stored as a string of up to 10 characters.

product_line: The line of products associated with the transaction, stored as a string of up to 50 characters.

unit_price: The price of a single unit of the product, stored as a decimal number with a precision of 10 digits and a scale of 2.

quantity: The quantity of products purchased, stored as an integer.

VAT: Value-added tax rate applied to the transaction, stored as a decimal number with a precision of 6 digits and a scale of 4.

total: The total amount of the transaction, including taxes, stored as a decimal number with a precision of 10 digits and a scale of 2.

date: The date of the transaction, stored as a date type.

time: The time of the transaction, stored as a time type.

payment_method: The method of payment used for the transaction, stored as a string of up to 50 characters.

cogs: Cost of goods sold, stored as a decimal number with a precision of 10 digits and a scale of 2.

gross_margin_percentage: Gross margin percentage, stored as a decimal number with a precision of 11 digits and a scale of 9.

gross_income: Gross income generated from the transaction, stored as a decimal number with a precision of 10 digits and a scale of 2.

rating: Customer rating for the transaction, stored as a decimal number with a precision of 2 digits and a scale of 1.


# Bussines Question 
1)What is the count of distinct cities in the dataset?

2)For each branch, what is the corresponding city?

3)What is the count of distinct product lines in the dataset?

4)Which payment method occurs most frequently?

5)Which product line has the highest sales?

6)How much revenue is generated each month?

7)In which month did the cost of goods sold reach its peak?

8)Which product line generated the highest revenue?

9)In which city was the highest revenue recorded?

10)Which product line incurred the highest Value Added Tax?

11)For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."

12)Identify the branch that exceeded the average number of products sold.

13)Which product line is most frequently associated with each gender?

14)Calculate the average rating for each product line.

15)Count the sales occurrences for each time of day on every weekday.

17)Identify the customer type contributing the highest revenue.

18)Determine the city with the highest VAT percentage.

19)Identify the customer type with the highest VAT payments.

20)What is the count of distinct customer types in the dataset?

21)What is the count of distinct payment methods in the dataset?

22)Which customer type occurs most frequently?

23)Which customer type occurs most frequently?

24)Identify the customer type with the highest purchase frequency.

25)Determine the predominant gender among customers.

26)Examine the distribution of genders within each branch.

27)Identify the time of day when customers provide the most ratings.

28)Determine the time of day with the highest customer ratings for each branch.

29)Identify the day of the week with the highest average ratings.

30)Determine the day of the week with the highest average ratings for each branch.
