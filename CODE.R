attach(project_data_final)
reg=lm(le~am+h+sl+pol+pop+hv+gdp+uf+ms+d)
summary(reg)
confint(reg,level=0.95)
#ho:-heterosdasticity is not present
#h1:-heterosdasticity is present
library(lmtest)
lmtest::bptest(reg)
#ho:-no autocorelation
#h1:-autocorrelation
lmtest::dwtest(reg)
library(faraway)
vif(reg)
t.test(pol)

