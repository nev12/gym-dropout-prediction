# GYM PREDICTION

## Project Overview

This project explores the problem of predicting gym member churn using activity and engagement data.

Due to the lack of puyblicly available datasets that explicitly encode churn behavior, the project combines data auditing, synthetic data generation, validation and predictive modeling into a single workflow

The goal is not to maximisze model performance, but to demonstrate correct problem framing, data reasoning, leakage aware modeling and honest interpretation.

## Technologies Used

- Python (pandas, numpy, scikit-learn)
- SQL (MySQL)
- Data Visualization (matplotlib)

## Workflow summary

### 1. Data Sanity Check

The original dataset was audited to assess suitability for churn modeling.

Exploration revealed that check-in timestamps were randomly distributed and did not encode meaningful churn behaviour, making direct churn prediction invalid.

Notebook: 00_data_sanity_check.ipynb

### 2. Synthetic Data Generation

To address the limitations of the original data, a synthetic data generator was implemented.

The generator simulates somewhat realistic gym engagement lynamics, including:
  - user archetypes (consistent, casual, sporadic, at risk)
  - temporal dependency between sessions
  - probabilistic churn events
  - constrained gym and workout diversity

Notebook: 01_data_generation.ipynb

### 3. Data Validation

The generated data was validated to ensure alignment with intended assumptions.

Validation check incuded:
  - structural integrity
  - differentiated engagement volume
  - temporal gaps
  - churn rate

Notebook: 02_data_validation.ipynb

### 4. Feature Engineering (SQL)

SQL was used to create reproducible, model ready feature tables from the validated syntetic data.

This includes data loading, session cleaning, user level aggregation and churn labeling

Folder: SQL pipeline/

### 5. Exploratory Analysis & Modeling

Exploratory analysis focused on evaluating which features were suitable for modeling rather than on ucovering new patterns.

A baseline logistic regression model was trained using historical engagement features only. Recency-related variables were excluded to avoid target leakage, since churn is defined based on inactivity.

Notebook: 03_eda_modeling.ipynb

## Churn Definiton

Churn is defined as 21 days of inactivity folowing a users most recent check-in.

## Key Result

- The baseline model achieves modest predictive performance

## Key Takeaways

- Not all dataset are suitable for churn prediction without auditing.
- Synthetic data can be resposibly used when assumptions are explicit and validated.
- Leakage aware modeling is more important than high accuracy.

## Disclaimer

This project uses **AI-generated synthetic data** created solely for educational purposes.

No real data is included.

## Final Note

This project emphasizes data reasoning, validation and methodological correctness.

It is inteded to reflect how real world data science problems are approached when data quality and assumptions must be carefully examined.














