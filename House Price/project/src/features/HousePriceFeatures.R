
train <- fread("/Users/xunyuansun/opt/STAT-380/House Price/project/volume/data/raw/Stat_380_train.csv")
test <- fread("/Users/xunyuansun/opt/STAT-380/House Price/project/volume/data/raw/Stat_380_test.csv")

set.seed(77)


house <-bind_rows(train, test)

# find the number of missing value values in each columns in train dataset
colSums(sapply(train, is.na))
test$SalePrice <-rep(NA, 5000)

sub_train <- train[,.(LotArea, OverallQual, OverallCond, FullBath, HalfBath, TotRmsAbvGrd, YearBuilt, TotalBsmtSF, BedroomAbvGr, GrLivArea, PoolArea, SalePrice)]
sub_test <- test[,.(LotArea, OverallQual, OverallCond, FullBath, HalfBath, TotRmsAbvGrd, YearBuilt, TotalBsmtSF, BedroomAbvGr, GrLivArea, PoolArea, SalePrice)]




