# Data-Science-Portfolio
Welcome to my data analytics portfolio, where I present a collection of projects that highlight my extensive expertise and proficiency in various data analytical skills. 
Each project in this portfolio demonstrates my ability to tackle diverse analytical challenges, employ programming languages like Python or SQL with relevant statistical techniques, and derive actionable insights from complex datasets. 

Please explore the individual projects in this portfolio for a more detailed understanding of my data analytics capabilities and how I can contribute to your organization's success.

**[1. Exoplanet Habitability Analysis](https://github.com/maidinh2409/AIDS-ML-Classification)**

End-to-end project assessing exoplanet habitability using real astronomical data. I structured the workflow into three stages:

- **Data Extraction**: Collected data via NASA and Asterank APIs
- **ELT Pipeline**: Used dbt + BigQuery to clean, transform, and validate planetary features
- **BI & ML Deployment**:
  + Built a Power BI dashboard to explore habitability patterns
  + Trained XGBoost and logistic regression models to classify planets

**<ins>Purpose:</ins>** To apply real-world tools and best practices in data engineering, analytics, and machine learning on a space science problem, delivering both actionable insights and a scalable classification system.

**<ins>Expected insights:</ins>** Readers will gain a deeper understanding of planetary habitability by identifying clusters of potentially habitable exoplanets based on star system attributes, spatial location, and physical characteristics. Machine learning models are leveraged to predict habitability likelihood with interpretable metrics and deployment-ready logic.

**<ins>Tech Stack:</ins>**

- Languages: Python, SQL
- Tools: dbt, Google BigQuery, Power BI, RESTFul APIs (NASA, Asterank)

**[2. AIDS-Survivor-ML-Classifiers](https://github.com/maidinh2409/AIDS-ML-Classification)**

This is a dataset from the medical industry that contains data of patients diagnosed with HIV/AIDS who are participating in a study with the goal of observing whether or not each patient died within a certain observation time. The purpose is to examine the performance of two different types of AIDS treatments (with ZDV treatments and no ZDV treatments)
- Tools used: Python
- Models: Logistics Regression, Kernel Support Vector Machine (SVM), K-Nearest Neighbors (KNN), Decision Tree
  
_(Other ML Projects: https://github.com/maidinh2409/ML-Repositories)_

**[3. Gym Check-ins and User Metadata](https://github.com/maidinh2409/Gym-Check-ins-and-User-Metadata)**

This dataset contains information on user check-ins at different gym locations, along with related user metadata. The data is relatively clean and was used to practice building data models, standardizing fields, and extracting and querying information across multiple tables for analysis and visualization purposes. The focus was on performing various analyses and creating insights based on the gym check-in data.
  - Tools used: MySQL, Tableau

**[4. Helmet-Wearing Object Image Classification using Deep Learning](https://github.com/maidinh2409/AIDS-ML-Classification)**

* *[Try the model on Hugging Face Spaces](https://huggingface.co/spaces/demile2409/CSIS-3290-Helmet-Image-Classification)* *

**<ins>Description:</ins>** Inspired by real-world safety concerns, this project tackles the challenge of detecting helmet use in images using deep learning. I built and trained a CNN on a custom dataset, enabling the model to distinguish between helmet and non-helmet cases with high accuracy. The final product is deployed as an interactive web app for real-time testing.

**<ins>Purpose:</ins>** To apply deep learning to a practical safety compliance problem and build a deployable solution for environments like construction sites and traffic monitoring.

**<ins>Expected insights:</ins>** Demonstrates how CNNs can effectively detect safety gear in real-world imagery and highlights the process of building an end-to-end ML product—from training to deployment.

**<ins>Tech Stack:</ins>**

- Languages: Python
- Models: Deep Neural Network (DNN), Convolutional Neural Network (CNN)
- Libraries & Tools: PyTorch, OpenCV, Gradio, Google Colab

    
**[5. Real Estate Sales Analysis 2001 - 2022](https://github.com/maidinh2409/Real-Estate-Sales-Analysis)**

This dataset, sourced from data.gov, contains over 1 million rows of real estate sales data spanning 21 years. It was utilized to clean and transform data using pandas, addressing null values, resolving inconsistencies, and detecting outliers through statistical analysis and visualization. Exploratory Data Analysis (EDA) was conducted using Matplotlib and Seaborn to plot and analyze distributions, patterns, and trends, yielding insights based on metrics and distribution theory.
  - Tool used: Python
