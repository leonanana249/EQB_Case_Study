# EQB_Case_Study
## Purpose 
This case aims to calculate total predicted loss of loan volumes in 2016 and analyze factors that can impact predicted loss rates. 

## Data Source Analysis 
The datasets are provided with two tables as below. The goal is to calculate total predicted loss in 2016 by sumproduct of Total_Loan_Value_Originated and Expected_Losses rate with reporting date in 2016.
However, the two tables don't have a single unique identifer as the reporting date and portfolio have to be applied together to locate the expected_loss rate in a given period. 
![image](https://user-images.githubusercontent.com/107721712/211467491-53434704-fefc-46f8-b654-284c69346ce8.png)

## Tools 
Python and SQL are used to compare the result. 

## ETL Process 
Python: 
1. Load Data into tables 
2. Create a unique indentifer "Index"
3. Join two tables by "Index" 
4. Calculate Expected Loss for each reporting date 
5. Filter 2016 expected loss 
6. Total predicted loss in 2016 

Benefits: the model can be used to apply to different portfolios and different year with output ready to be shared. Python can leverage with SQLALCHEMY to upload to SQL Server as well. 

SQL: 
1. Create tables 
2. Load data into SQL
3. Join two tables by reporting date and portfolio 
4. Calculate 2016 total predicted loss 
Benefits: a shorter coding process. 

## Results 
The Total Predicted Loss in 2016 is $ 117,308,934.20 

Python Output: Predicted_Losses.csv </b>
![image](https://user-images.githubusercontent.com/107721712/211469513-71f80636-7877-4705-ab94-c00aaf44b74c.png)</b>

![image](https://user-images.githubusercontent.com/107721712/211469640-d258a1c0-ad26-4eea-8166-5a4d28a34d3a.png)</b>
