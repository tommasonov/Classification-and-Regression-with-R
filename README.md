# Data Analysis Projects in R

This repository contains two data analysis projects implemented in R. The first project focuses on applying the K-Nearest Neighbors (KNN) algorithm to the Iris dataset, while the second explores the use of Random Forests for classifying institutions based on various features.

## Project 1: KNN Analysis on the Iris Dataset

### Description
This project leverages the K-Nearest Neighbors (KNN) algorithm to classify species of flowers in the well-known Iris dataset. The effectiveness of the algorithm is explored by varying the number of neighbors (K) and evaluating the classification error.

### Project Structure
- **Data Preparation**: Loading the Iris dataset, standardizing features, and splitting into training and test sets.
- **KNN Model**: Training the KNN model with various values of K to find the optimal value.
- **Evaluation**: Calculating the classification error to assess the model's performance.

## Project 2: Classification with Random Forest

### Description
This project uses the Random Forest algorithm to classify institutions as either private or public, based on features such as room and board cost (`Room.Board`) and graduation rate (`Grade.Rate`).

### Project Structure
- **Data Preparation**: Importing the dataset and splitting into training and test sets.
- **Random Forest Model**: Training the Random Forest model and evaluating variable importance.
- **Evaluation**: Using error metrics to evaluate the model's performance.
