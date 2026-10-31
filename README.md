# Customer-Segmentation-and-Purchase-Prediction

Data analytics and machine learning project showcasing customer segmentation and purchase prediction using Python, Pandas, NumPy, Scikit-learn, Matplotlib, Seaborn, and PostgreSQL.

##Data Analytics Project

### Overview

This project demonstrates a customer analytics workflow, starting from customer data loading and exploration to data cleaning, feature engineering, customer segmentation, machine learning, model evaluation, and business recommendations.

The goal of this project is to understand customer demographics, income levels, insurance premiums, coverage amounts, and purchasing behavior. K-Means clustering is used to explore customer groups, while Random Forest models are used to predict existing customer segmentation labels and explore future purchase behavior.

The project also provides marketing recommendations based on customer cluster characteristics.

### Dataset
### data source: https://www.kaggle.com/datasets/ravalsmit/customer-segmentation-data
The project uses the `customer_segmentation_data.csv` dataset.

The dataset contains anonymized customer demographic, transactional, financial, and behavioral information suitable for customer segmentation analysis.

Key information includes:

- Customer ID
- Age
- Gender
- Marital Status
- Education Level
- Geographic Information
- Occupation
- Income Level
- Behavioral Data
- Purchase History
- Insurance Products Owned
- Coverage Amount
- Premium Amount
- Policy Type
- Customer Preferences
- Segmentation Group

**Dataset file:** `customer_segmentation_data.csv`

### Dataset Preparation

The following activities are included in the Python workflow:

- Loaded the CSV dataset using Pandas.
- Checked the number of rows and columns.
- Reviewed column names and data types.
- Inspected sample records and statistical summaries.
- Checked missing values and duplicate records.
- Removed exact duplicate rows.
- Created age groups.
- Calculated Premium Income Ratio and Coverage Income Ratio.
- Created Premium Category using premium amount ranges.
- Prepared numerical features for K-Means clustering.
- Used imputation and categorical encoding in the classification pipelines.
- Exported the final dataset and cluster insights to CSV files.

**Main output files:**

- `Customer_Segmentation_Final.csv`
- `Customer_Cluster_Insights.csv`
- `Customer_Marketing_Recommendations.csv`
- `Future_Purchase_Predictions.csv` — generated only if the future-purchase modeling section completes successfully.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning, analysis, and machine learning |
| Pandas | Data manipulation and analysis |
| NumPy | Numerical operations |
| Matplotlib | Data visualization |
| Seaborn | Statistical visualization |
| Scikit-learn | Clustering, preprocessing, classification, and evaluation |
| Jupyter Notebook | Running and documenting Python analysis |
| PostgreSQL | Database storage and data extraction |
| SQLAlchemy | Connecting Python to PostgreSQL |
| Git & GitHub | Project documentation and version control |

## Project Workflow

Customer Segmentation Dataset  
↓  
Load Data in Python  
↓  
Data Understanding and Statistical Analysis  
↓  
Data Cleaning  
↓  
Exploratory Data Analysis (EDA)  
↓  
Feature Engineering and Preprocessing  
↓  
K-Means Customer Segmentation  
↓  
Random Forest Segmentation Prediction  
↓  
Exploratory Future Purchase Prediction  
↓  
Model Evaluation and Validation  
↓  
Business Insights and Marketing Recommendations  
↓  
Export Final Results

## Steps Performed

### 1. Data Loading

The customer dataset was imported into Python using Pandas.

```python
import pandas as pd

df = pd.read_csv("customer_segmentation_data.csv")

print(df.head())
print(df.shape)
print(df.info())
```

The dataset structure was reviewed to understand its columns, data types, and overall quality.

**Note:** Update the file path in the notebook to match the location of your CSV file.

### 2. Exploratory Data Analysis (EDA)

EDA was performed to understand customer characteristics and distributions.

Key activities:

- Dataset overview and statistical summary.
- Missing-value analysis.
- Duplicate-record analysis.
- Age distribution analysis.
- Income distribution analysis.
- Premium amount distribution analysis.
- Coverage amount distribution analysis.
- Existing customer segmentation group analysis.
- Numerical correlation analysis.

