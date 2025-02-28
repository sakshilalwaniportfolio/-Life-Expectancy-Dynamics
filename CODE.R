# Load the dataset into RStudio
attach(project_data_final)  
# This temporarily attaches the dataset, allowing direct access to column names without using $
# However, using attach() is not recommended in larger projects due to potential conflicts.

# Build a multiple linear regression model
reg = lm(le ~ am + h + sl + pol + pop + hv + gdp + uf + ms + d)  
# 'lm()' creates a linear model where 'le' (life expectancy) is the dependent variable.
# Independent variables: adult mortality (am), healthcare (h), schooling (sl), polio immunization (pol), 
# population (pop), hiv (hv), GDP per capita (gdp), under-five mortality (uf), 
# measles(ms), and deptheria (d).

# Display a summary of the regression model
summary(reg)  
# This provides key statistics including coefficients, R-squared value, p-values, and F-statistic.

# Calculate the 95% confidence intervals for the model coefficients
confint(reg, level = 0.95)  
# This gives a range in which the true coefficient values are expected to fall with 95% confidence.

# Heteroskedasticity Test (Breusch-Pagan Test)
# Ho: No heteroskedasticity (errors have constant variance)
# H1: Heteroskedasticity is present (variance of errors changes)
library(lmtest)  # Load the package needed for the test
lmtest::bptest(reg)  
# If the p-value is less than 0.05, heteroskedasticity is present (violating regression assumptions).

# Autocorrelation Test (Durbin-Watson Test)
# Ho: No autocorrelation (errors are independent)
# H1: Autocorrelation exists (errors are correlated)
lmtest::dwtest(reg)  
# If the test statistic is near 2, no autocorrelation is present.
# If it is significantly different from 2, then autocorrelation is likely.

# Multicollinearity Test (Variance Inflation Factor - VIF)
library(faraway)  # Load package for multicollinearity testing
vif(reg)  
# If VIF > 5, it indicates high multicollinearity, suggesting that some independent variables are highly correlated.

# Hypothesis Testing for Polio Immunization Coverage
t.test(pol)  
# Performs a one-sample t-test to compare polio immunization coverage to a given value.
# The result helps determine if the reported polio coverage is statistically different from the expected value.

