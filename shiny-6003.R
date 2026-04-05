library(shiny)
library(shinythemes)
library(rsconnect)

#soci 6003
ui <- fluidPage(
  titlePanel("SOCI6003: Advanced Statistical Analysis"),
  sidebarLayout(
    sidebarPanel(
      width = 3,
      selectInput("module",
                  "Select Module:",
                  choices = c(
                    "Course Overview" = "overview",
                    "1. Basic Concepts" = "basic_concepts",
                    "2. Multiple Regression: Basics" = "mr_basics",
                    "3. Multiple Regression: Techniques" = "mr_techniques",
                    "4. Multiple Regression: Diagnostics" = "mr_diagnostics",
                    "5. Logistic Regression" = "binary_models",
                    "6. Poisson Regression" = "count_models",
                    "7. Fixed- and Random-Effects Models" = "panel_models",
                    "8. Event history analysis" = "event_history"
                  ),
                  selected = "overview"
      )
    ),
    mainPanel(
      uiOutput("module_content")
    )
  )
)

server <- function(input, output) {
  output$module_content <- renderUI({
    switch(input$module,
           "overview" = div(
             h4("SOCI6003: Advanced Statistical Analysis (Prof. JIN Lei - ljin@cuhk.edu.hk)"),
             #h4("blackboard link"),
             p("This Shiny app is intended to help you revise some of the statistical concepts learnt in the lectures. Use the sidebar to navigate to different modules to find some repetition exercises for each lecture."),
             h4("What You'll Learn:"),
             p("• 1. Basic Concepts"),
             p("• 2. Multiple regression: Basics"),
             p("• 3. Multiple regression: Techniques"),
             p("• 4. Multiple regression: Diagnostics"),
             p("• 5. Logistic regression"),
             p("• 6. Poisson regression"),
             p("• 7. Fixed- and random-effects models"),
             p("• 8. Event history analysis"),
           ),
           #Module 1: Basic Concepts
           "basic_concepts" = div(
             h3("Basic Concepts"),
             # M1 Q1: Hypotheses
             p("1. What is the primary purpose of a hypothesis in social science research?"),
             radioButtons(
               "mcq1_answer",
               "",
               c(
                 "To establish definitive causal relationships." = "option1",
                 "To provide a testable, falsifiable prediction derived from theory." = "correct_option",
                 "To summarize observed data without further testing." = "option3",
                 "To make speculative guesses about research outcomes." = "option4"
               )
             ),
             actionButton("submit_mcq1", "Submit Answer"),
             uiOutput("mcq1_feedback"),
             hr(),
             # M1 Q2: Descriptive and inferential statistics
             p("2. Which of the following best describes the fundamental difference between descriptive and inferential statistics?"),
             radioButtons(
               "mcq2_answer",
               "",
               c(
                 "Descriptive statistics summarize and organize data, while inferential statistics use sample data to make generalizations about a population." = "correct_option",
                 "Descriptive statistics are used to test hypotheses, while inferential statistics are used to summarize data." = "option2",
                 "Descriptive statistics focus on population parameters, while inferential statistics focus on sample statistics." = "option3",
                 "Descriptive statistics rely on probability distributions, while inferential statistics do not." = "option4"
               )
             ),
             actionButton("submit_mcq2", "Submit Answer"),
             uiOutput("mcq2_feedback"),
             hr(),
             # M1 Q3: Central Limit Theorem
             p("3. According to the Central Limit Theorem, which of the following statements is correct?"),
             radioButtons(
               "mcq3_answer",
               "",
               c(
                 "The sampling distribution of the sample mean will be normally distributed, regardless of the population distribution, as long as the sample size is sufficiently large." = "correct_option",
                 "The Central Limit Theorem only applies to populations that are normally distributed." = "option2",
                 "The Central Limit Theorem states that the sample mean will always equal the population mean, regardless of sample size." = "option3",
                 "The Central Limit Theorem guarantees that the sample variance will be equal to the population variance for any sample size." = "option4"
               )
             ),
             actionButton("submit_mcq3", "Submit Answer"),
             uiOutput("mcq3_feedback"),
             hr(),
             # M1 Q4: Random and probability sample
             p("4. What is the key distinction between a random sample and a probability sample in survey research?"),
             radioButtons(
               "mcq4_answer",
               "",
               c(
                 "A random sample is selected without any known probability of inclusion, while a probability sample ensures every unit in the population has a known, non-zero chance of being selected." = "correct_option",
                 "A random sample is always representative of the population, while a probability sample is not." = "option2",
                 "A probability sample relies on non-random selection methods, while a random sample uses fixed intervals for selection." = "option3",
                 "A random sample is only used in qualitative research, while a probability sample is used in quantitative research." = "option4"
               )
             ),
             actionButton("submit_mcq4", "Submit Answer"),
             uiOutput("mcq4_feedback"),
             hr(),
             # M1 Q5: Normal Distribution
             p("5. In a perfectly normal distribution, what percentage of data points lie within ±2 standard deviations from the mean?"),
             radioButtons(
               "mcq5_answer",
               "",
               c("68%" = "option1",
                 "95%" = "correct_option",
                 "99.7%" = "option3",
                 "90%" = "option4")
             ),
             actionButton("submit_mcq5", "Submit Answer"),
             uiOutput("mcq5_feedback"),
             hr(),
             # M1 Q6: Dispersion
             p("6. Which of the following measures of dispersion is most sensitive to outliers?"),
             radioButtons(
               "mcq6_answer",
               "",
               c("Interquartile Range (IQR)" = "option1",
                 "Range" = "correct_option",
                 "Median Absolute Deviation (MAD)" = "option2",
                 "Standard Deviation" = "option3")
             ),
             actionButton("submit_mcq6", "Submit Answer"),
             uiOutput("mcq6_feedback"),
             hr(),
             # M1 Q7: Outliers
             p("7. In a dataset, an outlier is best described as:"),
             radioButtons(
               "mcq7_answer",
               "",
               c("A data point that is always the result of measurement error." = "option1",
                 "A data point that lies far from the other observations and may indicate unusual behavior or variability." = "correct_option",
                 "A data point that is always excluded from statistical analyses to improve model fit." = "option3",
                 "A data point that is exactly equal to the median of the dataset." = "option4")
             ),
             actionButton("submit_mcq7", "Submit Answer"),
             uiOutput("mcq7_feedback"),
             hr(),
             # M1 Q8: Skewness
             p("8. In a dataset with a right-skewed (positively skewed) distribution, which of the following statements is true?"),
             radioButtons(
               "mcq8_answer",
               "",
               c("The mean is less than the median, and the median is less than the mode." = "option1",
                 "The mean is greater than the median, and the median is greater than the mode." = "correct_option",
                 "The mean, median, and mode are all equal." = "option3",
                 "The mode is greater than the mean, and the mean is greater than the median." = "option4")
             ),
             actionButton("submit_mcq8", "Submit Answer"),
             uiOutput("mcq8_feedback"),
             hr(),
             # M1 Q9: Standard Deviation
             p("9. Calculate the standard deviation of the following dataset: 3, 2, 2, 4, 3.5, 1"),
             numericInput("calc1_answer", "Your answer (rounded to 2 decimal places):", value = NULL, step = 0.01),
             actionButton("submit_calc1", "Submit Answer"),
             uiOutput("calc1_feedback"),
             hr(),
             # M1 Q10: Standard Error
             p("10. Calculate the standard error of the mean for a population of size 500 with a variance of 1,600."),
             numericInput("calc2_answer", "Your answer (rounded to 2 decimal places):", value = NULL, step = 0.01),
             actionButton("submit_calc2", "Submit Answer"),
             uiOutput("calc2_feedback"),
             hr(),
             # M1 Q11: 95% Confidence Interval
             p("11. Calculate the 95% confidence interval of the mean. Our sample size is 5% of the a population of 21,780. The mean for our sample is 5.50, the standard deviation 6.66."),
             p("Enter the lower and upper bounds of the confidence interval:"),
             numericInput("calc3_lower", "Lower bound (rounded to 2 decimal places):", value = NULL, step = 0.01),
             numericInput("calc3_upper", "Upper bound (rounded to 2 decimal places):", value = NULL, step = 0.01),
             actionButton("submit_calc3", "Submit Answer"),
             uiOutput("calc3_feedback"),
             hr(),
             # M1 Q12: Interpretation of Confidence Intervals
             p("12. Which of the following is the correct interpretation of a 95% confidence interval for the mean?"),
             radioButtons(
               "mcq9_answer",
               "",
               c("There is a 95% probability that the true population mean falls within the calculated interval." = "option1",
                 "If we were to repeat the sampling process many times, 95% of the calculated confidence intervals would contain the true population mean." = "correct_option",
                 "The interval contains 95% of the individual data points in the population." = "option3",
                 "The true population mean will always be exactly in the middle of the 95% confidence interval." = "option4")
             ),
             actionButton("submit_mcq9", "Submit Answer"),
             uiOutput("mcq9_feedback"),
           ),
           #Module 2: Multiple Regression: Basics
           "mr_basics" = div(
             h3("Multiple Regression: Basics"),
             # M2 Q1: Testing for Son Preference"
             p("1. The natural ratio at birth is about 105 men to 100 women. What’s the proportion of men at birth?"),
             p("I suspect that in a city, son preference leads to an excess number of boys at birth. I take a sample of 1,000 births in the city and found that 525 of them are boys. Can I say that there are an unnaturally high number of boys in the city?"),
             p("Fill in the blanks to test the hypothesis:"),
             p("a. Null hypothesis (proportion of boys):"),
             textInput("mr1_p_null", ""),
             p("b. Alternative hypothesis:"),
             textInput("mr1_p_alt", ""),
             p("c. Type of test (one-tailed or two-tailed):"),
             textInput("mr1_test_type", ""),
             p("d. z-score (rounded to 2 decimal places):"),
             numericInput("mr1_zscore", "", value = NULL, step = 0.01),
             p("e. p-value (rounded to 2 decimal places):"),
             numericInput("mr1_pvalue", "", value = NULL, step = 0.01),
             p("f. Conclusion (reject or not reject null hypothesis):"),
             textInput("mr1_decision", ""),
             actionButton("submit_mr1", "Submit Answers"),
             uiOutput("mr1_feedback"),
             hr(),
             # M2 Q2: Normal vs. t-Distribution
             p("2. What is the primary difference between the normal distribution and the t-distribution in the context of hypothesis testing?"),
             radioButtons(
               "mr2_answer",
               "",
               c("The normal distribution is used for small sample sizes, while the t-distribution is used for large sample sizes." = "option1",
                 "The t-distribution has heavier tails than the normal distribution, making it more appropriate for small sample sizes or when the population standard deviation is unknown." = "correct_option",
                 "The normal distribution is always symmetric, while the t-distribution is skewed." = "option3",
                 "The t-distribution is used for categorical data, while the normal distribution is used for continuous data." = "option4")
             ),
             actionButton("submit_mr2", "Submit Answer"),
             uiOutput("mr2_feedback"),
             hr(),
             # M2 Q3: Type I Error
             p("3. In hypothesis testing, a Type I error occurs when:"),
             radioButtons(
               "mr3_answer",
               "",
               c("The null hypothesis is incorrectly rejected when it is actually true." = "correct_option",
                 "The null hypothesis is incorrectly retained when it is actually false." = "option2",
                 "The alternative hypothesis is incorrectly rejected when it is actually true." = "option3",
                 "The sample size is too small to detect a true effect." = "option4")
             ),
             actionButton("submit_mr3", "Submit Answer"),
             uiOutput("mr3_feedback"),
             hr(),
             # M2 Q4: Correlation Coefficient
             p("4. Calculate the correlation coefficient (Pearson’s r) given the following:"),
             p("Covariance of variables a and b: 45"),
             p("Standard deviation of variable a: 6.7"),
             p("Standard deviation of variable b: 8.2"),
             p("Enter the correlation coefficient (rounded to 3 decimal places):"),
             numericInput("mr4_correlation", "", value = NULL, step = 0.001),
             actionButton("submit_mr4", "Submit Answer"),
             uiOutput("mr4_feedback"),
             hr(),
             # M2 Q5: Fill in the Missing Words
             p("5. Complete the following statements about the correlation coefficient by filling in the missing words:"),
             p("a. The correlation coefficient (Pearson’s r) measures the linear _____ between two variables. ",
               textInput("mr5_word1", "", placeholder = ""), ""),
             p("b. The correlation coefficient ranges from -1 to 1, where 1 indicates a perfect _____ relationship. ",
               textInput("mr5_word2", "", placeholder = ""), ""),
             p("c. A correlation coefficient of 0 indicates no _____ relationship between the variables. ",
               textInput("mr5_word3", "", placeholder = ""), ""),
             actionButton("submit_mr5", "Submit Answers"),
             uiOutput("mr5_feedback"),
             hr(),
             # M2 Q6: True or False
             p("6. In a multiple OLS regression model, the constant (intercept) represents the expected value of the dependent variable when all independent variables are zero, and its statistical significance indicates whether the independent variables collectively explain variation in the dependent variable."),
             radioButtons(
               "mr6_answer",
               "",
               c("True" = "true",
                 "False" = "correct_option")
             ),
             actionButton("submit_mr6", "Submit Answer"),
             uiOutput("mr6_feedback"),
             hr(),
             # M2 Q7: True or False
             p("7. In a multiple OLS regression model, the slope coefficient for a given independent variable represents the change in the dependent variable associated with a one-unit change in that independent variable, holding all other independent variables constant."),
             radioButtons(
               "mr7_answer",
               "",
               c("True" = "correct_option",
                 "False" = "false")
             ),
             actionButton("submit_mr7", "Submit Answer"),
             uiOutput("mr7_feedback"),
             hr(),
             # M2 Q8: True or False
             p("8. In a multiple OLS regression model, the error term is assumed to have a mean of zero, constant variance (homoscedasticity), and no correlation with the independent variables or with error terms of other observations (no autocorrelation)."),
             radioButtons(
               "mr8_answer",
               "",
               c("True" = "correct_option",
                 "False" = "false")
             ),
             actionButton("submit_mr8", "Submit Answer"),
             uiOutput("mr8_feedback"),
             hr(),
             # M2 Q9: Interpretation of Partial Coefficients
             p("9. Suppose you estimate the following OLS regression model to explain life satisfaction (Y) based on income (X1, in $10,000 USD) and social trust (X2, 0-10 scale):"),
             p("Life Satisfaction = 4.2 + 0.8 * Income + 0.5 * Social Trust + e"),
             p("How should the coefficient for Income (0.8) in the above regression model be interpreted?"),
             radioButtons(
               "mr9_answer",
               "",
               c("A $10,000 increase in income is associated with a 0.8-unit increase in life satisfaction, holding social trust constant." = "correct_option",
                 "A 1-unit increase in income is associated with a 0.8-unit increase in life satisfaction, regardless of social trust." = "option2",
                 "A $10,000 increase in income is associated with a 0.8-unit increase in life satisfaction, but only if social trust is zero." = "option3",
                 "A 0.8-unit increase in life satisfaction is associated with a $10,000 increase in income, holding social trust constant." = "option4")
             ),
             actionButton("submit_mr9", "Submit Answer"),
             uiOutput("mr9_feedback"),
             hr(),
             # M2 Q10: Omitted Variable Bias
             p("10. Suppose you estimate a regression model to explain wages (Y) based on years of education (X1) but omit work experience (X2), which is positively correlated with both education and wages. What is the likely consequence of this omission?"),
             radioButtons(
               "mr10_answer",
               "",
               c("The coefficient for education (X1) will be upwardly biased because the omitted variable (work experience) is positively correlated with both education and wages." = "correct_option",
                 "The coefficient for education (X1) will be unbiased because omitted variables do not affect the consistency of OLS estimators." = "option2",
                 "The coefficient for education (X1) will be downwardly biased because the omitted variable (work experience) is positively correlated with education but negatively correlated with wages." = "option3",
                 "The coefficient for education (X1) will be unaffected because OLS automatically accounts for omitted variables through the error term." = "option4")
             ),
             actionButton("submit_mr10", "Submit Answer"),
             uiOutput("mr10_feedback"),
           ),
           #Module 3: Multiple Regression: Techniques
           "mr_techniques" = div(
             h3("Multiple Regression: Techniques"),
             # M3 Q1: Confounder, Moderator, or Mediator?
             p("1. You are studying the relationship between stress levels (X1) and sleep duration (Y). You include caffeine consumption (X2) as a second predictor in your regression model."),
             p("A colleague suggests adding work hours (Z) as a third variable. They argue that work hours might influence both stress levels and sleep duration."),
             p("How is work hours (Z) best described in this context?"),
             radioButtons(
               "mr_tech1_answer",
               "",
               c("Confounder" = "confounder",
                 "Moderator" = "moderator",
                 "Mediator" = "mediator",
                 "None of the above" = "none")
             ),
             actionButton("submit_mr_tech1", "Submit Answer"),
             uiOutput("mr_tech1_feedback"),
             hr(),
             # M3 Q2: Confounder, Moderator, or Mediator?
             p("2. You are studying the relationship between age (X) and attitudes toward traditions (Y). You hypothesize that religiosity (Z) might play a role in this relationship. Specifically, you suspect that age influences religiosity, which in turn affects attitudes toward traditions."),
             p("How is religiosity (Z) best described in this context?"),
             radioButtons(
               "mr_tech2_answer",
               "",
               c("Confounder" = "confounder",
                 "Moderator" = "moderator",
                 "Mediator" = "mediator",
                 "None of the above" = "none")
             ),
             actionButton("submit_mr_tech2", "Submit Answer"),
             uiOutput("mr_tech2_feedback"),
             hr(),
             # M3 Q3: True or False
             p("3. Standardizing independent variables (subtracting the mean and dividing by the standard deviation) changes the substantive interpretation of the regression coefficients, making them directly comparable in terms of standard deviation units."),
             radioButtons(
               "mr_tech4_answer",
               "",
               c("True" = "true",
                 "False" = "false",
                 "Cannot be determined" = "cannot_determine")
             ),
             actionButton("submit_mr_tech4", "Submit Answer"),
             uiOutput("mr_tech4_feedback"),
             hr(),
             # M3 Q4: True or False
             p("4. Standardizing variables in a regression model improves the model's goodness-of-fit (e.g., R²) because it reduces multicollinearity and heteroscedasticity."),
             radioButtons(
               "mr_tech5_answer",
               "",
               c("True" = "true",
                 "False" = "correct_option",
                 "Cannot be determined" = "cannot_determine")
             ),
             actionButton("submit_mr_tech5", "Submit Answer"),
             uiOutput("mr_tech5_feedback"),
             hr(),
             # M3 Q5: Properties of Z-Standardized Variables
             p("5. z-standardized variables have a mean of "),
             numericInput("mr_tech6_mean", "", value = NULL, step = 0.1),
             p(" and a variance of "),
             numericInput("mr_tech6_variance", "", value = NULL, step = 0.1),
             actionButton("submit_mr_tech6", "Submit Answer"),
             uiOutput("mr_tech6_feedback"),
             hr(),
             # M3 Q6: Determinants of the Standard Error of the Coefficient
             p("6. Which of the following are determinants of the standard error of a regression coefficient? (Select all that apply.)"),
             checkboxGroupInput(
               "mr_tech7_answers",
               "",
               c("Sample size (n)" = "n",
                 "Variance of the independent variable (Var(X))" = "var_x",
                 "Variance of the error term (Var(ε))" = "var_epsilon",
                 "Mean of the dependent variable (E[Y])" = "mean_y",
                 "Strength of the relationship between X and Y (R²)" = "r_squared",
                 "Number of independent variables in the model (k)" = "k")
             ),
             actionButton("submit_mr_tech7", "Submit Answer"),
             uiOutput("mr_tech7_feedback"),
             hr(),
             # M3 Q7: Significance of Parameter Estimates
             p("7. Which of the following statements about the significance of parameter estimates in regression analysis is correct?"),
             radioButtons(
               "mr_tech8_answer",
               "",
               c("A statistically significant parameter estimate (p < 0.05) always indicates a substantively meaningful effect." = "wrong1",
                 "The t-statistic for a parameter estimate is calculated as the estimate divided by its standard error, and a larger absolute t-statistic indicates stronger evidence against the null hypothesis." = "correct_option",
                 "If a parameter estimate is not statistically significant, it means the true effect size in the population is zero." = "wrong3",
                 "The p-value for a parameter estimate represents the probability that the null hypothesis is true." = "wrong4")
             ),
             actionButton("submit_mr_tech8", "Submit Answer"),
             uiOutput("mr_tech8_feedback"),
             hr(),
             # M3 Q8: Coefficient of Determination (R²)
             p("8. Which of the following statements about the coefficient of determination (R²) in a multiple regression model is correct?"),
             radioButtons(
               "mr_tech9_answer",
               "",
               c("R² represents the proportion of variance in the independent variables explained by the dependent variable." = "wrong1",
                 "R² is always independent of the sample size and can only increase when additional predictors are added to the model." = "wrong2",
                 "R² can be negative if the model fits the data worse than a horizontal line (the mean of the dependent variable)." = "wrong3",
                 "R² is a measure of how well the independent variables explain the variance in the dependent variable, but it does not indicate causality or the appropriateness of the model." = "correct_option")
             ),
             actionButton("submit_mr_tech9", "Submit Answer"),
             uiOutput("mr_tech9_feedback"),
             hr(),
             # M3 Q9: The F-Test in Multiple Regression
             p("9. Which of the following statements about the F-test in multiple regression are correct? (Select all that apply.)"),
             checkboxGroupInput(
               "mr_tech10_answers",
               "",
               c("The F-test evaluates whether at least one of the independent variables in the model has a non-zero coefficient." = "true1",
                 "The F-test is used to compare the fit of two nested models, such as a full model versus a reduced model." = "true2",
                 "A significant F-test (p < 0.05) means that all independent variables in the model are statistically significant." = "false3",
                 "The F-test is robust to violations of the normality assumption of the error terms." = "false4",
                 "The F-statistic is calculated as the ratio of explained variance to unextained variance, adjusted for degrees of freedom." = "false5")
             ),
             actionButton("submit_mr_tech10", "Submit Answer"),
             uiOutput("mr_tech10_feedback"),
             hr(),
             # M3 Q10: Interpretation of Regression Coefficients
             p("10. You estimate the following regression model to explain inherited wealth (in $1,000,000 USD) based on:"),
             p("Gender of heir (0 = female, 1 = male) and Age of heir (in years)."),
             p("The estimated regression equation is:"),
             p("Inherited Wealth = 2.0 + 0.5 * Male + 0.1 * Age"),
             p("How would you interpret the coefficient for Male (0.5) in this model?"),
             textAreaInput("mr_tech11_answer", "", placeholder = "Type your interpretation here..."),
             actionButton("submit_mr_tech11", "Compare My Answer"),
             uiOutput("mr_tech11_feedback"),
             hr(),
             # M3 Q11: Interpretation of Categorical Predictors in Regression
             p("11. You estimate the following regression model to explain well-being (0–100 scale) based on: Gender (0 = female, 1 = male) and Living arrangement (0 = tenant, 1 = house owner, 2 = shared flat living)."),
             p("The estimated regression results are:"),
             tags$pre(
               "
            Estimate   Std. Error   t value   Pr(>|t|)
(Intercept)     70.000      1.500    46.667    <0.001 ***
Male             -2.000      0.800    -2.500    0.015 *
House Owner       5.000      1.200     4.167    <0.001 ***
Shared Flat      -3.000      1.000    -3.000    0.004 **
---
Signif. codes: 0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
"
             ),
             p("Which of the following interpretations of the results is correct?"),
             radioButtons(
               "mr_tech12_answer",
               "",
               c("Males report higher well-being than females, and house owners report lower well-being than tenants." = "wrong1",
                 "Females report higher well-being than males, and house owners report higher well-being than those in shared flats." = "wrong2",
                 "Males report lower well-being than females, and house owners report higher well-being than tenants." = "correct_option",
                 "Females report lower well-being than males, and shared flat residents report higher well-being than house owners." = "wrong4")
             ),
             actionButton("submit_mr_tech12", "Submit Answer"),
             uiOutput("mr_tech12_feedback"),
             hr(),
             # M3 Q12: Evaluating Variable Transformations
             p("12. You are analyzing inheritance amounts in USD from a survey. The distribution of inheritance values is:"),
             tags$ul(
               tags$li("Highly right-skewed (most values are small, but a few are extremely large)."),
               tags$li("Mean ($500,000) is much larger than the median ($150,000)."),
               tags$li("Standard deviation ($1,200,000) is larger than the mean."),
               tags$li("A few outliers exceed $10,000,000.")
             ),
             p("Which of the following actions is most appropriate for this variable?"),
             radioButtons(
               "mr_tech13_answer",
               "",
               c("No transformation needed; the variable is normally distributed." = "wrong1",
                 "Apply a logarithmic transformation to reduce skewness and the influence of outliers." = "correct_option",
                 "Use a polynomial transformation (e.g., quadratic) to capture nonlinear relationships." = "wrong3",
                 "Dichotomize the variable (e.g., 'high' vs. 'low' inheritance) to simplify analysis." = "wrong4")
             ),
             actionButton("submit_mr_tech13", "Submit Answer"),
             uiOutput("mr_tech13_feedback"),
             hr(),
             # M3 Q13: Evaluating Transformations for Working Hours
             p("13. You are analyzing weekly working hours from a survey. The distribution of working hours is:"),
             tags$ul(
               tags$li("Bimodal: Peaks at 35–40 hours (full-time) and 10–15 hours (part-time)."),
               tags$li("No extreme outliers, but the relationship with the dependent variable (e.g., stress) appears nonlinear (e.g., stress increases sharply after 50 hours)."),
               tags$li("Mean (32 hours) and median (30 hours) are similar.")
             ),
             p("Which of the following actions is most appropriate for this variable?"),
             radioButtons(
               "mr_tech14_answer",
               "",
               c("No transformation needed; the variable is normally distributed." = "wrong1",
                 "Apply a logarithmic transformation to reduce skewness." = "wrong2",
                 "Use a polynomial transformation (e.g., quadratic) to capture the nonlinear relationship with the outcome." = "correct_option",
                 "Dichotomize the variable (e.g., 'full-time' vs. 'part-time') to simplify analysis." = "wrong4")
             ),
             actionButton("submit_mr_tech14", "Submit Answer"),
             uiOutput("mr_tech14_feedback"),
             hr(),
             # M3 Q14: Interpretation of a Log-Transformed Coefficient
             p("14. You estimate a regression model where annual income (Y, in USD) is log-transformed and predicted by years of education (X). The estimated coefficient for education is 0.08."),
             p("How should you interpret the coefficient for education (0.08)?"),
             radioButtons(
               "mr_tech15_answer",
               "",
               c("A one-year increase in education is associated with an 8% increase in annual income." = "wrong1",
                 "A one-year increase in education is associated with a $0.08 increase in annual income." = "wrong2",
                 "A one-unit increase in log(income) is associated with a 0.08-year increase in education." = "wrong3",
                 "A one-year increase in education is associated with a 0.08-unit increase in log(income), which implies an 8% increase in income for small changes." = "correct_option")
             ),
             actionButton("submit_mr_tech15", "Submit Answer"),
             uiOutput("mr_tech15_feedback"),
             hr(),
             # M3 Q15: Interpretation of a Polynomial Regression Function
             p("15. You estimate a quadratic regression model for job satisfaction (Y, 0–100 scale) as a function of age (X):"),
             p("Job Satisfaction = 50 + 2.0 * Age - 0.03 * Age²"),
             p("How should you interpret the relationship between age and job satisfaction?"),
             radioButtons(
               "mr_tech16_answer",
               "",
               c("Job satisfaction increases linearly with age, with no turning point." = "wrong1",
                 "Job satisfaction increases with age until ~33 years, then decreases as age continues to rise." = "correct_option",
                 "Job satisfaction decreases with age until ~33 years, then increases as age continues to rise." = "wrong3",
                 "The quadratic term has no effect on job satisfaction." = "wrong4")
             ),
             actionButton("submit_mr_tech16", "Submit Answer"),
             uiOutput("mr_tech16_feedback"),
             hr(),
             # M3 Q16: Interpretation of Mediation Analysis
             p("16. You test whether parental education (X) affects inherited wealth (Y, in $1M USD) through social connections (M, 0–10 scale). The mediation analysis yields the following results:"),
            p("Structural Equation Model (SEM) Results:"),
            tags$pre(
              "
################################################
# Mediation Model: Parental Education → Social Connections → Inherited Wealth
################################################

=== Direct Effects ===
                          Estimate   Std. Error   z-value   Pr(>|z|)
Parental Education → Social Connections   0.500      0.050     10.000    <0.001 ***
Social Connections → Inherited Wealth       0.800      0.060     13.333    <0.001 ***
Parental Education → Inherited Wealth       0.300      0.100      3.000    0.010 *

=== Indirect Effects ===
                          Estimate   Boot SE    95% CI (Lower, Upper)
Parental Education → Inherited Wealth (via Social Connections)  0.400      0.100

=== Total Effects ===
                          Estimate   Std. Error   z-value   Pr(>|z|)
Parental Education → Inherited Wealth       0.700      0.080      8.750    <0.001 ***

---
Signif. codes: 0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
"
            ),
             p("How would you interpret these mediation results?"),
             textAreaInput("mr_tech17_answer", "", placeholder = "Type your interpretation here..."),
             actionButton("submit_mr_tech17", "Compare My Answer"),
             uiOutput("mr_tech17_feedback"),
           ),
           # Module 4. Multiple Regression: Diagnostics
           "mr_diagnostics" = div(
             h3("Multiple Regression: Diagnostics"),
             # M4 Q1: Identifying the Incorrect Regression Assumption
             p("1. Which of the following statements about linear regression assumptions is incorrect?"),
             radioButtons(
               "mr_diag1_answer",
               "",
               c("The relationship between the independent variables and the dependent variable should be linear." = "correct1",
                 "The error terms should be normally distributed with a mean of zero." = "correct2",
                 "The independent variables should be uncorrelated with each other (no multicollinearity)." = "correct3",
                 "The variance of the error terms should be constant across all levels of the independent variables (homoscedasticity)." = "correct4",
                 "The error terms should be independent of each other (no autocorrelation)." = "correct5",
                 "The dependent variable must be normally distributed." = "wrong6")
             ),
             actionButton("submit_mr_diag1", "Submit Answer"),
             uiOutput("mr_diag1_feedback"),
             hr(),
             # M4 Q2: Identifying Violated Assumptions in a Social Science Distribution
             p("2. You are analyzing hourly wages (USD) in a survey. The distribution of wages shows:"),
             tags$ul(
               tags$li("A long right tail (most wages are low, but a few are extremely high)."),
               tags$li("The variance of residuals increases as predicted wages increase."),
               tags$li("The residuals are normally distributed when plotted.")
             ),
             p("Which regression assumption is violated by this distribution?"),
             textAreaInput("mr_diag2_answer", "", placeholder = "Type your answer here..."),
             actionButton("submit_mr_diag2", "Compare My Answer"),
             uiOutput("mr_diag2_feedback"),
             hr(),
             # M4 Q3: Reverse Causation Solutions
             p("3. Which of the following is NOT a potential solution when dealing with reverse causation in regression analysis?"),
             radioButtons(
               "mr_diag3_answer",
               "",
               c("Use instrumental variables (IV) to isolate exogenous variation." = "correct1",
                 "Conduct a randomized controlled trial (RCT) to establish causal direction." = "correct2",
                 "Add interaction terms to the regression model." = "wrong3",
                 "Use lagged predictors to establish temporal precedence." = "correct4")
             ),
             actionButton("submit_mr_diag3", "Submit Answer"),
             uiOutput("mr_diag3_feedback"),
             hr(),
             # M4 Q4: Heteroskedasticity
             p("4. You suspect heteroskedasticity in your regression model. Which of the following is the best approach to address it?"),
             radioButtons(
               "mr_diag4_answer",
               "",
               c("Remove outliers from the dataset." = "wrong1",
                 "Use robust standard errors (Huber-White standard errors)." = "correct2",
                 "Dichotomize the dependent variable to simplify the analysis." = "wrong3",
                 "Assume normality of residuals and proceed with OLS." = "wrong4")
             ),
             actionButton("submit_mr_diag4", "Submit Answer"),
             uiOutput("mr_diag4_feedback"),
             hr(),
             # M4 Q5: Interpretation of the Breusch-Pagan Test
             p("5. You estimate a regression model to explain life satisfaction (0–10 scale) based on income (log-transformed) and education level (years). To test for heteroskedasticity, you conduct a Breusch-Pagan test and obtain the following results:"),
             p("Breusch-Pagan Test for Heteroskedasticity:"),
             tags$pre(
               "
Breusch-Pagan test for heteroskedasticity

data:  your_model
BP = 12.45, df = 2, p-value = 0.002

alternative hypothesis: heteroskedasticity
"
             ),
             p("How would you interpret these Breusch-Pagan test results?"),
             textAreaInput("mr_diag5_answer", "", placeholder = "Type your interpretation here..."),
             actionButton("submit_mr_diag5", "Compare My Answer"),
             uiOutput("mr_diag5_feedback"),
             hr(),
             # M4 Q6: Normality Assumption in Small Samples
             p("6. In small samples, violating the normality assumption of residuals can severely bias the estimated regression coefficients and their standard errors."),
             radioButtons(
               "mr_diag6_answer",
               "",
               c("True" = "false",
                 "False" = "correct",
                 "Cannot be said" = "cannot_say")
             ),
             actionButton("submit_mr_diag6", "Submit Answer"),
             uiOutput("mr_diag6_feedback"),
             hr(),
             # M4 Q7: Normality Assumption in Large Samples
             p("7. In large samples, the Central Limit Theorem ensures that the normality assumption of residuals is less critical for the validity of hypothesis tests and confidence intervals."),
             radioButtons(
               "mr_diag7_answer",
               "",
               c("True" = "correct",
                 "False" = "false",
                 "Cannot be said" = "cannot_say")
             ),
             actionButton("submit_mr_diag7", "Submit Answer"),
             uiOutput("mr_diag7_feedback"),
             hr(),
             # M4 Q8: Justifying Weighted Regression for Heteroscedasticity
             p("8. A student analyzes inherited wealth (in $1M USD) using a regression model with parental education (years) and family size (number of siblings) as predictors. They detect heteroscedasticity: the variance of residuals increases with higher levels of inherited wealth."),
             p("To address this, the student decides to use weighted least squares (WLS) with weights inversely proportional to the variance of inherited wealth."),
             p("How can you justify the use of weighted regression in this context?"),
             textAreaInput("mr_diag8_answer", "", placeholder = "Type your justification here..."),
             actionButton("submit_mr_diag8", "Compare My Answer"),
             uiOutput("mr_diag8_feedback"),
             hr(),
             # M4 Q9: Identifying Multicollinearity Contexts
             p("9. In which of the following scenarios is multicollinearity least likely to be a problem?"),
             radioButtons(
               "mr_diag9_answer",
               "",
               c("Using group-level data (e.g., country-level GDP and average education level)." = "wrong1",
                 "Including polynomial terms (e.g., X and X²) in the same model." = "wrong2",
                 "Using orthogonal predictors (e.g., principal components from PCA)." = "correct3",
                 "Including highly correlated predictors (e.g., height and weight in a health study)." = "wrong4")
             ),
             actionButton("submit_mr_diag9", "Submit Answer"),
             uiOutput("mr_diag9_feedback"),
             hr(),
             # M4 Q10: Non-Influential Outliers
             p("10. In regression analysis, what does it mean when outliers are non-influential in terms of their residual distance and their leverage?"),
             textAreaInput("mr_diag10_answer", "", placeholder = "Type your explanation here..."),
             actionButton("submit_mr_diag10", "Compare My Answer"),
             uiOutput("mr_diag10_feedback"),
             hr(),
             # M4 Q11: Potential Problems When Removing Outliers
             p("11. What are the potential problems when removing outliers? Address each of the following aspects:"),
             tags$ol(
               tags$li(
                 tags$p("Significance of results:"),
                 textAreaInput("mr_diag11_sig", "", placeholder = "Type your answer here...")
               ),
               tags$li(
                 tags$p("Variance/standard deviation:"),
                 textAreaInput("mr_diag11_var", "", placeholder = "Type your answer here...")
               ),
               tags$li(
                 tags$p("Regression fit:"),
                 textAreaInput("mr_diag11_fit", "", placeholder = "Type your answer here...")
               ),
               tags$li(
                 tags$p("Subgroups in the data:"),
                 textAreaInput("mr_diag11_sub", "", placeholder = "Type your answer here...")
               )
             ),
             actionButton("submit_mr_diag11", "Compare My Answers"),
             uiOutput("mr_diag11_feedback"),
           ),
           # Module 5. Logistic Regression
             "binary_models" = div(
               h3("Logistic Regression"),
               # M5 Q1: Problems of the Linear Probability Model
               p("1. What are the main problems associated with using a Linear Probability Model for binary outcomes (e.g., 0/1 variables)?"),
               textAreaInput("binary1_answer", "", placeholder = "Type your answer here..."),
               actionButton("submit_binary1", "Compare My Answer"),
               uiOutput("binary1_feedback"),
               hr(),
               # M5 Q2: Transforming Probabilities, Odds, and Log-Odds
               p("2. In a study of voter turnout, the probability that a young adult votes is 0.25."),
               tags$ol(
                 tags$li(
                   tags$p("Transform this probability into odds:"),
                   numericInput("binary2_odds", "", value = NA)
                 ),
                 tags$li(
                   tags$p("Transform the odds into log-odds:"),
                   numericInput("binary2_logodds", "", value = NA)
                 ),
                 tags$li(
                   tags$p("If the log-odds of voting for an older adult are 1.0986, transform this back into a probability:"),
                   numericInput("binary2_prob", "", value = NA)
                 )
               ),
               actionButton("submit_binary2", "Check My Answers"),
               uiOutput("binary2_feedback"),
               hr(),
               # M5 Q3: Distribution of Odds
               p("3. The odds of an event (e.g., p/(1-p)) are bounded between 0 and 1, just like probabilities."),
               radioButtons(
                 "binary3_answer",
                 "",
                 c("True" = "false",
                   "False" = "correct",
                   "Cannot say" = "cannot_say")
               ),
               actionButton("submit_binary3", "Submit Answer"),
               uiOutput("binary3_feedback"),
               hr(),
               # M5 Q4: Distribution of Log-Odds
               p("4. The log-odds (logit) of an event can take any real value, from -∞ to +∞."),
               radioButtons(
                 "binary4_answer",
                 "",
                 c("True" = "correct",
                   "False" = "false",
                   "Cannot say" = "cannot_say")
               ),
               actionButton("submit_binary4", "Submit Answer"),
               uiOutput("binary4_feedback"),
               hr(),
               # M5 Q5: Logistic Regression Results
               p("5. You estimate a logistic regression model to explain political participation (1 = participated, 0 = did not participate) based on Education (years) and Income (log-transformed). The results are:"),
               p("Logistic Regression Results:"),
               tags$pre(
                 "
            Estimate   Std. Error   z value   Pr(>|z|)
(Intercept)   -2.5000     0.2000    -12.500    <0.001 ***     
Education      0.3000     0.0500      6.000    <0.001 ***
Income         0.5000     0.0600      8.333    <0.001 ***
---
Signif. codes: 0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
"
               ),
               tags$ol(
                 tags$li(
                   tags$p("Interpret the coefficient for Education in terms of odds:"),
                   textAreaInput("binary5_odds", "", placeholder = "Type your interpretation here...")
                 ),
                 tags$li(
                   tags$p("Interpret the coefficient for Income in terms of logits:"),
                   textAreaInput("binary5_logits", "", placeholder = "Type your interpretation here...")
                 ),
                 tags$li(
                   tags$p("Provide a substantive explanation for these results and their implications:"),
                   textAreaInput("binary5_explain", "", placeholder = "Type your explanation here...")
                 )
               ),
               actionButton("submit_binary5", "Compare My Answers"),
               uiOutput("binary5_feedback"),
               hr(),
               # M5 Q6: Interpretation of glht() Contrast Results
               p("6. You estimate a logistic regression model in R to predict college graduation (1 = graduated, 0 = did not graduate) using high school type (factor: Public, Private, Charter) as a predictor. You use glht() to test custom contrasts, comparing Private vs. Public and Charter vs. Public."),
               p("The glht() output for the contrast Private vs. Public is:"),
               tags$pre(
                 "Estimate = 1.20, SE = 0.30, z = 4.00, p < 0.001"
               ),
               p("How should you interpret the Estimate = 1.20 for the Private vs. Public contrast?"),
               radioButtons(
                 "binary6_answer",
                 "",
                 c("The odds ratio of graduating for Private vs. Public is 1.20." = "wrong1",
                   "The log-odds difference of graduating for Private vs. Public is 1.20." = "correct",
                   "The probability difference of graduating for Private vs. Public is 1.20." = "wrong3",
                   "The z-score for the difference in graduation rates between Private and Public is 1.20." = "wrong4")
               ),
               actionButton("submit_binary6", "Submit Answer"),
               uiOutput("binary6_feedback"),
               hr(),
               # M5 Q7: Interpretation of predictions() with datagrid
               p("7. You estimate a logistic regression model in R to predict voter turnout (1 = voted, 0 = did not vote) based on Age (30, 50, 70 years) and Education (factor: High School, College, Advanced Degree)."),
               p("You use the following code to generate predicted probabilities:"),
               tags$pre(
                 "library(marginaleffects)",
                 "mod <- glm(voted ~ age + education, data = df, family = binomial)",
                 "predictions(mod, datagrid(age = c(30, 50, 70), education = c('High School', 'College', 'Advanced Degree')))"
               ),
               p("The output includes the following predicted probability for 50-year-olds with a College degree:"),
               tags$pre(
                 "age education   predicted",
                 "50  College     0.68"
               ),
               p("How would you interpret the predicted probability of 0.68 for 50-year-olds with a College degree?"),
               textAreaInput("binary7_answer", "", placeholder = "Type your interpretation here..."),
               actionButton("submit_binary7", "Compare My Answer"),
               uiOutput("binary7_feedback"),
               hr(),
               # M5 Q8: Identifying the Wrong Statement About the Likelihood Ratio Test
               p("8. You estimate two nested logistic regression models to predict support for a universal basic income policy (1 = support, 0 = oppose):"),
               tags$ul(
                 tags$li("Model 1: Includes only income (log-transformed)."),
                 tags$li("Model 2: Includes income and education level (factor: low, medium, high).")
               ),
               p("You perform a Likelihood Ratio Test (LRT) to compare the two models. The test statistic is χ² = 12.5, with df = 3 and p < 0.01."),
               p("Which of the following statements about the LRT result is incorrect?"),
               radioButtons(
                 "binary8_answer",
                 "",
                 c("The LRT tests whether the addition of education level significantly improves the model fit compared to the model with only income." = "wrong1",
                   "A significant LRT (p < 0.01) suggests that education level explains a significant amount of variation in policy support beyond what is explained by income alone." = "wrong2",
                   "The LRT statistic (χ² = 12.5) directly indicates the magnitude of the effect of education level on policy support." = "correct",
                   "The degrees of freedom (df = 3) correspond to the number of additional parameters added in Model 2 (for the 3-level education factor)." = "wrong4")
               ),
               actionButton("submit_binary8", "Submit Answer"),
               uiOutput("binary8_feedback"),
               hr(),
               # M5 Q9: McFadden’s Pseudo-R²
               p("9. You estimate a logistic regression model to predict adoption of a renewable energy policy (1 = adopted, 0 = not adopted) by municipalities. The log-likelihood of the null model (intercept only) is -350.2, and the log-likelihood of your full model (with predictors: population size, political alignment, and budget) is -220.5."),
               tags$ol(
                 tags$li(
                   tags$p("Calculate McFadden’s Pseudo-R²:"),
                   numericInput("binary9_pseudoR2", "", value = NA)
                 ),
                 tags$li(
                   tags$p("Interpret the value you calculated:"),
                   textAreaInput("binary9_interpret", "", placeholder = "Type your interpretation here...")
                 )
               ),
               actionButton("submit_binary9", "Check My Answers"),
               uiOutput("binary9_feedback"),
               hr(),
               # M5 Q10: Interpretation of the Wald Test
               p("10. You estimate a logistic regression model to predict support for a new immigration policy (1 = support, 0 = oppose) using age, education level, and political ideology as predictors. The Wald test for the coefficient of political ideology yields a z-statistic of 2.8 and a p-value of 0.005."),
               p("Statement: The Wald test result (z = 2.8, p = 0.005) indicates that political ideology has a statistically significant effect on support for the immigration policy, and the magnitude of this effect is large."),
               radioButtons(
                 "binary10_answer",
                 "",
                 c("True" = "false",
                   "False" = "correct",
                   "Cannot say" = "cannot_say")
               ),
               actionButton("submit_binary10", "Submit Answer"),
               uiOutput("binary10_feedback"),
               hr(),
               # M5 Q11: Interpretation of Logistic Regression with Interaction
               p("11. You estimate a logistic regression model to predict support for a carbon tax (1 = support, 0 = oppose) based on Income (log-transformed, mean-centered), Political Ideology (1 = liberal, 0 = conservative), and their interaction."),
               p("The output is:"),
              tags$pre(
                "
Call:
glm(formula = outcome ~ income + political_ideology + income:political_ideology,
    family = binomial, data = your_data)

Coefficients:
                                Estimate   Std. Error   z value   Pr(>|z|)   
(Intercept)                      -1.2000      0.2000    -6.000    <0.001 ***       
income                             0.5000      0.1500     3.333     0.010 *      
political_ideologyLiberal          1.8000      0.3000     6.000    <0.001 ***     
income:political_ideologyLiberal   -0.4000      0.2000    -2.000     0.050 .    
---
Signif. codes: 0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)
"
              ),
               p("Which of the following interpretations of the interaction effect is correct?"),
               radioButtons(
                 "binary11_answer",
                 "",
                 c("The effect of income on support for the carbon tax is stronger for liberals than for conservatives." = "wrong1",
                   "The effect of political ideology on support for the carbon tax is negative for high-income individuals." = "correct",
                   "The odds ratio for income is 1.65 for conservatives and 0.67 for liberals." = "wrong3",
                   "The interaction indicates that income has no effect on support for the carbon tax among liberals, but a positive effect among conservatives." = "wrong4")
               ),
               actionButton("submit_binary11", "Submit Answer"),
               uiOutput("binary11_feedback"),
               hr(),
               # M5 Q12: Problems in Multinomial Logistic Regression
               p("12. You estimate a multinomial logistic regression to analyze public preferences for three carbon tax policies: No tax (baseline), Low tax (5% on emissions), and High tax (20% on emissions)."),
               p("Which of the following statements about problems in multinomial logistic regression is incorrect?"),
               radioButtons(
                 "binary12_answer",
                 "",
                 c("The Independence of Irrelevant Alternatives (IIA) assumption is often violated if some policy options are similar (e.g., low tax and high tax are both tax-based solutions)." = "wrong1",
                   "Small cell counts in the dependent variable (e.g., very few respondents preferring the high tax) can lead to unstable estimates and convergence issues." = "wrong2",
                   "Multicollinearity between predictor variables (e.g., income and education) is not a concern in multinomial logistic regression because the model uses maximum likelihood estimation." = "correct",
                   "Interpretation of coefficients is less intuitive than in binary logistic regression, as each predictor has multiple coefficients (one for each non-baseline outcome)." = "wrong4")
               ),
               actionButton("submit_binary12", "Submit Answer"),
               uiOutput("binary12_feedback"),
               hr(),
               # M5 Q13: Interpretation of Ordinal Logistic Regression
               p("13. You estimate an ordinal logistic regression using MASS::polr() to analyze level of support for a carbon tax policy (1 = strongly oppose, 2 = somewhat oppose, 3 = neutral, 4 = somewhat support, 5 = strongly support) based on Income (log-transformed, mean-centered), Education (years), and Political Ideology (1 = conservative, 2 = moderate, 3 = liberal)."),
               p("The output is:"),
               tags$pre(
                 "library(MASS)",
                 "mod <- polr(",
                 "  factor(support) ~ income + education + political_ideology,",
                 "  data = df,",
                 "  Hess = TRUE",
                 ")",
                 "summary(mod)",
                 "",
                 "# Output:",
                 "# Coefficients:",
                 "#                     Value    Std. Error   t value",
                 "# income             -0.450      0.120      -3.750",
                 "# education           0.300      0.080       3.750",
                 "# political_ideology  1.200      0.150       8.000",
                 "# ",
                 "# Intercepts:",
                 "#             Value    Std. Error   t value",
                 "# 1|2         -2.000     0.400      -5.000",
                 "# 2|3         -0.500     0.300      -1.667",
                 "# 3|4          0.500     0.300       1.667",
                 "# 4|5          2.000     0.400       5.000"
               ),
               p("Interpret the results of this ordinal logistic regression. Address the following in your answer:"),
               tags$ol(
                 tags$li("The direction and magnitude of each predictor’s effect."),
                 tags$li("The meaning of the intercepts (1|2, 2|3, etc.)."),
                 tags$li("The substantive implications of the results for carbon tax policy support.")
               ),
               textAreaInput("binary13_answer", "", placeholder = "Type your interpretation here..."),
               actionButton("submit_binary13", "Compare My Answer"),
               uiOutput("binary13_feedback"),
             ),
           #Module 6: Poisson Regression
           "count_models" = div(
             h3("Poisson Regression"),
             # M6 Q1: Identifying Count Data
             p("1. Which of the following variables are best described as count data? Select all that apply."),
             checkboxGroupInput(
               "count1_answer",
               "",
               c("Number of protests in a city per year" = "correct1",
                 "Annual income (in USD)" = "wrong2",
                 "Number of patents filed by a firm" = "correct3",
                 "Body mass index (BMI)" = "wrong4",
                 "Number of hospital visits per patient" = "correct5",
                 "Temperature (in Celsius)" = "wrong6",
                 "Number of children in a household" = "correct7",
                 "Blood pressure (mmHg)" = "wrong8",
                 "Number of publications by a researcher" = "correct9",
                 "Time spent studying (in hours)" = "wrong10")
             ),
             actionButton("submit_count1", "Submit Answer"),
             uiOutput("count1_feedback"),
             hr(),
             # M6 Q2: Why Is OLS Regression Inappropriate for Count Data?
             p("2. Why would it be inappropriate to use ordinary least squares (OLS) regression for count data? Provide at least three reasons in your answer."),
             textAreaInput("count2_answer", "", placeholder = "Type your answer here..."),
             actionButton("submit_count2", "Compare My Answer"),
             uiOutput("count2_feedback"),
             hr(),
             # M6 Q3: Interpretation of Poisson Regression Output
             p("3. You estimate a Poisson regression model using glm() in R to analyze the number of protest events in a city, based on Unemployment Rate (percentage, mean-centered), Police Presence (number of officers per 1,000 residents, log-transformed), and Government Popularity (scaled 0–100)."),
             p("The output is:"),
             tags$pre(
               "summary(glm(protest_events ~ unemployment + police_presence + gov_popularity,",
               "            data = df, family = poisson))",
               "",
               "# Coefficients:",
               "#                 Estimate   Std. Error   z value   Pr(>|z|)",
               "# (Intercept)      1.2000     0.1500      8.000     < 2e-16 ***",
               "# unemployment      0.3000     0.0800      3.750     0.00017 ***",
               "# police_presence  -0.5000     0.1200     -4.167     3.1e-05 ***",
               "# gov_popularity   -0.0200     0.0080     -2.500     0.01240 *  ",
               "# ---",
               "# (Dispersion parameter for poisson family taken to be 1)"
             ),
             p("Which of the following statements about the interpretation of the coefficients is correct?"),
             radioButtons(
               "count3_answer",
               "",
               c("A one-unit increase in unemployment rate is associated with a 0.3-unit increase in the expected number of protest events." = "wrong1",
                 "A 1% increase in unemployment rate is associated with a 33% increase in the expected number of protest events (exp(0.30) ≈ 1.35)." = "wrong2",
                 "A one-unit increase in log(police presence) is associated with a 0.5-unit decrease in the log(expected number) of protest events." = "correct",
                 "Government popularity has no statistically significant effect on protest events (p = 0.012)." = "wrong4")
             ),
             actionButton("submit_count3", "Submit Answer"),
             uiOutput("count3_feedback"),
             hr(),
             # M6 Q4: Overdispersion and Underdispersion
             p("4. Statement: In count data models, overdispersion occurs when the variance of the data is greater than the mean, while underdispersion occurs when the variance is less than the mean. Both overdispersion and underdispersion can be addressed by using a Negative Binomial regression model."),
             radioButtons(
               "count4_answer",
               "",
               c("True" = "false",
                 "False" = "correct",
                 "Cannot say" = "cannot_say")
             ),
             actionButton("submit_count4", "Submit Answer"),
             uiOutput("count4_feedback"),
             hr(),
             # M6 Q5 (Bonus): Zero-Inflated Negative Binomial Regression
             p("[BONUS QUESTION] You estimate a zero-inflated negative binomial regression using pscl::zeroinfl() in R to analyze the number of scientific collaborations (count) among researchers, accounting for excess zeros (researchers with no collaborations). The model includes Funding (log-transformed, in USD) and Seniority (years since PhD)."),
             p("The output is:"),
             tags$pre(
               "library(pscl)",
               "mod <- zeroinfl(collaborations ~ funding + seniority | funding + seniority,",
               "                data = df, dist = 'negbin')",
               "summary(mod)",
               "",
               "# Output:",
               "# Count model coefficients (negbin with log link):",
               "#             Estimate   Std. Error   z value   Pr(>|z|)",
               "# (Intercept)  1.2000     0.2500      4.800     1.6e-06 ***",
               "# funding       0.4000     0.1000      4.000     6.4e-05 ***",
               "# seniority     0.1500     0.0500      3.000     0.00267 ** ",
               "# ",
               "# Zero-inflation model coefficients (binomial with logit link):",
               "#             Estimate   Std. Error   z value   Pr(>|z|)",
               "# (Intercept) -1.5000     0.3000     -5.000     5.7e-07 ***",
               "# funding      -0.6000     0.1500     -4.000     6.4e-05 ***",
               "# seniority    -0.2000     0.0800     -2.500     0.01240 *  ",
               "# ---",
               "# Theta: 1.8000",
               "# Number of iterations in BFGS optimization: 20",
               "# Log-likelihood: -850.2 on 5 Df"
             ),
             p("What is the main difference between a zero-inflated negative binomial regression and a standard negative binomial regression? Refer to the coefficients in the output above in your answer."),
             textAreaInput("count_bonus_answer", "", placeholder = "Type your answer here..."),
             actionButton("submit_count_bonus", "Compare My Answer"),
             uiOutput("count_bonus_feedback"),
           ),
           #Module 7: Fixed- and Random-Effects Models
           "panel_models" = div(
             h3("Fixed- and Random-Effects Models"),
             # M7 Q1: Advantages of Longitudinal Data
             p("1. Which of the following statements about the advantages of longitudinal data is incorrect?"),
             radioButtons(
               "panel1_answer",
               "",
               c("Longitudinal data allow researchers to study within-subject changes over time, controlling for unobserved time-invariant heterogeneity." = "wrong1",
                 "Longitudinal data eliminate the risk of omitted variable bias because all confounding variables are measured at every time point." = "correct",
                 "Longitudinal data enable the estimation of causal effects by establishing temporal ordering between predictors and outcomes." = "wrong3",
                 "Longitudinal data reduce reliance on retrospective recall, as repeated measurements are collected in real time." = "wrong4")
             ),
             actionButton("submit_panel1", "Submit Answer"),
             uiOutput("panel1_feedback"),
             hr(),
             # M7 Q2: Age-Cohort-Period Identification Problem
             p("2. In social science research, you often analyze how attitudes toward climate change vary by:"),
             tags$ul(
               tags$li("Age (e.g., 20, 30, 40, 50, 60 years old)"),
               tags$li("Cohort (e.g., born in 1950, 1960, 1970, 1980, 1990)"),
               tags$li("Period (e.g., surveyed in 2000, 2005, 2010, 2015, 2020)")
             ),
             p("What is the age-cohort-period (ACP) identification problem on an analytical level? Why is it challenging to estimate the independent effects of age, cohort, and period?"),
             textAreaInput("panel2_answer", "", placeholder = "Type your answer here..."),
             actionButton("submit_panel2", "Compare My Answer"),
             uiOutput("panel2_feedback"),
             hr(),
             # M7 Q3: Interpreting xtsum() Output
             p("3. You use plm::xtsum() to summarize two variables from a panel dataset on welfare spending and GDP per capita across 10 countries over 20 years:"),
             tags$ul(
               tags$li("Welfare spending (% of GDP, time-varying)"),
               tags$li("Colonial history (binary: 1 = former colony, 0 = not, time-constant)")
             ),
             p("The output is:"),
             tags$pre(
               "library(plm)",
               "xtsum(welfare_spending + colonial_history, data = panel_df)",
               "",
               "# Output:",
               "#       Variable      Mean       Std. Dev.      Min        Max   Observations",
               "# ---------------------------------------------------------------------------------",
               "# welfare_spending   12.5000     3.2000         5.0000     20.0000   N = 200",
               "#                     12.5000     2.8000         7.0000     18.0000   n = 10",
               "#                     12.5000     1.5000         9.0000     15.0000   T = 20",
               "# ",
               "# colonial_history   0.6000      0.4900         0.0000     1.0000    N = 200",
               "#                     0.6000      0.5164         0.0000     1.0000   n = 10",
               "#                     0.6000      0.0000         0.6000     0.6000   T = 20",
               "# ",
               "# Key:",
               "#   N = Total observations",
               "#   n = Number of countries",
               "#   T = Number of time periods"
             ),
             p("Interpret the descriptive statistics for welfare spending and colonial history. Address the following:"),
             tags$ol(
               tags$li("What does the difference between the overall, between, and within standard deviations for welfare_spending indicate?"),
               tags$li("Why is the within standard deviation for colonial_history equal to 0?")
             ),
             textAreaInput("panel3_answer", "", placeholder = "Type your answer here..."),
             actionButton("submit_panel3", "Compare My Answer"),
             uiOutput("panel3_feedback"),
             hr(),
             # M7 Q4: Fixed-Effects Linear Models
             p("4. Statement: In a fixed-effects linear model, the within-transformation (demeaning) removes all time-invariant variables, so their coefficients cannot be estimated. This means fixed-effects models only use within-subject variation for estimation."),
             radioButtons(
               "panel4_answer",
               "",
               c("True" = "correct",
                 "False" = "false",
                 "Cannot say" = "cannot_say")
             ),
             actionButton("submit_panel4", "Submit Answer"),
             uiOutput("panel4_feedback"),
             hr(),
             # M7 Q5: First-Difference Linear Models
             p("5. Statement: The first-difference linear model is equivalent to a fixed-effects model when the time intervals between observations are equal and there are only two time periods. For more than two time periods, the first-difference model is less efficient than fixed-effects because it discards more information."),
             radioButtons(
               "panel5_answer",
               "",
               c("True" = "correct",
                 "False" = "false",
                 "Cannot say" = "cannot_say")
             ),
             actionButton("submit_panel5", "Submit Answer"),
             uiOutput("panel5_feedback"),
             hr(),
             # M7 Q6: Unobservable and Observable Causes
             p("6. Instructions: Fill in the missing word in each statement."),
             tags$ol(
               tags$li(
                 tags$p("In a fixed-effects linear model, unobservable time-",
                        textInput("panel6_blank1", "", placeholder = "Type the missing word here"),
                        " heterogeneity (e.g., cultural norms, institutional legacies) is automatically controlled by demeaning the data, allowing for unbiased estimation of within-subject effects."),
                 tags$p(HTML("<em>Hint: Think about what type of heterogeneity fixed-effects models are designed to address.</em>"))
               ),
               tags$li(
                 tags$p("Fixed-effects models cannot estimate the effects of time-invariant observable variables (e.g., gender, colonial history) because these variables are ",
                        textInput("panel6_blank2", "", placeholder = "Type the missing word here"),
                        " by the within-transformation."),
                 tags$p(HTML("<em>Hint: Think about what happens to time-constant variables in the demeaning process.</em>"))
               )
             ),
             actionButton("submit_panel6", "Submit Answer"),
             uiOutput("panel6_feedback"),
             hr(),
             # M7 Q7: Interpretation of Conditional Logistic Regression
             p("7. You estimate a conditional logistic regression using survival::clogit() to analyze the probability of being selected for a high-level political appointment among candidates from wealthy families. The dataset includes matched pairs of candidates (one selected, one not) with identical family backgrounds but differing in inherited wealth, education level, and political connections."),
             p("The output is:"),
             tags$pre(
               "library(survival)",
               "mod <- clogit(",
               "  appointment ~ inherited_wealth + education + political_connections + strata(family_id),",
               "  data = candidates",
               ")",
               "summary(mod)",
               "",
               "# Output:",
               "# Coefficients:",
               "#                     coef   exp(coef)   se(coef)      z       Pr(>|z|)",
               "# inherited_wealth    0.40      1.490      0.120    3.33      0.00087 ***",
               "# education2           0.80      2.225      0.250    3.20      0.00136 ** ",
               "# education3           1.20      3.320      0.300    4.00      6.4e-05 ***",
               "# political_connections 1.50      4.482      0.200    7.50      6.2e-14 ***",
               "# ---",
               "# Likelihood ratio test=52.3 on 4 df, p=1.2e-10  n=400, number of events=200"
             ),
             p("Questions:"),
             tags$ol(
               tags$li(
                 tags$p("Interpret the coefficient for inherited_wealth in terms of odds ratios and substantive meaning."),
                 textAreaInput("panel7_q1", "", placeholder = "Type your answer here...")
               ),
               tags$li(
                 tags$p("Compare the effect of education3 (professional degree) to education2 (graduate degree). What does this imply about the role of education in political appointments?"),
                 textAreaInput("panel7_q2", "", placeholder = "Type your answer here...")
               ),
               tags$li(
                 tags$p("Why is family_id included as a strata variable in this model? What would happen if it were omitted?"),
                 textAreaInput("panel7_q3", "", placeholder = "Type your answer here...")
               )
             ),
             actionButton("submit_panel7", "Compare My Answers"),
             uiOutput("panel7_feedback"),
             hr(),
             # M7 Q8: Random Intercept Models
             p("8. Which of the following statements about random intercept models is correct?"),
             radioButtons(
               "panel8_answer",
               "",
               c("Random intercept models allow the effect of a predictor to vary across groups by estimating a unique slope for each group." = "wrong1",
                 "Random intercept models assume that the relationship between predictors and the outcome is identical across groups, but the baseline level of the outcome differs." = "correct",
                 "Random intercept models are equivalent to fixed-effects models when group-specific intercepts are included as dummy variables." = "wrong3",
                 "Random intercept models require at least three levels of nesting (e.g., students within classes within schools) to estimate group-level variation." = "wrong4")
             ),
             actionButton("submit_panel8", "Submit Answer"),
             uiOutput("panel8_feedback"),
             hr(),
             # M7 Q9: Random Slope Models
             p("9. Which of the following statements about random slope models is correct?"),
             radioButtons(
               "panel9_answer",
               "",
               c("Random slope models assume that the effect of a predictor is fixed across groups, but the intercept varies." = "wrong1",
                 "Random slope models allow the effect of a predictor to vary across groups by estimating group-specific slopes as random effects." = "correct",
                 "Random slope models are only appropriate for continuous predictors, not categorical predictors." = "wrong3",
                 "Random slope models cannot be estimated if the predictor has no within-group variation." = "wrong4")
             ),
             actionButton("submit_panel9", "Submit Answer"),
             uiOutput("panel9_feedback"),
             hr(),
             # M7 Q10: Interpretation of Hausman Test Output
             p("10. You estimate fixed-effects (FE) and random-effects (RE) models to analyze the impact of education spending (per student, in USD) on student test scores, controlling for socioeconomic status (SES). To decide between the two models, you run a Hausman test using the plm package in R:"),
             p("The output is:"),
             tags$pre(
               "library(plm)",
               "fe_model <- plm(test_score ~ educ_spending + ses, data = panel_data, model = 'within')",
               "re_model <- plm(test_score ~ educ_spending + ses, data = panel_data, model = 'random')",
               "phtest(fe_model, re_model)",
               "",
               "# Output:",
               "# Hausman Test",
               "#",
               "# data:  panel_data",
               "# chisq = 8.45, df = 2, p-value = 0.0146",
               "# alternative hypothesis: one model is inconsistent"
             ),
             p("Interpret the results of the Hausman test. What does this imply for the choice between the fixed-effects and random-effects models?"),
             textAreaInput("panel10_answer", "", placeholder = "Type your answer here..."),
             actionButton("submit_panel10", "Compare My Answer"),
             uiOutput("panel10_feedback"),
             hr(),
             # M7 Q11: Interpretation of Hybrid Model
             p("11. You estimate a hybrid model (fixed + random effects) using lme4::lmer() to analyze the impact of inherited wealth on political influence (standardized index) across families and regions. The model includes fixed effects for inherited wealth and education, a random intercept for family ID, and a random slope for inherited wealth by region."),
             p("The output is:"),
             tags$pre(
               "library(lme4)",
               "mod <- lmer(",
               "  political_influence ~ inherited_wealth + education + (1 | family_id) + (inherited_wealth - 1 | region),",
               "  data = wealth_data",
               ")",
               "summary(mod)",
               "",
               "# Output:",
               "# Fixed effects:",
               "#                 Estimate   Std. Error   t value",
               "# (Intercept)       0.5000      0.1500     3.333",
               "# inherited_wealth  0.3000      0.0800     3.750",
               "# education         0.1500      0.0400     3.750",
               "# ",
               "# Random effects:",
               "# Groups    Name               Variance  Std.Dev.  Corr",
               "# region    inherited_wealth   0.0200    0.1414",
               "# family_id (Intercept)        0.1000    0.3162",
               "# Residual                      0.2000    0.4472",
               "# ",
               "# Number of obs: 1000, groups:  family_id, 200; region, 10"
             ),
             p("Questions:"),
             tags$ol(
               tags$li(
                 tags$p("Interpret the fixed effect of inherited_wealth (0.30). What does this coefficient represent, and how should it be understood in the context of random slopes for regions?"),
                 textAreaInput("panel11_q1", "", placeholder = "Type your answer here...")
               ),
               tags$li(
                 tags$p("What does the variance of the random slope for inherited_wealth (0.02) imply about regional differences in the effect of inherited wealth on political influence?"),
                 textAreaInput("panel11_q2", "", placeholder = "Type your answer here...")
               )
             ),
             actionButton("submit_panel11", "Compare My Answers"),
             uiOutput("panel11_feedback"),
             hr(),
             # M7 Q12: Difference-in-Differences (DiD) Models
             p("12. Statement: In a Difference-in-Differences (DiD) design, the parallel trends assumption requires that the average outcome trends for the treatment and control groups would have been the same in the absence of treatment. If this assumption holds, DiD provides an unbiased estimate of the average treatment effect on the treated (ATT) even if there are unobserved time-invariant confounders."),
             radioButtons(
               "panel12_answer",
               "",
               c("True" = "correct",
                 "False" = "false",
                 "Cannot say" = "cannot_say")
             ),
             actionButton("submit_panel12", "Submit Answer"),
             uiOutput("panel12_feedback"),
           ),
           #Module 8: Event history analysis
           "event_history" = div(
             h3("Event History Analysis"),
             # M8 Q1: Identifying Censoring
             p("1. Which of the following cases is not an example of censoring in event history analysis?"),
             radioButtons(
               "event1_answer",
               "",
               c("A study participant drops out of a longitudinal study on unemployment duration before finding a job." = "wrong1",
                 "A company is observed until the end of the study period without experiencing a bankruptcy event." = "wrong2",
                 "A patient in a clinical trial dies from a cause unrelated to the disease under study before the event of interest (e.g., recovery) occurs." = "wrong3",
                 "A marriage ends in divorce after 10 years, and the exact date of divorce is recorded in the dataset." = "correct")
             ),
             actionButton("submit_event1", "Submit Answer"),
             uiOutput("event1_feedback"),
             hr(),
             # M8 Q2: Hazard Rates and Survivor Functions
             p("2. You study time to first employment (in years) for 100 recent graduates. The table below shows the number of graduates who find their first job (d_t) and the number still unemployed (n_t) at the start of each year:"),
             p("Survival analysis table:"),
             tags$pre(
               "
  Year   d_t   n_t
     1    20   100
     2    25    80
     3    20    55
     4    15    35
     5    10    20
     6    10    10
"
             ),
             p("Questions:"),
             tags$ol(
               tags$li(
                 tags$p("Calculate the hazard rate h(t) for each year t."),
                 textAreaInput("event2_q1", "", placeholder = "Type your answer here...")
               ),
               tags$li(
                 tags$p("Calculate the survivor function S(t) for each year t."),
                 textAreaInput("event2_q2", "", placeholder = "Type your answer here...")
               )
             ),
             actionButton("submit_event2", "Compare My Answers"),
             uiOutput("event2_feedback"),
             hr(),
             # M8 Q3: Hazard Rate
             p("3. Which of the following statements about the hazard rate is correct?"),
             radioButtons(
               "event3_answer",
               "",
               c("The hazard rate h(t) is the probability that the event of interest occurs at or before time t." = "wrong1",
                 "The hazard rate h(t) is always between 0 and 1, as it represents a probability." = "wrong2",
                 "The hazard rate h(t) can exceed 1 if the instantaneous risk of the event occurring at time t is high." = "correct",
                 "The hazard rate h(t) is the derivative of the survivor function S(t)." = "wrong4")
             ),
             actionButton("submit_event3", "Submit Answer"),
             uiOutput("event3_feedback"),
             hr(),
             # M8 Q4: Survivor Function
             p("4. Which of the following statements about the survivor function is correct?"),
             radioButtons(
               "event4_answer",
               "",
               c("The survivor function S(t) is the probability that the event of interest occurs at time t." = "wrong1",
                 "The survivor function S(t) is always non-increasing and ranges from 1 to 0." = "correct",
                 "The survivor function S(t) can take values greater than 1 if the hazard rate is negative." = "wrong3",
                 "The survivor function S(t) is the cumulative distribution function (CDF) of the event time." = "wrong4")
             ),
             actionButton("submit_event4", "Submit Answer"),
             uiOutput("event4_feedback"),
             hr(),
             # M8 Q5: Interpretation of Cox Proportional Hazards Model
             p("5. You estimate a Cox Proportional Hazards model to analyze the time to first political appointment among 500 candidates, using education level, political connections, and age at candidacy as predictors."),
             p("The output is:"),
             tags$pre(
               "library(survival)",
               "mod <- coxph(Surv(time, appointment) ~ education + political_connections + age, data = candidates)",
               "summary(mod)",
               "",
               "# Output:",
               "#               coef   exp(coef)   se(coef)      z      Pr(>|z|)",
               "# education2    0.50      1.649      0.150    3.33    0.00087 ***",
               "# education3    0.80      2.225      0.180    4.44    9.0e-06 ***",
               "# political_connections 1.20      3.320      0.200    6.00    1.9e-09 ***",
               "# age           -0.05      0.951      0.020   -2.50    0.01240 *  ",
               "# ---",
               "# Likelihood ratio test=50.2 on 4 df, p=1.2e-09  n= 500"
             ),
             p("Questions:"),
             tags$ol(
               tags$li(
                 tags$p("Interpret the coefficient for political_connections in terms of hazard ratios and substantive meaning."),
                 textAreaInput("event5_q1", "", placeholder = "Type your answer here...")
               ),
               tags$li(
                 tags$p("Compare the hazard ratios for education2 and education3. What does this imply about the role of education in securing a political appointment?"),
                 textAreaInput("event5_q2", "", placeholder = "Type your answer here...")
               ),
               tags$li(
                 tags$p("What does the negative coefficient for age (-0.05) suggest about the relationship between age and time to appointment?"),
                 textAreaInput("event5_q3", "", placeholder = "Type your answer here...")
               )
             ),
             actionButton("submit_event5", "Compare My Answers"),
             uiOutput("event5_feedback"),
             hr(),
             # M8 Q6: Cox Model with Time-Varying Covariates and Interactions
             p("6. You estimate a Cox Proportional Hazards model to analyze the time to adoption of a climate policy among 200 countries, using GDP per capita, political ideology, and their interactions with time and each other."),
             p("The output is:"),
             tags$pre(
               "library(survival)",
               "mod <- coxph(",
               "  Surv(start, end, adopt) ~ gdp + ideology + gdp:ttime + gdp:ideology,",
               "  data = countries,",
               "  tt = function(t) { t }",
               ")",
               "summary(mod)",
               "",
               "# Output:",
               "#                     coef   exp(coef)   se(coef)      z      Pr(>|z|)",
               "# gdp                 0.50      1.649      0.150    3.33    0.00087 ***",
               "# ideology2           0.30      1.349      0.200    1.50    0.13350   ",
               "# ideology3           0.80      2.225      0.200    4.00    6.4e-05 ***",
               "# gdp:ttime           -0.10      0.905      0.050   -2.00    0.04550 *  ",
               "# gdp:ideology2        0.20      1.221      0.100    2.00    0.04550 *  ",
               "# gdp:ideology3        0.40      1.492      0.120    3.33    0.00087 ***",
               "# ---",
               "# Likelihood ratio test=60.2 on 6 df, p=1.2e-10  n= 200"
             ),
             p("Question:"),
             tags$ol(
               tags$li(
                 tags$p("Interpret the interaction term gdp:ttime (-0.10). What does this coefficient imply about the effect of GDP on the hazard of policy adoption over time?"),
                 textAreaInput("event6_q1", "", placeholder = "Type your answer here...")
               )
             ),
             actionButton("submit_event6", "Compare My Answer"),
             uiOutput("event6_feedback"),
             hr(),
             # M8 Q7: Testing the Proportional Hazards Assumption
             p("7. You fit a Cox Proportional Hazards model to analyze time to promotion among 300 academics, using publication count, gender, and prestige of PhD institution as predictors. After fitting the model, you test the proportional hazards assumption using cox.zph():"),
             p("The output is:"),
             tags$pre(
               "library(survival)",
               "mod <- coxph(Surv(start, end, promote) ~ pub_count + gender + prestige, data = academics)",
               "zph <- cox.zph(mod)",
               "zph",
               "",
               "# Output:",
               "#                chisq df      p",
               "# pub_count     12.50  1 0.00041",
               "# gender         0.05  1 0.82300",
               "# prestige       3.80  1 0.05100",
               "# GLOBAL        15.20  3 0.00170"
             ),
             p("Question:"),
             tags$ol(
               tags$li(
                 tags$p("Interpret the output of cox.zph(). Which variables violate the proportional hazards assumption, and what are the implications for the model?"),
                 textAreaInput("event7_q1", "", placeholder = "Type your answer here...")
               )
             ),
             actionButton("submit_event7", "Compare My Answer"),
             uiOutput("event7_feedback")
             )
             )
  })

  # Feedback for M1 Q1
  observeEvent(input$submit_mcq1, {
    if (input$mcq1_answer == "correct_option") {
      output$mcq1_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> A hypothesis is a testable, falsifiable prediction derived from theory.")))
      })
    } else {
      output$mcq1_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M1 Q2
  observeEvent(input$submit_mcq2, {
    if (input$mcq2_answer == "correct_option") {
      output$mcq2_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> Descriptive statistics summarize and organize data, while inferential statistics use sample data to make generalizations about a population.")))
      })
    } else {
      output$mcq2_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M1 Q3
  observeEvent(input$submit_mcq3, {
    if (input$mcq3_answer == "correct_option") {
      output$mcq3_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> The sampling distribution of the sample mean will be normally distributed, regardless of the population distribution, as long as the sample size is sufficiently large.")))
      })
    } else {
      output$mcq3_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M1 Q4
  observeEvent(input$submit_mcq4, {
    if (input$mcq4_answer == "correct_option") {
      output$mcq4_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> A random sample is selected without any known probability of inclusion, while a probability sample ensures every unit in the population has a known, non-zero chance of being selected.")))
      })
    } else {
      output$mcq4_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M1 Q5
  observeEvent(input$submit_mcq5, {
    if (input$mcq5_answer == "correct_option") {
      output$mcq5_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> In a perfectly normal distribution, 95% of data points lie within ±2 standard deviations from the mean.")))
      })
    } else {
      output$mcq5_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M1 Q6
  observeEvent(input$submit_mcq6, {
    if (input$mcq6_answer == "correct_option") {
      output$mcq6_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> Range is most sensitive to extreme values (outliers).")))
      })
    } else {
      output$mcq6_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M1 Q7
  observeEvent(input$submit_mcq7, {
    if (input$mcq7_answer == "correct_option") {
      output$mcq7_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> An outlier is a data point that lies far from the other observations and may indicate unusual behavior or variability.")))
      })
    } else {
      output$mcq7_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M1 Q8
  observeEvent(input$submit_mcq8, {
    if (input$mcq8_answer == "correct_option") {
      output$mcq8_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> In a right-skewed distribution, the mean is greater than the median, and the median is greater than the mode.")))
      })
    } else {
      output$mcq8_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M1 Q9
  observeEvent(input$submit_calc1, {
    data <- c(3, 2, 2, 4, 3.5, 1)
    correct_sd <- round(sd(data), 2)
    user_answer <- round(as.numeric(input$calc1_answer), 2)
    
    if (abs(user_answer - correct_sd) < 0.01) {
      output$calc1_feedback <- renderUI({
        div(tags$p(HTML(paste("<span style='color:green;'>Correct!</span> The standard deviation is approximately", correct_sd, "."))))
      })
    } else {
      output$calc1_feedback <- renderUI({
        div(tags$p(HTML(paste("<span style='color:red;'>Try again!</span>"))))
      })
    }
  })
  
  # Feedback for M1 Q10
  observeEvent(input$submit_calc2, {
    N <- 500
    variance <- 1600
    std_dev <- sqrt(variance)
    correct_se <- round(std_dev / sqrt(N), 2)
    
    user_answer <- round(as.numeric(input$calc2_answer), 2)
    
    if (abs(user_answer - correct_se) < 0.01) {
      output$calc2_feedback <- renderUI({
        div(tags$p(HTML(paste("<span style='color:green;'>Correct!</span> The standard error is approximately", correct_se, "."))))
      })
    } else {
      output$calc2_feedback <- renderUI({
        div(tags$p(HTML(paste("<span style='color:red;'>Try again!</span>"))))
      })
    }
  })
  
  # Feedback for M1 Q11
  observeEvent(input$submit_calc3, {
    n <- 1089
    s <- 6.66
    x_bar <- 5.5
    z <- qnorm(0.975)
    se <- s / sqrt(n)
    margin_of_error <- z * se
    correct_lower <- round(x_bar - margin_of_error, 2)
    correct_upper <- round(x_bar + margin_of_error, 2)
    
    user_lower <- round(as.numeric(input$calc3_lower), 2)
    user_upper <- round(as.numeric(input$calc3_upper), 2)
    
    if (abs(user_lower - correct_lower) < 0.01 && abs(user_upper - correct_upper) < 0.01) {
      output$calc3_feedback <- renderUI({
        div(tags$p(HTML(paste("<span style='color:green;'>Correct!</span> The 95% confidence interval is approximately (",
                              correct_lower, ", ", correct_upper, ")."))))
      })
    } else {
      output$calc3_feedback <- renderUI({
        div(tags$p(HTML(paste("<span style='color:red;'>Try again!</span>"))))
      })
    }
  })
  
  # Feedback for M1 Q12
  observeEvent(input$submit_mcq9, {
    if (input$mcq9_answer == "correct_option") {
      output$mcq9_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> If we were to repeat the sampling process many times, 95% of the calculated confidence intervals would contain the true population mean.")))
      })
    } else {
      output$mcq9_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M2 Q1
  observeEvent(input$submit_mr1, {
    correct_p_null <- "p = 0.512"
    correct_p_alt <- "p > 0.512"
    correct_test_type <- "one-tailed"
    correct_zscore <- 2.33
    correct_pvalue <- 0.81
    correct_decision <- "not reject"
    
    user_p_null <- tolower(input$mr1_p_null)
    user_p_alt <- tolower(input$mr1_p_alt)
    user_test_type <- tolower(input$mr1_test_type)
    user_zscore <- round(as.numeric(input$mr1_zscore), 2)
    user_pvalue <- round(as.numeric(input$mr1_pvalue), 2)
    user_decision <- tolower(input$mr1_decision)
    
    p_null_correct <- grepl("p = 0.512", user_p_null)
    p_alt_correct <- grepl("p > 0.512", user_p_alt)
    test_type_correct <- user_test_type == correct_test_type
    zscore_correct <- abs(user_zscore - correct_zscore) < 0.01
    pvalue_correct <- abs(user_pvalue - correct_pvalue) < 0.01
    decision_correct <- user_decision == correct_decision
    
    if (p_null_correct && p_alt_correct && test_type_correct && zscore_correct && pvalue_correct && decision_correct) {
      output$mr1_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> All answers are correct. There is not enough evidence to conclude that there is an unnaturally high number of boys in the city.")))
      })
    } else {
      output$mr1_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")),
          tags$p(paste("1. Null hypothesis (proportion of boys):", correct_p_null)),
          tags$p(paste("2. Alternative hypothesis:", correct_p_alt)),
          tags$p(paste("3. Type of test:", correct_test_type)),
          tags$p(paste("4. Calculated z-score:", correct_zscore)),
          tags$p(paste("5. p-value:", correct_pvalue)),
          tags$p(paste("6. Decision:", correct_decision)))
      })
    }
  })
  
  # Feedback for M2 Q2
  observeEvent(input$submit_mr2, {
    if (input$mr2_answer == "correct_option") {
      output$mr2_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> The t-distribution has heavier tails than the normal distribution, making it more appropriate for small sample sizes or when the population standard deviation is unknown.")))
      })
    } else {
      output$mr2_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M2 Q3
  observeEvent(input$submit_mr3, {
    if (input$mr3_answer == "correct_option") {
      output$mr3_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> A Type I error occurs when the null hypothesis is incorrectly rejected when it is actually true.")))
      })
    } else {
      output$mr3_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M2 Q4
  observeEvent(input$submit_mr4, {
    cov_ab <- 45
    sd_a <- 6.7
    sd_b <- 8.2
    correct_r <- round(cov_ab / (sd_a * sd_b), 3)
    
    user_r <- round(as.numeric(input$mr4_correlation), 3)
    
    if (abs(user_r - correct_r) < 0.001) {
      output$mr4_feedback <- renderUI({
        div(tags$p(HTML(paste("<span style='color:green;'>Correct!</span> The correlation coefficient is approximately", correct_r, "."))))
      })
    } else {
      output$mr4_feedback <- renderUI({
        div(tags$p(HTML(paste("<span style='color:red;'>Try again!</span>"))))
      })
    }
  })
  
  # Feedback for M2 Q5
  observeEvent(input$submit_mr5, {
    correct_word1 <- "relationship"
    correct_word2 <- "positive"
    correct_word3 <- "linear"
    
    user_word1 <- tolower(input$mr5_word1)
    user_word2 <- tolower(input$mr5_word2)
    user_word3 <- tolower(input$mr5_word3)
    
    word1_correct <- user_word1 == correct_word1
    word2_correct <- user_word2 == correct_word2
    word3_correct <- user_word3 == correct_word3
    
    if (word1_correct && word2_correct && word3_correct) {
      output$mr5_feedback <- renderUI({
        div(tags$p(HTML("<span style='color:green;'>Correct!</span> All answers are correct.")))
      })
    } else {
      output$mr5_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")),
          tags$p(paste("a. The correlation coefficient (Pearson’s r) measures the linear [", correct_word1, "] between two variables.")),
          tags$p(paste("b. The correlation coefficient ranges from -1 to 1, where 1 indicates a perfect [", correct_word2, "]")),
          tags$p(paste("c. A correlation coefficient of 0 indicates no [", correct_word3, "] relationship between the variables.")))
      })
    }
  })
  
  # Feedback for M2 Q6
  observeEvent(input$submit_mr6, {
    if (input$mr6_answer == "correct_option") {
      output$mr6_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The constant (intercept) does represent the expected value of the dependent variable when all independent variables are zero, but its statistical significance does not indicate whether the independent variables collectively explain variation in the dependent variable. Instead, the F-test (or overall model significance) is used for that purpose.")
        )
      })
    } else {
      output$mr6_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")),
          )
      })
    }
  })
  
  # Feedback for M2 Q7
  observeEvent(input$submit_mr7, {
    if (input$mr7_answer == "correct_option") {
      output$mr7_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("In a multiple OLS regression model, the slope coefficient for a given independent variable represents the change in the dependent variable associated with a one-unit change in that independent variable, holding all other independent variables constant. This is the definition of a partial slope coefficient in multiple regression.")
        )
      })
    } else {
      output$mr7_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")),
          )
      })
    }
  })
  
  # Feedback for M2 Q8
  observeEvent(input$submit_mr8, {
    if (input$mr8_answer == "correct_option") {
      output$mr8_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("In a multiple OLS regression model, the error term is indeed assumed to have a mean of zero, constant variance (homoscedasticity), and no correlation with the independent variables or with error terms of other observations (no autocorrelation). These are part of the classical linear regression assumptions (Gauss-Markov assumptions).")
        )
      })
    } else {
      output$mr8_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")),
          )
      })
    }
  })
  
  # Feedback for M2 Q9
  observeEvent(input$submit_mr9, {
    if (input$mr9_answer == "correct_option") {
      output$mr9_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The coefficient for Income (0.8) represents the change in life satisfaction associated with a one-unit change in Income (here, $10,000), holding Social Trust constant. This is the definition of a partial coefficient in multiple regression.")
        )
      })
    } else {
      output$mr9_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")),
          )
      })
    }
  })
  
  # Feedback for M2 Q10
  observeEvent(input$submit_mr10, {
    if (input$mr10_answer == "correct_option") {
      output$mr10_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("When a relevant variable (work experience) is omitted from the regression, and this variable is correlated with both the included independent variable (education) and the dependent variable (wages), the OLS estimator for the included variable (education) becomes biased. In this case, because work experience is positively correlated with both education and wages, the coefficient for education will be upwardly biased.")
        )
      })
    } else {
      output$mr10_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")),
          )
      })
    }
  })
  
  # Feedback for M3 Q1
  observeEvent(input$submit_mr_tech1, {
    if (input$mr_tech1_answer == "confounder") {
      output$mr_tech1_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("In this example, work hours (Z) is best described as a confounder. A confounder is a variable that influences both the independent variable (stress levels) and the dependent variable (sleep duration). If omitted, it could bias the estimated relationship between stress and sleep.")
        )
      })
    } else {
      output$mr_tech1_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M3 Q2
  observeEvent(input$submit_mr_tech2, {
    if (input$mr_tech2_answer == "mediator") {
      output$mr_tech2_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("In this example, religiosity (Z) is best described as a mediator. A mediator explains how or why the independent variable (age) affects the dependent variable (attitudes toward traditions). It is the mechanism through which age influences attitudes toward traditions.")
        )
      })
    } else {
      output$mr_tech2_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M3 Q3
  observeEvent(input$submit_mr_tech4, {
    if (input$mr_tech4_answer == "true") {
      output$mr_tech4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Standardizing variables (z-scores) transforms coefficients to represent the change in the dependent variable for a one standard deviation increase in the independent variable. This makes coefficients directly comparable in terms of effect size, but does not change the substantive relationship.")
        )
      })
    } else {
      output$mr_tech4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M3 Q4
  observeEvent(input$submit_mr_tech5, {
    if (input$mr_tech5_answer == "correct_option") {
      output$mr_tech5_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Standardizing variables does not improve the model's goodness-of-fit (R² remains unchanged) or address multicollinearity/heteroscedasticity. It only changes the scale of the coefficients, making them easier to compare.")
        )
      })
    } else {
      output$mr_tech5_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M3 Q5
  observeEvent(input$submit_mr_tech6, {
    correct_mean <- 0
    correct_variance <- 1
    
    user_mean <- as.numeric(input$mr_tech6_mean)
    user_variance <- as.numeric(input$mr_tech6_variance)
    
    if (abs(user_mean - correct_mean) < 0.001 && abs(user_variance - correct_variance) < 0.001) {
      output$mr_tech6_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("z-standardized variables have a mean of 0 and a variance of 1 by definition.")
        )
      })
    } else {
      output$mr_tech6_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")),
          tags$p("Z-standardized variables have a mean of 0 and a variance of 1 by definition."))
      })
    }
  })
  
  # Feedback for M3 Q6
  observeEvent(input$submit_mr_tech7, {
    correct_answers <- c("n", "var_x", "var_epsilon", "k")
    user_answers <- input$mr_tech7_answers
    
    if (setequal(user_answers, correct_answers)) {
      output$mr_tech7_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The standard error of a regression coefficient is influenced by sample size (n), variance of the independent variable (Var(X)), variance of the error term (Var(ε)), and the number of independent variables (k).")
        )
      })
    } else {
      output$mr_tech7_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M3 Q7
  observeEvent(input$submit_mr_tech8, {
    if (input$mr_tech8_answer == "correct_option") {
      output$mr_tech8_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The t-statistic for a parameter estimate is calculated as the estimate divided by its standard error, and a larger absolute t-statistic indicates stronger evidence against the null hypothesis."),
          tags$p("The other statements are incorrect:"),
          tags$ul(
            tags$li("Statistical significance does not imply substantive meaningfulness."),
            tags$li("Non-significance does not prove the null hypothesis (effect size = 0)."),
            tags$li("The p-value is not the probability that the null hypothesis is true.")
          )
        )
      })
    } else {
      output$mr_tech8_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M3 Q8
  observeEvent(input$submit_mr_tech9, {
    if (input$mr_tech9_answer == "correct_option") {
      output$mr_tech9_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("R² is a measure of how well the independent variables explain the variance in the dependent variable, but it does not indicate causality or the appropriateness of the model."),
          tags$p("The other statements are incorrect:"),
          tags$ul(
            tags$li("R² explains variance in the dependent variable, not the independent variables."),
            tags$li("R² is not independent of sample size and does not always increase with additional predictors (adjusted R² accounts for this)."),
            tags$li("R² cannot be negative; it ranges from 0 to 1.")
          )
        )
      })
    } else {
      output$mr_tech9_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M3 Q9
  observeEvent(input$submit_mr_tech10, {
    correct_answers <- c("true1", "true2")
    user_answers <- input$mr_tech10_answers

    if (setequal(user_answers, correct_answers)) {
      output$mr_tech10_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The correct statements are:"),
          tags$ul(
            tags$li("The F-test evaluates whether at least one of the independent variables in the model has a non-zero coefficient."),
            tags$li("The F-test is used to compare the fit of two nested models, such as a full model versus a reduced model.")
          ),
          tags$p("The other statements are incorrect:"),
          tags$ul(
            tags$li("A significant F-test does not imply that all independent variables are significant."),
            tags$li("The F-test assumes normality of the error terms (though it is somewhat robust to mild violations)."),
            tags$li("The F-statistic is the ratio of explained variance per degree of freedom to unexplained variance per degree of freedom (MSR/MSE).")
          )
        )
      })
    } else {
      output$mr_tech10_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  # Feedback for M3 Q10
  observeEvent(input$submit_mr_tech11, {
    output$mr_tech11_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$mr_tech11_answer),
        hr(),
        tags$p(HTML("<strong>Correct interpretation:</strong>")),
        tags$p("The coefficient for Male (0.5) means that, holding age constant, male heirs inherit $500,000 more on average than female heirs.")
      )
    })
  })
  
  #Feedback for M3 Q11
  observeEvent(input$submit_mr_tech12, {
    if (input$mr_tech12_answer == "correct_option") {
      output$mr_tech12_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The coefficient for Male (-2.0) means males report 2 points lower well-being than females, holding living arrangement constant."),
          tags$p("The coefficient for House Owner (5.0) means house owners report 5 points higher well-being than tenants, holding gender constant."),
          tags$p("The coefficient for Shared Flat (-3.0) means shared flat residents report 3 points lower well-being than tenants, holding gender constant.")
        )
      })
    } else {
      output$mr_tech12_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M3 Q12
  observeEvent(input$submit_mr_tech13, {
    if (input$mr_tech13_answer == "correct_option") {
      output$mr_tech13_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("A logarithmic transformation is appropriate for right-skewed data with large outliers, as it compresses the scale of extreme values and makes the distribution more symmetric."),
          tags$p("Polynomial transformations are used for nonlinear relationships, not skewness. Dichotomizing loses information and is not ideal for continuous variables.")
        )
      })
    } else {
      output$mr_tech13_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M3 Q13
  observeEvent(input$submit_mr_tech14, {
    if (input$mr_tech14_answer == "correct_option") {
      output$mr_tech14_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("A polynomial transformation (e.g., quadratic) is appropriate when the relationship with the outcome is nonlinear, even if the distribution itself is not skewed."),
          tags$p("Logarithmic transformation is unnecessary here (no skewness/outliers). Dichotomizing loses nuanced information about the nonlinear effect.")
        )
      })
    } else {
      output$mr_tech14_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M3 Q14
  observeEvent(input$submit_mr_tech15, {
    if (input$mr_tech15_answer == "correct_option") {
      output$mr_tech15_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The coefficient 0.08 represents the change in log(income) for a one-year increase in education. For small changes, this approximates an 8% increase in income.")
        )
      })
    } else {
      output$mr_tech15_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M3 Q15
  observeEvent(input$submit_mr_tech16, {
    if (input$mr_tech16_answer == "correct_option") {
      output$mr_tech16_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Job satisfaction increases with age until ~33 years (the vertex of the parabola), then decreases as age continues to rise.")
        )
      })
    } else {
      output$mr_tech16_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M3 Q16
  observeEvent(input$submit_mr_tech17, {
    output$mr_tech17_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$mr_tech17_answer),
        hr(),
        tags$p(HTML("<strong>Correct interpretation:</strong>")),
        tags$p("Parental education positively affects inherited wealth both directly (0.3) and indirectly through social connections (0.4). The total effect (0.7) is the sum of the direct and indirect effects. Social connections partially mediate the relationship between parental education and inherited wealth, as the indirect effect (0.4) is significant (95% CI excludes zero).")
      )
    })
  })
  
  #Feedback for M4 Q1
  observeEvent(input$submit_mr_diag1, {
    if (input$mr_diag1_answer == "wrong6") {
      output$mr_diag1_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The dependent variable does not need to be normally distributed; the error terms (residuals) should be normally distributed.")
        )
      })
    } else {
      output$mr_diag1_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M4 Q2
  observeEvent(input$submit_mr_diag2, {
    output$mr_diag2_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$mr_diag2_answer),
        hr(),
        tags$p(HTML("<strong>Correct answer:</strong>")),
        tags$p("The homoscedasticity assumption is violated. The increasing variance of residuals as predicted wages increase indicates heteroscedasticity.")
      )
    })
  })
  
  #Feedback for M4 Q3
  observeEvent(input$submit_mr_diag3, {
    if (input$mr_diag3_answer == "wrong3") {
      output$mr_diag3_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Interaction terms address effect modification, not reverse causation. IV, RCTs, and lagged predictors are valid strategies for reverse causation.")
        )
      })
    } else {
      output$mr_diag3_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M4 Q4
  observeEvent(input$submit_mr_diag4, {
    if (input$mr_diag4_answer == "correct2") {
      output$mr_diag4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Robust standard errors correct inference (standard errors, p-values) in the presence of heteroskedasticity.")
        )
      })
    } else {
      output$mr_diag4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M4 Q5
  observeEvent(input$submit_mr_diag5, {
    output$mr_diag5_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$mr_diag5_answer),
        hr(),
        tags$p(HTML("<strong>Correct interpretation:</strong>")),
        tags$p("The Breusch-Pagan test provides evidence of heteroskedasticity (p = 0.002 < 0.05). We reject the null hypothesis of homoscedasticity, indicating that the variance of the residuals is not constant across values of the predictors. This suggests that robust standard errors or a transformation of variables may be needed.")
      )
    })
  })
  
  #Feedback for M4 Q6
  observeEvent(input$submit_mr_diag6, {
    if (input$mr_diag6_answer == "correct") {
      output$mr_diag6_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("In small samples, violating normality primarily affects hypothesis tests and confidence intervals, not the estimated coefficients themselves. The coefficients remain unbiased, but inference becomes unreliable.")
        )
      })
    } else {
      output$mr_diag6_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M4 Q7
  observeEvent(input$submit_mr_diag7, {
    if (input$mr_diag7_answer == "correct") {
      output$mr_diag7_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Due to the Central Limit Theorem, the sampling distribution of the coefficients becomes approximately normal even if residuals are non-normal, as long as the sample size is large. Normality is more important for small samples than large ones.")
        )
      })
    } else {
      output$mr_diag7_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M4 Q8
  observeEvent(input$submit_mr_diag8, {
    output$mr_diag8_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$mr_diag8_answer),
        hr(),
        tags$p(HTML("<strong>Correct justification:</strong>")),
        tags$p("Weighted regression is justified here because heteroscedasticity violates the OLS assumption of constant error variance. By assigning smaller weights to observations with higher variance (e.g., very high inherited wealth) and larger weights to observations with lower variance, WLS ensures that the estimation gives less influence to observations where the dependent variable is less precise."))
    })
  })


  #Feedback for M4 Q9
  observeEvent(input$submit_mr_diag9, {
    if (input$mr_diag9_answer == "correct3") {
      output$mr_diag9_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Orthogonal predictors (e.g., from PCA) are uncorrelated by design, so multicollinearity is not an issue. Group-level data, polynomial terms, and highly correlated predictors are all common sources of multicollinearity.")
        )
      })
    } else {
      output$mr_diag9_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M4 Q10
  observeEvent(input$submit_mr_diag10, {
    output$mr_diag10_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$mr_diag10_answer),
        hr(),
        tags$p(HTML("<strong>Correct explanation:</strong>")),
        tags$p("When outliers are non-influential, it means that:"),
        tags$ul(
          tags$li("Their residual distance (vertical deviation from the regression line) is large, but they do not substantially affect the slope or intercept of the regression line."),
          tags$li("Their leverage (horizontal distance from the mean of the predictors) is low, so they do not have disproportionate influence on the regression coefficients.")
        ),
        tags$p("In short, these outliers are unusual in their response (Y) but do not 'pull' the regression line toward themselves because they are close to the center of the predictor space (X)."))
    })
  })
  
  #Feedback for M4 Q11
  observeEvent(input$submit_mr_diag11, {
    output$mr_diag11_feedback <- renderUI({
      div(
        tags$p("Your answers:"),
        tags$ol(
          tags$li(
            tags$p(HTML("<strong>Significance of results:</strong>")),
            tags$blockquote(input$mr_diag11_sig),
            tags$p(HTML("<strong>Correct answer:</strong>")),
            tags$p("Removing outliers can artificially inflate the significance of results (e.g., lower p-values) by reducing variability in the data, leading to overconfidence in the findings.")
          ),
          tags$li(
            tags$p(HTML("<strong>Variance/standard deviation:</strong>")),
            tags$blockquote(input$mr_diag11_var),
            tags$p(HTML("<strong>Correct answer:</strong>")),
            tags$p("Removing outliers reduces the variance and standard deviation of the data, which may underestimate the true spread of the population and distort effect sizes.")
          ),
          tags$li(
            tags$p(HTML("<strong>Regression fit:</strong>")),
            tags$blockquote(input$mr_diag11_fit),
            tags$p(HTML("<strong>Correct answer:</strong>")),
            tags$p("Removing outliers can improve the fit for the majority of data points but may mask important patterns or relationships, especially if outliers represent valid extreme observations.")
          ),
          tags$li(
            tags$p(HTML("<strong>Subgroups in the data:</strong>")),
            tags$blockquote(input$mr_diag11_sub),
            tags$p(HTML("<strong>Correct answer:</strong>")),
            tags$p("Outliers may represent meaningful subgroups (e.g., high-income individuals in wealth studies). Removing them could exclude important heterogeneity and bias the analysis."))
        )
      )
    })
  })
  
  #Feedback for M5 Q1
  observeEvent(input$submit_binary1, {
    output$binary1_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$binary1_answer),
        hr(),
        tags$p(HTML("<strong>Correct explanation:</strong>")),
        tags$p("The Linear Probability Model (LPM) has several key problems when used for binary outcomes:"),
        tags$ul(
          tags$li("Predicted probabilities outside [0, 1]: LPM can predict values < 0 or > 1, which are nonsensical for probabilities."),
          tags$li("Homoscedasticity violation: The variance of the error term is not constant (var(error) = p(1-p)), violating OLS assumptions."),
          tags$li("Nonlinearity: The true relationship between predictors and a binary outcome is often S-shaped (logistic), but LPM assumes linearity."),
          tags$li("Heteroskedasticity by design: Since var(Y|X) = p(1-p), residuals are inherently heteroskedastic, leading to inefficient estimates and incorrect inference unless robust standard errors are used."),
          tags$li("Poor fit for extreme probabilities: LPM performs poorly when true probabilities are near 0 or 1, as it cannot model asymptotic behavior."))
      )
    })
  })
  
  #Feedback for M5 Q2
  observeEvent(input$submit_binary2, {
    # Correct answers
    correct_odds <- 0.25 / (1 - 0.25)
    correct_logodds <- log(correct_odds)
    correct_prob <- exp(1.0986) / (1 + exp(1.0986))
    
    # Round for comparison
    user_odds <- round(input$binary2_odds, 4)
    user_logodds <- round(input$binary2_logodds, 4)
    user_prob <- round(input$binary2_prob, 4)
    
    output$binary2_feedback <- renderUI({
      div(
        tags$ol(
          tags$li(
            tags$p(HTML(paste("Your answer: ", input$binary2_odds))),
            tags$p(HTML(paste("Correct answer: ", round(correct_odds, 4))))
          ),
          tags$li(
            tags$p(HTML(paste("Your answer: ", input$binary2_logodds))),
            tags$p(HTML(paste("Correct answer: ", round(correct_logodds, 4))))
          ),
          tags$li(
            tags$p(HTML(paste("Your answer: ", input$binary2_prob))),
            tags$p(HTML(paste("Correct answer: ", round(correct_prob, 4))))
          )
        )
      )
    })
  })
  
  #Feedback for M5 Q3
  observeEvent(input$submit_binary3, {
    if (input$binary3_answer == "correct") {
      output$binary3_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Odds are not bounded between 0 and 1. They range from 0 to +∞: if p → 0, odds → 0; if p → 1, odds → +∞.")
        )
      })
    } else {
      output$binary3_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M5 Q4
  observeEvent(input$submit_binary4, {
    if (input$binary4_answer == "correct") {
      output$binary4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Log-odds are the natural log of odds and can take any real value, from -∞ to +∞.")
        )
      })
    } else {
      output$binary4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M5 Q5
  observeEvent(input$submit_binary5, {
    output$binary5_feedback <- renderUI({
      div(
        tags$ol(
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$binary5_odds),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("A one-year increase in education is associated with a 35% increase in the odds of political participation (OR = 1.35), holding income constant.")
          ),
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$binary5_logits),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("A one-unit increase in log(income) is associated with a 0.5-unit increase in the log-odds of political participation, holding education constant.")
          ),
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$binary5_explain),
            tags$p(HTML("<strong>Possible explanation:</strong>")),
            tags$p("Both education and income positively predict political participation. Higher education and income may reflect greater resources (time, money, civic skills) that facilitate participation. The stronger effect of income (OR = 1.65 vs. 1.35) suggests economic resources matter more than education in this context, possibly due to financial barriers to participation (e.g., donations, travel to events)."))
        )
      )
    })
  })
  
  #Feedback for M5 Q6
  observeEvent(input$submit_binary6, {
    if (input$binary6_answer == "correct") {
      output$binary6_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("In glht(), the Estimate for a contrast in a logistic regression is the difference in log-odds between the two groups (Private vs. Public). To get the odds ratio, you would exponentiate the estimate: e^1.20 ≈ 3.32.")
        )
      })
    } else {
      output$binary6_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M5 Q7
  observeEvent(input$submit_binary7, {
    output$binary7_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$binary7_answer),
        hr(),
        tags$p(HTML("<strong>Correct interpretation:</strong>")),
        tags$p("For a 50-year-old with a College degree, the model predicts a 68% probability of voting, holding all other variables constant. This means that, according to the model, about 68 out of 100 individuals with these characteristics are expected to vote."))
    })
  })
  
  #Feedback for M5 Q8
  observeEvent(input$submit_binary8, {
    if (input$binary8_answer == "correct") {
      output$binary8_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The LRT statistic tests whether the fit of the model improves significantly with the addition of education level, but it does not indicate the magnitude of the effect of education level. The LRT only tells us whether the added variables collectively contribute to the model, not how strong their individual effects are.")
        )
      })
    } else {
      output$binary8_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M5 Q9
  observeEvent(input$submit_binary9, {
    # Correct calculation
    logLik_null <- -350.2
    logLik_full <- -220.5
    pseudoR2 <- 1 - (logLik_full / logLik_null)
    
    # Round for comparison
    user_pseudoR2 <- round(input$binary9_pseudoR2, 2)
    correct_pseudoR2 <- round(pseudoR2, 2)
    
    output$binary9_feedback <- renderUI({
      div(
        tags$ol(
          tags$li(
            tags$p(HTML(paste("Your answer: ", input$binary9_pseudoR2))),
            tags$p(HTML(paste("Correct answer: ", correct_pseudoR2)))
          ),
          tags$li(
            tags$p("Your interpretation:"),
            tags$blockquote(input$binary9_interpret),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("The McFadden’s Pseudo-R² of 0.37 indicates that the full model explains about 37% of the variation in policy adoption that is not explained by the null model. While this is a substantial improvement over the null model, it is important to note that Pseudo-R² values are generally lower than the R² in linear regression and should be interpreted cautiously."))
        )
      )
    })
  })
  
  #Feedback for M5 Q10
  observeEvent(input$submit_binary10, {
    if (input$binary10_answer == "correct") {
      output$binary10_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The Wald test result (p = 0.005) indicates that political ideology has a statistically significant effect on policy support. However, the Wald test does not provide information about the magnitude of the effect. The z-statistic (2.8) only tells us whether the coefficient is significantly different from zero, not how large or substantively meaningful the effect is.")
        )
      })
    } else {
      output$binary10_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M5 Q11
  observeEvent(input$submit_binary11, {
    if (input$binary11_answer == "correct") {
      output$binary11_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The interaction term (Income × Political Ideology) is -0.4. For conservatives (Ideology = 0), the effect of income is 0.5 (OR = 1.65). For liberals (Ideology = 1), the effect of income is 0.1 (OR = 1.105). Thus, the effect of income is weaker for liberals. The effect of political ideology is positive overall (1.8), but the interaction modifies this effect for high-income individuals, making it less positive (or even negative if income is very high).")
        )
      })
    } else {
      output$binary11_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M5 Q12
  observeEvent(input$submit_binary12, {
    if (input$binary12_answer == "correct") {
      output$binary12_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Multicollinearity is a concern in multinomial logistic regression, just as in binary logistic regression, because it inflates standard errors and makes estimates unreliable. The other statements are correct: IIA violations, small cell counts, and complex interpretation are all common issues.")
        )
      })
    } else {
      output$binary12_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M5 Q13
  observeEvent(input$submit_binary13, {
    output$binary13_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$binary13_answer),
        hr(),
        tags$p(HTML("<strong>Correct interpretation:</strong>")),
        tags$p("In this ordinal logistic regression:"),
        tags$ol(
          tags$li("Income has a negative effect (-0.450) on support for the carbon tax. A one-unit increase in log(income) is associated with a decrease in the log-odds of being in a higher support category, holding other variables constant. This suggests that higher-income individuals are less likely to support the policy."),
          tags$li("Education has a positive effect (0.300). Each additional year of education increases the log-odds of being in a higher support category, indicating greater support among more educated individuals."),
          tags$li("Political ideology has a strong positive effect (1.200). Liberals (coded as 3) are much more likely to support the policy than conservatives (coded as 1), with moderates in between.")
        ),
        tags$p("The intercepts represent the thresholds for moving between adjacent categories of support:"),
        tags$ul(
          tags$li("1|2: The threshold for moving from 'strongly oppose' to 'somewhat oppose'."),
          tags$li("2|3: The threshold for moving from 'somewhat oppose' to 'neutral'."),
          tags$li("3|4 and 4|5: Thresholds for moving to 'somewhat support' and 'strongly support', respectively.")
        ),
        tags$p(HTML("<strong>Substantive implications:</strong>")),
        tags$p("Income is negatively associated with support, possibly due to concerns about costs or economic burden. Education and liberal ideology are strong predictors of support, reflecting greater awareness of climate change or ideological alignment with environmental policies. The model suggests that policy communication should target high-income and conservative groups, while leveraging support from educated and liberal demographics."))
    })
  })
  
  #Feedback for M6 Q1
  observeEvent(input$submit_count1, {
    correct_answers <- c("correct1", "correct3", "correct5", "correct7", "correct9")
    user_answers <- input$count1_answer
    is_correct <- all(correct_answers %in% user_answers) && all(user_answers %in% correct_answers)
    
    if (is_correct) {
      output$count1_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Count data are non-negative integers representing the number of occurrences of an event (e.g., protests, patents, hospital visits, children, publications).")
        )
      })
    } else {
      output$count1_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")),
          tags$p("Count data are non-negative integers representing the number of occurrences of an event. The correct answers are:"),
          tags$ul(
            tags$li("Number of protests in a city per year"),
            tags$li("Number of patents filed by a firm"),
            tags$li("Number of hospital visits per patient"),
            tags$li("Number of children in a household"),
            tags$li("Number of publications by a researcher")))
      })
    }
  })
  
  #Feedback for M6 Q2
  observeEvent(input$submit_count2, {
    output$count2_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$count2_answer),
        hr(),
        tags$p(HTML("<strong>Correct answer:</strong>")),
        tags$p("OLS regression is inappropriate for count data for several reasons:"),
        tags$ol(
          tags$li("Non-normality of errors: Count data are discrete and non-negative, but OLS assumes normally distributed errors. Count data often exhibit skewness and heteroskedasticity, violating this assumption."),
          tags$li("Predicted values outside valid range: OLS can predict negative values or non-integer values, which are nonsensical for counts (e.g., -2 protests or 3.5 children)."),
          tags$li("Variance-mean relationship: Count data often exhibit equidispersion (variance = mean) or overdispersion (variance > mean). OLS does not account for this relationship, leading to inefficient or biased estimates."),
          tags$li("Heteroskedasticity by design: For count data, variance often depends on the mean (e.g., Poisson variance = mean), violating OLS’s homoskedasticity assumption.")
        ),
        tags$p("For these reasons, Poisson regression or Negative Binomial regression (for overdispersed data) are more appropriate for modeling count outcomes."))
    })
  })
  
  #Feedback for M6 Q3
  observeEvent(input$submit_count3, {
    if (input$count3_answer == "correct") {
      output$count3_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("In Poisson regression, coefficients represent the change in the log(expected count) for a one-unit change in the predictor. The coefficient for police_presence is -0.50, meaning a one-unit increase in log(police presence) is associated with a 0.5-unit decrease in the log(expected number) of protest events."),
          tags$p("Statement 1 is wrong because coefficients are on the log scale. Statement 2 is wrong because the unemployment rate is mean-centered, and the interpretation should be in terms of the log(expected count). Statement 4 is wrong because the p-value for gov_popularity (0.012) is statistically significant at the 5% level.")
        )
      })
    } else {
      output$count3_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M6 Q4
  observeEvent(input$submit_count4, {
    if (input$count4_answer == "correct") {
      output$count4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Overdispersion (variance > mean) is common and can be addressed using Negative Binomial regression. However, underdispersion (variance < mean) is rare and cannot be addressed by Negative Binomial regression, which is designed for overdispersed data. Alternative models (e.g., generalized Poisson, Conway-Maxwell-Poisson) or data transformations may be required for underdispersion.")
        )
      })
    } else {
      output$count4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M6 Q5
  observeEvent(input$submit_count_bonus, {
    output$count_bonus_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$count_bonus_answer),
        hr(),
        tags$p(HTML("<strong>Correct answer:</strong>")),
        tags$p("The main difference between a zero-inflated negative binomial (ZINB) regression and a standard negative binomial (NB) regression is that the ZINB model explicitly models the excess zeros in the data using a two-part mixture process:"),
        tags$ol(
          tags$li("Count component (negative binomial): Models the count of collaborations for researchers who can collaborate (non-zero process). The coefficients (funding: 0.40, seniority: 0.15) represent the effect of predictors on the expected number of collaborations for this group."),
          tags$li("Zero-inflation component (logit): Models the probability of being in the zero-collaboration group (structural zeros). The coefficients (funding: -0.60, seniority: -0.20) represent the effect of predictors on the log-odds of having no collaborations at all (vs. being at risk of collaboration).")
        ),
        tags$p("In contrast, a standard NB regression assumes all zeros are sampling zeros (from the same count process) and does not distinguish between structural zeros and sampled zeros. The ZINB model is necessary when excess zeros are present due to a distinct process (e.g., researchers who cannot or choose not to collaborate)."))
    })
  })
  
  #Feedback for M7 Q1
  observeEvent(input$submit_panel1, {
    if (input$panel1_answer == "correct") {
      output$panel1_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Longitudinal data help mitigate omitted variable bias by controlling for time-invariant unobserved heterogeneity, but they do not eliminate the risk entirely. Time-varying confounders may still introduce bias if unmeasured.")
        )
      })
    } else {
      output$panel1_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M7 Q2
  observeEvent(input$submit_panel2, {
    output$panel2_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$panel2_answer),
        hr(),
        tags$p(HTML("<strong>Correct answer:</strong>")),
        tags$p("The age-cohort-period (ACP) identification problem arises because age, cohort, and period are linearly dependent:"),
        tags$ul(
          tags$li("Age = Period - Cohort (e.g., a 30-year-old in 2020 was born in 1990)."),
          tags$li("This perfect collinearity means the effects of age, cohort, and period cannot be uniquely estimated in a single regression model.")
        ),
        tags$p("Analytical challenges:"),
        tags$ol(
          tags$li("Collinearity: The three variables are mathematically dependent, violating the assumption of independent predictors in regression."),
          tags$li("Identification: Without additional constraints or external information, it is impossible to disentangle the unique contributions of age, cohort, and period."),
          tags$li("Model specification: Researchers must use constraints (e.g., fixing one effect), proxy variables, or alternative designs (e.g., repeated cross-sections, panel data) to address the problem.")
        ),
        tags$p("Example: If older cohorts are more skeptical of climate change, is this due to aging (people become more conservative as they age), cohort effects (older generations were socialized in less environmentally conscious eras), or period effects (e.g., recent climate events increasing awareness)? The ACP problem prevents definitive answers without further assumptions."))
    })
  })
  
  #Feedback for M7 Q3
  observeEvent(input$submit_panel3, {
    output$panel3_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$panel3_answer),
        hr(),
        tags$p(HTML("<strong>Correct answer:</strong>")),
        tags$p("1. For welfare spending (time-varying):"),
        tags$ul(
          tags$li("Overall Std. Dev. (3.20): Total variation across all observations (countries and years)."),
          tags$li("Between Std. Dev. (2.80): Variation in country-level averages (e.g., some countries consistently spend more on welfare than others)."),
          tags$li("Within Std. Dev. (1.50): Variation over time within countries (e.g., welfare spending fluctuates over the 20 years for each country)."),
          tags$li("The larger between than within variation suggests that differences in welfare spending are driven more by cross-country heterogeneity (e.g., institutional or cultural factors) than by temporal changes within countries.")
        ),
        tags$p("2. For colonial history (time-constant):"),
        tags$ul(
          tags$li("The within Std. Dev. = 0 because the variable does not change over time for any country (a country’s colonial status is fixed)."),
          tags$li("The between Std. Dev. (0.5164) reflects variation across countries (60% were former colonies, 40% were not)."),
          tags$li("The overall and between means (0.60) are identical, confirming no temporal variation."))
      )
    })
  })
  
  #Feedback for M7 Q4
  observeEvent(input$submit_panel4, {
    if (input$panel4_answer == "correct") {
      output$panel4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Fixed-effects models use within-transformation (demeaning), which removes time-invariant variables and relies exclusively on within-subject variation for estimation.")
        )
      })
    } else {
      output$panel4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M7 Q5
  observeEvent(input$submit_panel5, {
    if (input$panel5_answer == "correct") {
      output$panel5_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("For two time periods, first-differencing and fixed-effects are equivalent. For more than two periods, first-differencing discards more information and is less efficient than fixed-effects.")
        )
      })
    } else {
      output$panel5_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M7 Q6
  observeEvent(input$submit_panel6, {
    correct1 <- tolower(input$panel6_blank1) == "invariant"
    correct2 <- tolower(input$panel6_blank2) == "eliminated"
    
    if (correct1 && correct2) {
      output$panel6_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("1. Fixed-effects models control for time-invariant unobserved heterogeneity by demeaning the data."),
          tags$p("2. Time-invariant observable variables are eliminated by the within-transformation.")
        )
      })
    } else {
      output$panel6_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M7 Q7
  observeEvent(input$submit_panel7, {
    output$panel7_feedback <- renderUI({
      div(
        tags$ol(
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$panel7_q1),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("The coefficient for inherited_wealth is 0.40, with an odds ratio of 1.49. This means that a one-unit increase in log(inherited wealth) is associated with a 49% increase in the odds of being selected for a political appointment, holding education and political connections constant. Substantively, this suggests that inherited wealth significantly boosts the likelihood of political influence, even among candidates from similarly privileged backgrounds.")
          ),
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$panel7_q2),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("The odds ratio for education2 (graduate degree) is 2.23, while for education3 (professional degree) it is 3.32. This implies that candidates with professional degrees have ~50% higher odds of appointment compared to those with graduate degrees (3.32 / 2.23 ≈ 1.49), holding other variables constant. This suggests that higher education levels are associated with greater political influence, possibly due to elite networks or perceived competence.")
          ),
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$panel7_q3),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("family_id is included as a strata variable to account for the matched-pairs design of the study. Each pair consists of two candidates from the same family, and stratification ensures that comparisons are made within families, controlling for unobserved family-level factors (e.g., social status, reputation). If family_id were omitted, the model would ignore the matched nature of the data, leading to biased estimates and inflated standard errors due to unaccounted dependence within pairs.")))
      )
    })
  })
  
  #Feedback for M7 Q8
  observeEvent(input$submit_panel8, {
    if (input$panel8_answer == "correct") {
      output$panel8_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Random intercept models assume that the relationship between predictors and the outcome is the same across groups, but the intercept (baseline outcome level) varies by group.")
        )
      })
    } else {
      output$panel8_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
        #)
      })
    }
  })
  
  #Feedback for M7 Q9
  observeEvent(input$submit_panel9, {
    if (input$panel9_answer == "correct") {
      output$panel9_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Random slope models explicitly model group-specific variation in the effect of a predictor (slope heterogeneity).")
        )
      })
    } else {
      output$panel9_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M7 Q10
  observeEvent(input$submit_panel10, {
    output$panel10_feedback <- renderUI({
      div(
        tags$p("Your answer:"),
        tags$blockquote(input$panel10_answer),
        hr(),
        tags$p(HTML("<strong>Correct interpretation:</strong>")),
        tags$p("The Hausman test compares the consistency of the fixed-effects (FE) and random-effects (RE) estimators. The chi-squared statistic (8.45) with p = 0.0146 rejects the null hypothesis that the random-effects estimator is consistent. This suggests that the random-effects model is misspecified (e.g., due to correlation between the predictors and the group-level random effects), and the fixed-effects model is preferred for this analysis. Substantively, this implies that unobserved time-invariant factors (e.g., school quality, teacher characteristics) are likely correlated with education spending or SES, making the RE estimates biased. The FE model controls for these unobserved factors and should be used instead.")
      )
    })
  })
  
  #Feedback for M7 Q11
  observeEvent(input$submit_panel11, {
    output$panel11_feedback <- renderUI({
      div(
        tags$ol(
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$panel11_q1),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("The fixed effect of inherited_wealth (0.30) represents the average effect of a one-unit increase in log(inherited wealth) on political influence across all regions. However, because the model includes a random slope for inherited_wealth by region, this average effect is allowed to vary across regions. The fixed effect can be interpreted as the overall trend, but the actual effect in any given region may be higher or lower depending on the region-specific slope. For example, in some regions, inherited wealth may have a stronger (or weaker) effect on political influence due to local norms or institutions.")
          ),
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$panel11_q2),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("The variance of the random slope for inherited_wealth (0.02) indicates that there is heterogeneity in the effect of inherited wealth across regions. The standard deviation of the random slope (~0.14) suggests that the effect of inherited wealth varies by approximately ±0.14 around the fixed effect (0.30). This implies that in some regions, the effect could be as high as 0.44 (0.30 + 0.14) or as low as 0.16 (0.30 - 0.14), reflecting meaningful regional differences in how inherited wealth translates into political influence. Substantively, this could indicate that institutional or cultural factors (e.g., corruption, elite networks) moderate the relationship between wealth and influence.")))
      )
    })
  })
  
  #Feedback for M7 Q12
  observeEvent(input$submit_panel12, {
    if (input$panel12_answer == "correct") {
      output$panel12_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The parallel trends assumption is the key identifying assumption in DiD. If it holds, DiD eliminates bias from unobserved time-invariant confounders by differencing out both time-invariant and time-varying shocks that affect both groups equally. DiD estimates the average treatment effect on the treated (ATT) by comparing the change over time in the treatment group to the change over time in the control group.")
        )
      })
    } else {
      output$panel12_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M8 Q1
  observeEvent(input$submit_event1, {
    if (input$event1_answer == "correct") {
      output$event1_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("Censoring occurs when the event of interest is not observed during the study period. Case 4 is not censored because the event (divorce) occurs and is recorded.")
        )
      })
    } else {
      output$event1_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M8 Q2
  observeEvent(input$submit_event2, {
    output$event2_feedback <- renderUI({
      div(
        tags$ol(
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$event2_q1),
            tags$p(HTML("<strong>Correct answer:</strong>")),
            tags$p("The hazard rate h(t)  is calculated as:"),
            tags$ul(
              tags$li("h(1) = 20/100 = 0.20"),
              tags$li("h(2) = 25/80 = 0.313"),
              tags$li("h(3) = 20/55 = ~ 0.364"),
              tags$li("h(4) = 15/35 = ~ 0.429"),
              tags$li("h(5) = 10/20 = 0.50"),
              tags$li("h(6) = 10/10 = 1.00")
            )
          ),
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$event2_q2),
            tags$p(HTML("<strong>Correct answer:</strong>")),
            tags$p("The survivor function S(t) is calculated as:"),
            tags$ul(
              tags$li("S(1) = 1 - h(1) = 0.80"),
              tags$li("S(2) = S(1) * (1 - h(2)) = 0.80 * 0.6875 = ~ 0.55"),
              tags$li("S(3) = S(2) * (1 - h(3)) = ~ 0.55 * 0.6364 = ~ 0.35"),
              tags$li("S(4) = S(3) * (1 - h(4)) = ~ 0.35 * 0.5714 = ~ 0.20"),
              tags$li("S(5) = S(4) * (1 - h(5)) = ~ 0.20 * 0.50 = 0.10"),
              tags$li("S(6) = S(5) * (1 - h(6)) = ~ 0.10 * 0.00 = 0.00"))))
      )
    })
  })
  
  #Feedback for M8 Q3
  observeEvent(input$submit_event3, {
    if (input$event3_answer == "correct") {
      output$event3_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The hazard rate h(t) can exceed 1 because it represents the instantaneous risk of the event occurring at time t, not a probability.")
        )
      })
    } else {
      output$event3_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M8 Q4
  observeEvent(input$submit_event4, {
    if (input$event4_answer == "correct") {
      output$event4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:green;'>Correct!</span>")),
          tags$p("The survivor function S(t) is the probability of surviving past time t and is always non-increasing, ranging from 1 to 0.")
        )
      })
    } else {
      output$event4_feedback <- renderUI({
        div(
          tags$p(HTML("<span style='color:red;'>Try again!</span>")))
      })
    }
  })
  
  #Feedback for M8 Q5
  observeEvent(input$submit_event5, {
    output$event5_feedback <- renderUI({
      div(
        tags$ol(
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$event5_q1),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("The coefficient for political_connections is 1.20, with a hazard ratio of 3.32. This means candidates with political connections have a 3.32 times higher hazard (instantaneous risk) of securing a political appointment at any given time, compared to those without connections, holding education and age constant. Substantively, this suggests that political connections significantly accelerate the time to appointment, likely due to access to elite networks or insider information.")
          ),
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$event5_q2),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("The hazard ratio for education2 (graduate degree) is 1.65, while for education3 (professional degree) it is 2.23. This implies that candidates with professional degrees have a ~35% higher hazard of appointment compared to those with graduate degrees (2.23 / 1.65 ≈ 1.35), holding other variables constant. This suggests that higher education levels are associated with faster appointments, possibly due to perceived competence, elite credentials, or access to influential alumni networks.")
          ),
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$event5_q3),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("The negative coefficient for age (-0.05) corresponds to a hazard ratio of 0.95, indicating that each additional year of age is associated with a 5% lower hazard of appointment at any given time. This suggests that younger candidates secure appointments more quickly, possibly due to perceived energy, adaptability, or alignment with modern political trends. Alternatively, older candidates may face implicit age bias or longer vetting processes.")))
      )
    })
  })
  
  #Feedback for M8 Q6
  observeEvent(input$submit_event6, {
    output$event6_feedback <- renderUI({
      div(
        tags$ol(
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$event6_q1),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("The interaction term gdp:ttime (-0.10) indicates that the effect of GDP on the hazard of policy adoption decreases over time. Specifically, the hazard ratio for GDP is 1.65 at time 0 but declines by 10% per unit of time (since exp(-0.10) ≈ 0.905). This suggests that while higher GDP initially accelerates policy adoption, its effect diminishes as time progresses. Substantively, this could reflect diminishing returns to economic capacity (e.g., early adopters are wealthier, but later adoption depends on other factors like political will or global pressure).")))
      )
    })
  })
  
  #Feedback for M8 Q7
  observeEvent(input$submit_event7, {
    output$event7_feedback <- renderUI({
      div(
        tags$ol(
          tags$li(
            tags$p("Your answer:"),
            tags$blockquote(input$event7_q1),
            tags$p(HTML("<strong>Correct interpretation:</strong>")),
            tags$p("The cox.zph() test evaluates whether the proportional hazards (PH) assumption holds for each covariate by testing for non-zero slope in a scaled Schoenfeld residuals plot over time. The results show:"),
            tags$ul(
              tags$li("pub_count (p = 0.00041) and prestige (p = 0.051) violate the PH assumption, as their p-values are < 0.05. This means their effects on the hazard of promotion change over time, violating the core assumption of the Cox model."),
              tags$li("gender (p = 0.823) does not violate the PH assumption."),
              tags$li("The global test (p = 0.0017) confirms that the PH assumption is violated overall.")
            ),
            tags$p("Implications:"),
            tags$ul(
              tags$li("The Cox model’s validity is compromised for pub_count and prestige. Ignoring this violation can lead to biased estimates of their effects."),
              tags$li("Solutions include:"),
              tags$ul(
                tags$li("Stratifying the model by the violating variables (e.g., strata(prestige))."),
                tags$li("Adding time-dependent interactions (e.g., pub_count:ttime)."),
                tags$li("Using alternative models (e.g., stratified Cox, AFT models) if violations persist.")
              ),
              tags$li("For gender, the PH assumption holds, so its interpretation remains valid.")))
        )
      )
    })
  })
}
  
shinyApp(ui = ui, server = server)
