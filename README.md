# Impact of Employment Programs on Hourly Wages

## Project Overview

This project analyzes the impact of two employment programs—MPower and JobQuest—on the hourly wages of participants who were employed at the time of the survey. The goal is to determine whether these programs lead to higher wages compared to a comparison group of individuals who did not participate in either program.

## Files in this Repository

- **`Stats Testing Data Nov 2023 (3).xlsx`**: The dataset used for this analysis.
- **`Analysis_Script.R`**: R script containing all data processing, analysis, and visualization code.
- **`wage_analysis_plot.png`**: Boxplot visualization showing the distribution of hourly wages across program groups.
- **`README.md`**: This file, providing an overview and instructions for the project.

## Analysis Summary

### Data Preparation

The data was filtered to include only employed participants and rows with missing wage data were removed.

### Descriptive Statistics

Mean hourly wages for each program group were calculated and a boxplot was created to visualize wage distributions.

### Statistical Testing

An ANOVA test was conducted to assess wage differences between the groups. A Tukey's HSD test was performed if significant differences were identified.

## Key Findings

- Participants in the **Comparison group** generally had higher hourly wages compared to those in the MPower and JobQuest programs.
- Median wages for the MPower and JobQuest participants were similar.

## How to Run the Analysis

1. **Install Required Packages**:
   ```R
   install.packages(c("ggplot2", "dplyr", "readxl"))