Visualizations were created using Matplotlib and Seaborn.
<img width="766" height="412" alt="Screenshot 2026-10-29 234836" src="https://github.com/user-attachments/assets/062b27d0-18a9-4490-9b5d-62b5bf6fb5be" />
<img width="680" height="417" alt="Screenshot 2026-10-29 234829" src="https://github.com/user-attachments/assets/77399854-652a-49f7-94eb-facbd553700a" />
<img width="675" height="417" alt="Screenshot 2026-10-29 234820" src="https://github.com/user-attachments/assets/a6dbc69a-2e91-46a9-aaea-f8db8491ea5d" />
<img width="682" height="416" alt="Screenshot 2026-10-29 234814" src="https://github.com/user-attachments/assets/614ce01c-61b6-4302-91f9-e4bf33266cfe" />
<img width="682" height="422" alt="Screenshot 2026-10-29 234805" src="https://github.com/user-attachments/assets/0c08a4fa-0350-47da-a741-0b772668f2db" />
<img width="932" height="677" alt="Screenshot 2026-10-29 234843" src="https://github.com/user-attachments/assets/8d6be8e3-944d-447d-aaca-83e9e9f43acb" />




### 3. Data Cleaning and Feature Engineering

The dataset was prepared for analysis and machine learning.

Tasks included:

- Removed exact duplicate records.
- Reviewed missing values and data types.
- Created Age Group categories.
- Calculated Premium Income Ratio.
- Calculated Coverage Income Ratio.
- Created Premium Category labels.
- Handled missing numerical values during clustering and model preprocessing.
- Imputed missing categorical values and encoded categorical features within the classification pipelines.
- Checked the resulting feature values.

The cleaned and engineered data was used in the subsequent analysis.

### 4. Customer Segmentation Using K-Means

K-Means clustering was used to group customers according to selected numerical characteristics.

Features used:

- Age
- Income Level
- Coverage Amount
- Premium Amount
- Premium Income Ratio
- Coverage Income Ratio

Steps performed:

- Selected relevant numerical features.
- Replaced infinite values and handled missing values for clustering.
- Standardized numerical features using `StandardScaler`.
- Applied K-Means with three clusters.
- Calculated the silhouette score.
- Calculated cluster-level customer counts, average age, average income, average coverage, and average premium.
- Visualized the clusters using a scatter plot of Income Level and Premium Amount.


**Output:** Customer cluster assignments and cluster summary statistics.

Cluster IDs are arbitrary. They should be interpreted using the actual cluster statistics rather than automatically assuming that cluster 0, 1, or 2 represents a particular customer value.
<img width="770" height="502" alt="Screenshot 2026-10-29 235213" src="https://github.com/user-attachments/assets/4c8299ef-7047-42ff-9ec1-be09c6e275c7" />


### 5. Customer Segmentation Prediction Using Random Forest

A Random Forest classification pipeline was used to predict the existing `Segmentation Group` label.

Steps performed:

- Selected `Segmentation Group` as the target.
- Excluded Customer ID and the generated Customer Cluster from the model inputs.
- Prepared numerical and categorical features.
- Applied median imputation to numerical features.
- Applied most-frequent imputation and one-hot encoding to categorical features.
- Split the data into training and testing sets using an 80:20 ratio.
- Trained a Random Forest classifier.
- Generated predictions for the test data.
- Evaluated model performance.
- Displayed the confusion matrix.
- Identified the top 10 features by model importance.

Evaluation metrics include:

- Accuracy
- Balanced accuracy
- Precision
- Recall
- F1-score
- Confusion matrix

**Important:** This model predicts the existing segmentation labels in the dataset. It does not, by itself, predict future customer purchases. Potential target leakage should also be reviewed before interpreting its performance.
<img width="622" height="687" alt="Screenshot 2026-10-29 235423" src="https://github.com/user-attachments/assets/b4af4a2a-10da-4161-95bd-f58b938e4c9c" />
<img width="857" height="510" alt="Screenshot 2026-10-29 235429" src="https://github.com/user-attachments/assets/d68673a8-3556-48aa-b6d6-153305bf5ea7" />

### 6. Future Purchase Prediction

A separate exploratory classification model was included to investigate future purchase behavior.

The workflow:

- Converted Purchase History to a datetime format.
- Sorted purchase records by Customer ID and purchase date.
- Identified the next recorded purchase date for each customer.
- Calculated the number of days until the next recorded purchase.
- Created a binary target indicating whether the next recorded purchase occurred within 30 days.
- Prepared numerical and categorical model inputs.
- Trained a Random Forest classifier when enough eligible records and target classes were available.
- Evaluated balanced accuracy and average precision.
- Reviewed the confusion matrix and classification report.
- Compared precision, recall, F1-score, and predicted purchaser counts at different probability thresholds.
- Exported test-set prediction results when the modeling section completed successfully.

