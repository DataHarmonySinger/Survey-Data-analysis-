# Load necessary libraries
install.packages("ggplot2")
install.packages("dplyr")
install.packages("readxl")

library(ggplot2)
library(dplyr)
library(readxl)

# Load the Excel file
data <- read_excel("C:/Users/namra/Downloads/Stats Testing Data Nov 2023 (3).xlsx")

# Ensure Program_Status is a factor and set the labels
data$Program_Status <- factor(data$Program_Status, levels = c(1, 2, 3), labels = c("MPower", "JobQuest", "Comparison group"))

# Ensure Gender is a factor and set the labels
data$Gender <- factor(data$Gender, levels = c(0, 1), labels = c("Male", "Female"))

# Ensure Indigenous_Identity is a factor and set the labels
data$Indigenous_Identity <- factor(data$Indigenous_Identity, levels = c(0, 1), labels = c("Not Indigenous", "Indigenous"))

# Ensure Immigrant is a factor and set the labels
data$Immigrant <- factor(data$Immigrant, levels = c(1, 2, 3), labels = c("Non-immigrant", "Recent immigrant", "Established immigrant"))

# Summary of Respondents

# Total Number of Respondents by Program Group
program_counts <- data %>% count(Program_Status)
ggplot(program_counts, aes(x=Program_Status, y=n, fill=Program_Status)) +
  geom_bar(stat="identity", width=0.5) +
  labs(title="Number of Respondents in Each Program Group",
       x="Program Group", y="Number of Respondents") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))  # Center the title

# Breakdown by Gender
gender_counts <- data %>% count(Gender)
ggplot(gender_counts, aes(x=Gender, y=n, fill=Gender)) +
  geom_bar(stat="identity", width=0.5) +
  labs(title="Breakdown by Gender",
       x="Gender", y="Number of Respondents") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))  # Center the title

# Breakdown by Indigenous Identity
indigenous_counts <- data %>% count(Indigenous_Identity)
ggplot(indigenous_counts, aes(x=Indigenous_Identity, y=n, fill=Indigenous_Identity)) +
  geom_bar(stat="identity", width=0.5) +
  labs(title="Breakdown by Indigenous Identity",
       x="Indigenous Identity", y="Number of Respondents") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))  # Center the title

# Breakdown by Immigration History
immigrant_counts <- data %>% count(Immigrant)
ggplot(immigrant_counts, aes(x=factor(Immigrant), y=n, fill=factor(Immigrant))) +
  geom_bar(stat="identity", width=0.7, position=position_dodge(0.8)) +
  labs(title="Breakdown by Immigration History",
       x="Immigration History", y="Number of Respondents") +
  scale_x_discrete(labels=c("1" = "Non-immigrant", "2" = "Recent immigrant", "3" = "Established immigrant")) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))  # Center the title

# Effectiveness of Employment Programs in Helping Participants Find Work
employment_status <- data %>%
  group_by(Program_Status, Employment_Status) %>%
  summarise(n=n(), .groups = 'drop') %>%
  mutate(freq=n/sum(n))

ggplot(employment_status, aes(x=Program_Status, y=freq, fill=factor(Employment_Status))) +
  geom_bar(stat="identity", position="fill", width=0.5) +
  labs(title="Proportion of Employment Status by Program Group",
       x="Program Group", y="Proportion") +
  scale_fill_manual(values = c("Employed" = "blue", "Not employed and looking for work" = "red", "Not employed and not looking for work" = "green"), name="Employment Status",
                    labels=c("Employed", "Not employed and looking for work", "Not employed and not looking for work")) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))  # Center the title

# Impact of Program Completion on Hourly Wages
employed_data <- data %>% filter(Employment_Status == 1)

ggplot(employed_data, aes(x=Program_Status, y=Wage, fill=Program_Status)) +
  geom_boxplot(width=0.5) +
  labs(title="Impact of Program Completion on Hourly Wages",
       x="Program Group", y="Hourly Wage") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))  # Center the title


