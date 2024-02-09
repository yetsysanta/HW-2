Yetsy Santa
Lab Members: Donovan, Rafael
HW #2


brfss22[1:10,1:6]
attach(brfss22)
summary(brfss22)

xtabs(~ brfss22$ADDEPEV3 + brfss22$SEXVAR)

prop.table(table(brfss22$ADDEPEV3, brfss22$SEXVAR))

NN <- length(brfss22$ADDEPEV3)
set.seed(12345)
restrict_1 <- (runif(NN) < 0.1) # use just 10% 
summary(restrict_1)

brfss_small <- subset(brfss22, restrict_1)

library(ggplot2)

ggplot(brfss_small, aes(x = SEXVAR, fill = ADDEPEV3)) + geom_bar()
ggplot(brfss_small, aes(x = ADDEPEV3, fill = SEXVAR)) + geom_bar()
ggplot(brfss_small, aes(x = SEXVAR, fill = ADDEPEV3)) + geom_bar(position = "fill")
ggplot(brfss_small, aes(x = ADDEPEV3, fill = SEXVAR)) + geom_bar(position = "fill")

ggplot(brfss_small, aes(x = SEXVAR, fill = ADDEPEV3)) + geom_bar(position = "fill") + scale_fill_viridis_d()
ggplot(brfss_small, aes(x = ADDEPEV3, fill = SEXVAR)) + geom_bar(position = "fill") + scale_fill_viridis_d(option="plasma")

brfss_small_m <- subset(brfss_small,brfss_small$SEXVAR == "Male")
brfss_small_f <- subset(brfss_small,brfss_small$SEXVAR == "Female")
ggplot(brfss_small_f, aes(x = ADDEPEV3, fill = EXERANY2)) + geom_bar(position = "fill") + scale_fill_viridis_d(option="rocket")

brfss22$Age_midpt <- fct_recode(brfss22$X_AGEG5YR, "21" = "Age 18 to 24",
                                "27" = "Age 25 to 29", "32" = "Age 30 to 34",
                                "37" = "Age 35 to 39", "42" = "Age 40 to 44",
                                "47" = "Age 45 to 49", "52" = "Age 50 to 54",
                                "57" = "Age 55 to 59", "62" = "Age 60 to 64",
                                "67" = "Age 65 to 69", "72" = "Age 70 to 74",
                                "77" = "Age 75 to 79", "82" = "Age 80 or older",
                                NULL = "Dont know/Refused/Missing")

summary(brfss22$Age_midpt)

brfss22$Age_midpt <- as.numeric(levels(brfss22$Age_midpt))[brfss22$Age_midpt]
summary(brfss22$Age_midpt) # note the diff!


ggplot(brfss_small, aes(x = SLEPTIM1, fill = ADDEPEV3)) + geom_bar()
ggplot(brfss_small, aes(x = SEXVAR, fill = SMOKDAY2)) + geom_bar()
ggplot(brfss_small, aes(x = SEXVAR, fill = FOODSTMP)) + geom_bar()
ggplot(brfss_small, aes(x = SEXVAR, fill = INCOME3)) + geom_bar()
ggplot(brfss_small, aes(x = X_PRACE2, fill = EMPLOY1)) + geom_bar()

ggplot(brfss_small, aes(x = SMOKDAY2, fill = ADDEPEV3)) + geom_bar()
ggplot(brfss_small, aes(x = ADDEPEV3, fill = SMOKDAY2)) + geom_bar()
ggplot(brfss_small, aes(x = EMPLOY1, fill = ADDEPEV3)) + geom_bar()

ggplot(brfss_small, aes(x = FIREARM5, fill = ADDEPEV3)) + geom_bar()
ggplot(brfss_small, aes(x = ALCDAY4, fill = ADDEPEV3)) + geom_bar()
ggplot(brfss_small, aes(x = ECIGNOW2, fill = ADDEPEV3)) + geom_bar()
ggplot(brfss_small, aes(x = X_BMI5CAT, fill = ADDEPEV3)) + geom_bar()
ggplot(brfss_small, aes(x = CHECKUP1, fill = ADDEPEV3)) + geom_bar()
ggplot(brfss_small, aes(x = LSATISFY, fill = ADDEPEV3)) + geom_bar()
ggplot(brfss_small, aes(x = GENHLTH, fill = ADDEPEV3)) + geom_bar()
ggplot(brfss_small, aes(x = EDUCA, fill = ADDEPEV3)) + geom_bar()
ggplot(brfss_small, aes(x = MARITAL, fill = ADDEPEV3)) + geom_bar()


brfss_small_m <- subset(brfss_small,brfss_small$SEXVAR == "Male")
brfss_small_f <- subset(brfss_small,brfss_small$SEXVAR == "Female")
ggplot(brfss_small_f, aes(x = ADDEPEV3, fill = CHECKUP1)) + geom_bar(position = "fill") + scale_fill_viridis_d(option="rocket")

brfss_small_m <- subset(brfss_small,brfss_small$SEXVAR == "Male")
brfss_small_f <- subset(brfss_small,brfss_small$SEXVAR == "Female")
ggplot(brfss_small_f, aes(x = ADDEPEV3, fill = X_BMI5CAT)) + geom_bar(position = "fill") + scale_fill_viridis_d(option="rocket")

Explanation:
  One interesting result is that those who have a depressive disorder tend to be more obese compared to those who do not have a depressive disorder. Another interesting result is that many participants are married and they don’t have a depressive disorder. This can indicate that marriage can reduce your chances of having a depressive disorder. Also, it seems that participants with depressive disorder are in good health compared to having a very good health. 
