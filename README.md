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

SQL:</b>

![image](https://user-images.githubusercontent.com/107721712/211469640-d258a1c0-ad26-4eea-8166-5a4d28a34d3a.png)</b>

## Factors that can cause the predicted loss rates to change
  Assuming the predicted loss rates are related to each portfolio or loans (mtg, auto or cc) for each period, the total expected credit loss can be derived from the product of Probability of Default (PD), Loss Given Default (LGD) and Exposure at Default (EAD) (ECL = EAD * PD*LGD). Given ECL is the ultimate weighted average of loss, we only focus on the drivers that cause the change in predicted loss rates in this case (PD & LGD). 

### Probability of Default 
PD dedicates the likelihood the borrower loses the financial capability to main scheduled payments. Below are some factors that represent PD: 
•	Credit Score: major credit rating agencies estimate PD and rate with credit scores, which can be derived from economic conditions and other factors. In this given case, the Category field indicates the range of credit scores, so higher score can indicate a lower PD, thus a lower predicted loss rate 
•	Macroeconomic factors: economic growth, interest rate and unemployment rate are the most common economic factors that can cause PD to change. For example, a economic recession, higher interest rate and higher unemployment rate indicate borrowers will more likely face with economic pressure, so it can result in a higher PD for a higher predicted loss rate. 
•	Loan to Value: a higher LTV ratio requires borrowers to pay higher interests, thus a higher predicted loss rate. In some cases, a high LTV can be brought down by a mortgage insurance and thus justify the loss rate. 
•	Total Debit/Gross Debit to Income Ratio: total expenses or gross mortgage expenses against the total income of borrowers can indicate the financial capability of the borrowers to cover expenses. Higher TDS/GDS leads to higher PD thus higher predicted loss rates. 

### Loss Given Default 
LGD is the adjustment for post-default recoveries, such as cash payments, realization of securities or sale of debit. 
•	Size of loans : when other factors remain equal, the higher total loan volumes represent a great risk, so a higher predicted loss rate. 
•	Collaterals: if loans are pledged by collaterals, the borrowers share the risk of LGD, thus a lower predicted loss rate. 
•	Historical trends: LGD is based on an analysis of historical post-default recoveries. The comparable historical predicted loss rate may change the predicted loss rates. 