**Important limitation:** Records without a later recorded purchase are excluded when constructing this target. Therefore, the resulting dataset does not represent every customer and cannot establish that customers without a recorded subsequent purchase are genuine non-purchasers.

For a more reliable future-purchase model, define a prediction date, observe a complete 30-day outcome window for every eligible customer, and use time-based validation.
<img width="401" height="262" alt="image" src="https://github.com/user-attachments/assets/d5ebf9c5-9df9-4bd9-92e3-576c26bc0924" />

### 7. Model Evaluation and Validation

Model evaluation was included to assess clustering and classification performance.

Validation activities:

- Reviewed the K-Means silhouette score.
- Calculated classification accuracy and balanced accuracy.
- Examined precision, recall, and F1-score.
- Reviewed the confusion matrix.
- Investigated class imbalance.
- Examined feature importance.
- Identified possible target leakage.
- Documented limitations in the future-purchase target.
- Recommended time-based validation for future-purchase prediction.

Actual metric values should be taken from the notebook outputs and added to the final project report when available.
<img width="656" height="170" alt="image" src="https://github.com/user-attachments/assets/c25af2c3-7340-41d7-a576-2cdd9fff609f" />

### 8. Business Insights and Marketing Recommendations

Cluster summaries are used to compare customer groups based on their observed characteristics.

The notebook prepares:

- Customer counts by cluster.
- Average age by cluster.
- Average income by cluster.
- Average premium by cluster.
- Average coverage by cluster.
- Business-friendly labels based on average premium.
- Marketing recommendations for the resulting customer segments.

Example marketing strategies included in the project:
<img width="775" height="426" alt="Screenshot 2026-10-29 235712" src="https://github.com/user-attachments/assets/091f9f8d-6a09-4f26-8a70-7b7cabc6efad" />

| Customer Segment | Marketing Strategy | Business Goal |
|---|---|---|
| High Premium Customers | Suitable premium plans, personalized service, and loyalty rewards | Improve retention and maintain premium revenue |
| Medium Premium Customers | Suitable coverage upgrades, bundled plans, and renewal reminders | Increase engagement and encourage appropriate upgrades |
| Low Premium Customers | Affordable plans, flexible payment options, and introductory offers | Improve conversion while keeping products affordable |

These are proposed marketing strategies. Their effectiveness has not been established by the clustering analysis alone. Recommendations should be reviewed against actual cluster characteristics, customer needs, and business results.

### 9. PostgreSQL Database Integration

The project includes Python code to upload customer data to PostgreSQL.

**Database:** `CustomerSegmentationDB`  
**Schema:** `public`  
**Table:** `customer_data`

The workflow uses SQLAlchemy to create a database connection and upload the CSV data to the database table.

Example:

```python
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

df = pd.read_csv("customer_segmentation_data.csv")

# Replace these placeholders with your own connection details.
connection_url = URL.create(
    "postgresql+psycopg2",
    username="postgres",
    password="YOUR_POSTGRES_PASSWORD",
    host="localhost",
    port=5432,
    database="CustomerSegmentationDB"
)

engine = create_engine(connection_url)

df.to_sql(
    name="customer_data",
    con=engine,
    schema="public",
    if_exists="replace",
    index=False
)

print("Dataset uploaded successfully!")
```

**Note:** Database upload code is included in the project. Separate SQL-based customer business queries are not documented as completed in the supplied workflow.

## Results

The notebook is designed to generate the following outputs:

- Customer data exploration and statistical summaries.
- Visualizations of customer age, income, premium, and coverage.
- Correlation heatmap.
- K-Means customer cluster assignments.
- Cluster-level summary statistics.
- Silhouette score.
- Random Forest segmentation predictions and evaluation metrics.
- Feature importance rankings.
- Exploratory future-purchase predictions, when the required data is available.
- Customer cluster insights.
- Marketing recommendation table.
- CSV exports of the final dataset and analytical outputs.

Actual model scores and detailed numerical findings should be documented using the outputs produced by running the notebook.

## Business Recommendations

Based on the cluster profiles and validated analysis results, recommendations can focus on:

