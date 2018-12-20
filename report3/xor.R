#!/usr/bin/env Rscript
#=と<-の使い分け
#=  : グローバル、(関数内で外側の参照されない?要検証)
#<- : レキシカルスコープただしfor等はスコープを作らない
set.seed(0)
library(nnet)
library(MASS)
x1 <- c(0, 0)
x2 <- c(0, 1)
x3 <- c(1, 0)
x4 <- c(1, 1)
x <- rbind(x1, x2, x3, x4)
y <- c("-1", "1", "1", "-1")
xor <- data.frame(x, classes=y)
#head(xor)
#mlp <- nnet(classes~., data=xor, size=2, rang=0.5, decay=0, maxit=100)
#summary(mlp)
#hist(mlp$wts, breaks=seq(-100, 100,5), freq=TRUE)
#table(xor$classes,predict(mlp, xor, type="class"))

hidden <- c(1:40)
iter   <- c(1:10)
trave  <- rep(0,length(hidden))
tr     <- matrix(0,length(iter),length(hidden))
models <- rep(list(list()), length(hidden))
for(i in 1:length(hidden)){
	for(j in 1:length(iter)){
		print(paste(as.character(i), as.character(j)))
		capture.output( #出力抑制
			model <- nnet(classes~., data=xor, size=hidden[i], rang=0.1)
		)
		models[[i]][[j]] <- model
		out <- predict(model, xor, type="class")
		tr[j,i] <- mean(out != xor$classes)
 }
	trave[i] <- mean(tr[,i])
}

#1. 隠れ素子を一つずつ増やし、10 回の学習で 10 回とも正しく識別できるようになった。隠れ素子の数を求めなさい。 
q1 <- function(){
	#<<-はグローバル変数に代入
	first_match <<- which(trave == 0)[1] #複数マッチするので一番初めを取り出す
	print(first_match)
}

#2. 隠れ素子の数によって誤識別率の平均がどのように変化するかをグラフで示しなさい。
q2 <- function(){
	plot(hidden, trave, type="b")
	#	 , lty=1, lwd=2)
}

#3. 隠れ素子が 1 個の場合に得られた学習結果について、結合係数の大きさの分布を示しなさい。
q3 <- function(){
	hist(models[[1]][[1]]$wts, breaks=seq(-100, 100,5), freq=TRUE)
}

#4. 10回とも正しく識別できた場合の学習結果について、結合係数の大きさの分布を示し、隠れ素子が１個の場合と比較検討しなさい。
q4 <- function(){
	hist(models[[first_match]][[1]]$wts, breaks=seq(-100, 100,5), freq=TRUE)
}

main <- function(){
	if(dev.cur() > 1) dev.off() #clf
	q1()
	q2()
	q3()
	q4()
	
}
