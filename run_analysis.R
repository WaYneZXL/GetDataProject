xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
mergetrain <- cbind(xtrain, subtrain, ytrain)

xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
mergetest <- cbind(xtest, subtest, ytest)

mergedata <- rbind(mergetrain, mergetest)
mydata <- mergedata[,c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543, 562, 563)]


mydata[,66] <- replace(mydata[,66],mydata[,66]==1,"WALKING")
mydata[,66] <- replace(mydata[,66],mydata[,66]==2,"WALKING_UPSTAIRS")
mydata[,66] <- replace(mydata[,66],mydata[,66]==3,"WALKING_DOWNSTAIRS")
mydata[,66] <- replace(mydata[,66],mydata[,66]==4,"SITTING")
mydata[,66] <- replace(mydata[,66],mydata[,66]==5,"STANDING")
mydata[,66] <- replace(mydata[,66],mydata[,66]==6,"LAYING")


feature <- read.table("./UCI HAR Dataset/features.txt")
f <- feature[c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543),2]

g <- vector()
for (i in 1:64) {
	g[i] <- gsub("-|\\()", "", f[i])
}
label <- c(g, "subject", "activity")

colnames(mydata) <- label

mydata1 <- mydata[,1:64]
tidy_data <- aggregate(mydata1, by = list(mydata$activity, mydata$subject), FUN = mean)
	⁃	