- **Customer Segmentation:** Develop targeted campaigns based on observed income, premium, coverage, and demographic characteristics.
- **Customer Retention:** Consider personalized service and relevant loyalty initiatives for customers with higher premium amounts.
- **Affordable Products:** Evaluate suitable lower-cost insurance options for customers whose profiles indicate a preference for affordability.
- **Coverage Opportunities:** Review whether coverage upgrades are appropriate for customers based on their needs and existing products.
- **Purchase Engagement:** Explore reminders and relevant offers for customers with observable purchase activity.
- **Model Validation:** Test future-purchase predictions against complete, subsequent customer outcomes before operational use.
- **Data Quality:** Continue checking missing values, duplicates, inconsistent dates, and unsuitable features.
- **Responsible Marketing:** Ensure that recommendations are relevant, fair, and appropriate for customer needs.

## How to Run

### Step 1: Clone the Repository

Replace the example repository URL with your actual GitHub repository.

```bash
git clone https://github.com/[yourusername](https://github.com/anjidanisaram-bit)/Customer-Segmentation-and-Purchase-Prediction.git
cd Customer-Segmentation-and-Purchase-Prediction
```

### Step 2: Install Python Libraries

```bash
pip install pandas numpy matplotlib seaborn scikit-learn jupyter sqlalchemy psycopg2-binary
```

The supplied database code uses a PostgreSQL driver. If you use the `postgresql+psycopg2` connection string shown above, install `psycopg2-binary`.

### Step 3: Add the Dataset

Place `customer_segmentation_data.csv` in the project directory or update the path in your notebook.

For example:

```python
df = pd.read_csv("data/customer_segmentation_data.csv")
```

### Step 4: Run the Python Analysis

Start Jupyter Notebook:

```bash
jupyter notebook
```

Open your project notebook and run the cells in order, from data loading through the final exports.

### Step 5: Set Up PostgreSQL (Optional)

1. Install and open PostgreSQL using pgAdmin or your preferred SQL client.
2. Create the `CustomerSegmentationDB` database.
3. Update the connection details in the Python code.
4. Run the database integration section.
5. Verify that the `public.customer_data` table was created successfully.

Do not commit database passwords or other credentials to GitHub.

### Step 6: Review the Output Files

After successfully running the relevant sections, review the generated files:

- `Customer_Segmentation_Final.csv`
- `Customer_Cluster_Insights.csv`
- `Customer_Marketing_Recommendations.csv`
- `Future_Purchase_Predictions.csv` — only when generated successfully.

## Project Structure

Suggested GitHub repository structure:

```text
Customer-Segmentation-and-Purchase-Prediction/
│
├── data/
│   └── customer_segmentation_data.csv
│
├── notebooks/
│   └── Customer_Segmentation_and_Prediction.ipynb
│
├── outputs/
│   ├── Customer_Segmentation_Final.csv
│   ├── Customer_Cluster_Insights.csv
│   ├── Customer_Marketing_Recommendations.csv
│   └── Future_Purchase_Predictions.csv
│
├── images/
│   ├── Customer_Data_Preview.png
│   ├── Customer_Distributions.png
│   ├── Correlation_Heatmap.png
│   ├── KMeans_Clusters.png
│   ├── Segmentation_Confusion_Matrix.png
│   └── Feature_Importance.png
│
├── report/
│   └── Customer_Segmentation_and_Prediction_Report.pdf
│
├── requirements.txt
└── README.md
```

This is a suggested structure. Include only files and folders that actually exist in your repository. Check dataset licensing and privacy before publishing the raw dataset or customer-level outputs.

## Skills Demonstrated

- Python
- Pandas
- NumPy
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Statistical Analysis
- Feature Engineering
- Data Preprocessing
- K-Means Clustering
- Random Forest Classification
- Model Evaluation
- Classification Metrics
- Data Visualization
- Customer Analytics
- Business Insights
- Marketing Recommendations
- PostgreSQL Integration
- SQLAlchemy
- Git & GitHub
- Project Documentation

## Author

**Danisaram Anji**  
Aspiring Data Analyst | B.Tech ECE Student

Skills: Python • SQL • Excel • Power BI • Data Analytics

Email: anjidanisaram@gmail.com  
LinkedIn: Anji Danisaram

## Conclusion

This Customer Segmentation and Purchase Prediction project demonstrates practical skills in customer data preparation, exploratory analysis, feature engineering, clustering, classification, model evaluation, and business recommendation development.

K-Means clustering is used to explore customer groups, and Random Forest classification is used to predict existing customer segmentation labels. A separate exploratory model investigates future purchases using available purchase-history records, with important limitations documented.

The project provides a foundation for understanding customer characteristics and designing more targeted marketing strategies. Further validation with complete purchase outcomes and time-based testing is necessary before the future-purchase model can be used for real-world decisions.
