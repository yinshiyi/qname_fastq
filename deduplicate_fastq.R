
#setwd("~/Documents/shiyi")


library(data.table)
library(dplyr)
library("microseq")
# install.packages("microseq")
# https://rdrr.io/cran/microseq/man/readFastq.html
args = commandArgs(trailingOnly=TRUE)

# f<-read.table(args[1])
f<-readFastq(args[1])

df<-f%>%
  distinct(Header,.keep_all = T)

writeFastq(df, "A9161.fastq.out_dedup.fq")
write.table(file="test.list",df$Header,quote=F,row.names=F,col.names=F)
