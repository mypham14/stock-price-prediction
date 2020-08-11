# Stock Price Prediction
Combination of regression models to predict stock prices for companies in a portfolio and help investors make financial decisions

## Table of contents
* [Description](#description)
* [Methodologies](#methodologies)
* [Results](#results)
* [Files](#files)
* [Technologies](#technologies)
* [Packages](#packages)
* [Setup](#setup)
* [Usage](#usage)
* [Status](#status)
* [Inspiration](#inspiration)
* [Contact](#contact)

## Description
The objective of this project is to predict stock prices of a diversified portfolio including 6 companies from 6 different industries and the S&P500 to help investors make financial decisions given the close, open, high, low prices and trading volume over 20 years. Since the main purpose is to test different regression models, the project will use data of one company (Chase) for all models.

*Disclaimer: This project is created for learning purposes and does not hold responsibility over the accuracy of source information and model results compared to reality for investing purposes.*

## Methodologies
* Extract stock prices of all companies over 20 years from Yahoo Finance and maintain a database of stock details in MySQL Server
* Test a combination of models including ARIMA Time Series, Regression Machine Learning models (KNN, Linear Regression, Ridge, LASSO, Support Vector Machines (SVM - linear, poly, rbf)), Ensemble Learning (Bagging, Pasting, Adaboost and Gradient Boosting) and Deep Learning models (Long Short-Term Memory (LSTM)) to predict stock prices of the companies in the portfolio
* Perform parameter tuning and model evaluation
* Web scrape real-time stock prices of all companies
* Create Tableau dashboards for all companies' stock prices for data analysis and visualization 
* Automate the modeling process and deploy the chosen model into production in Azure ML using R scripts

## Results
* **Model Result**: ARIMA time series provided the highest accuracy with a MSE of 0.22 (followed by KNN).
* **Visualization**: Tableau dashboards for the stock portfolio analysis were created [here](https://tabsoft.co/2DxdiBV)
* **Automated ML and Deployment**: the chosen model (time series) was applied in Azure ML and deployed into production [here](https://bit.ly/3ksg24c)

## Files
* Stock Price Prediction.ipynb: notebook describing all project steps 
* stock.csv: all stock data of all 6 companies and the S&P500 index (37,002 rows and 5 columns - Close, Open, High, Low, Volume) for database management in MySQL Server
* chase.csv: Chase data for all models in the project (5,286 rows and 6 columns - Close, Open, High, Low, Adj Close, Volume) with modifications of the datasaet for each respective model 
* new_data.csv: Chase data for deep learning model (LSTM) (5,286 rows and 2 columns - Date, Close)
For all models, Close price is the predicted value.

## Technologies
Project is created with:
* MS Excel
* SQL
* MySQL Server
* Anaconda
* Jupyter Lab
* Jupyter Notebook
* Google Colab
* Python 3
* R Studio
* Tableau
* Azure ML Studio
* Windows

## Packages
* pandas
* numpy
* matplotlib
* seaborn
* tensorflow
* keras
* beautifulsoup
* requests
* scikit-learn
* statsmodels.tsa
* mysql.connector

## Setup
* Download all data files
* Install the requirements using `pip install -r requirements.txt`.
  - Make sure you use Python 3

## Usage
* Run `Stock Price Prediction.ipynb` to see all project steps

## Status
Project is finished.

## Inspiration
Project inspired by [Analytics Vidhya](analyticsvidhya.com/)'s tutorials of prediction models.

## Contact
Created by [@mypham14](https://github.com/mypham14/) - feel free to contact me on my [LinkedIn](https://www.linkedin.com/in/mytrapham)!
