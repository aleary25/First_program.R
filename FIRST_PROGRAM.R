# Load library affy
library(affy)

# Reading the microarray data
/Users/lavone/desktop/GSE344_RAW

# Reading the microarray data
setwd("/Users/lavone/desktop/GSE344_RAW")

# Load the dataset
data <- ReadAffy()

# Plot the dataset
boxplot(data)

#Set the title 
boxplot(data, xlab="Samples", ylab="Genes", main="RAW Microarray Plot", col="pink")

#Perform normalization on raw datasets
data_norm <- rma(data)

data_norm <- exprs(data_norm)

#Plot the normalized dataset
boxplot(data_norm, xlab="Samples", ylab="Genes", main="Normalized Microarray Plot", col="light blue")

#Assign first 2 samples as treatment and the next 2 samples as control
Treatment <- data_norm [,1:2]
Control <- data_norm[,3:4]

#Comparing treatment and control groups using fold-change analysis
Average_Treatment <- rowMeans(Treatment)
Average_Control <- rowMeans(Control)

Fold_change <- Average_Treatment - Average_Control

'#Fold change > 1.5 up-regulated; < 1.5 down-regulated.




