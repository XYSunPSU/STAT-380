set.seed(77)

trainPrice <- sub_train$SalePrice
testPrice <- sub_test$SalePrice

dummies<- dummyVars(SalePrice ~ ., data = sub_train)

train1 <- predict(dummies, newdata = sub_train)
test1 <- predict(dummies, newdata = sub_test)

train1 <- data.table(train1)
train1$SalePrice <- trainPrice
test1 <- data.table(test1)

lm_model <- lm(SalePrice~., data = train1)

summary(lm_model)

saveRDS(dummies, "./House Price/project/volume/models/DepDelay_lm.dummies")
saveRDS(lm_model,"./House Price/project/volume/models/DepDelay_lm.model")


test1$pred <- predict(lm_model, newdata = test1)

submit <- test1[,.(pred)]

submit <- tibble::rowid_to_column(submit, "Id")
colnames(submit)[2] <- "SalePrice"
fwrite(submit, "/Users/xunyuansun/opt/STAT-380/House Price/project/volume/data/processed/submit.csv")
