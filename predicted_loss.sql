-- Creating tables 
CREATE TABLE origination_volumes (
     Reporting_Date DATE,
     Portfolio VARCHAR,
	 Lender_Type VARCHAR,
	 Insurance_Status VARCHAR,
	 Dimension VARCHAR,
	 Category VARCHAR,
	 Total_Loan_Value_Originated  BIGINT
);

CREATE TABLE loss_rates (
     reporting_date DATE,
     portfolio VARCHAR,
	 expected_losses DECIMAL
);


-- leave drop function here for potential use
DROP TABLE origination_volumes; 
DROP TABLE loss_rates;
DROP TABLE predicted_losses;

-- join origination volumes table and loss rates table 
SELECT ori.Reporting_Date, 
		ori.Portfolio,
	 ori.Lender_Type,
	 ori.Insurance_Status,
	 ori.Dimension,
	 ori.Category,
	 ori.Total_Loan_Value_Originated,
	 lr.expected_losses
INTO predicted_losses
FROM origination_volumes as ori
LEFT JOIN loss_rates  as lr
ON lr.reporting_date = ori.Reporting_Date and lr.portfolio = ori.Portfolio;

-- check joined table results 
SELECT * FROM predicted_losses;

-- calculate 2016 total expected losses = sum of loan volumes* expected loss rate 
SELECT sum(Total_Loan_Value_Originated*expected_losses)
From predicted_losses 
Where reporting_date BETWEEN '2016-01-01' AND '2016-12-31';


