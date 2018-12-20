ir <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]),
			species=factor(c(rep("sv", 50), rep("c", 50),
			rep("sv", 50))))
samp <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150, 25))
hidden = c(1:10)
iter = c(1:10)
decay = 0
trave_learn = rep(0, length(hidden))
trave_test = rep(0, length(hidden))
res_s = c()
tr_learn = matrix(0, length(iter), length(hidden))
tr_test = matrix(0, length(iter), length(hidden))
for (i in 1:length(hidden)) {
  for (j in 1:length(iter)) {
  	res_s = c(list(nnet(species~., data=ir[samp,], size=hidden[i], 
              rang=0.5, decay=decay, maxit=200)), res_s)
	out_learn = predict(res_s[i][[1]], ir[samp,], type="class")
	out_test = predict(res_s[i][[1]], ir[-samp,], type="class")
	tr_learn[j, i] = mean(out_learn != ir[samp,]$species)
	tr_test[j, i] = mean(out_test != ir[-samp,]$species)
  }
  trave_learn[i] = mean(tr_learn[, i])
  trave_test[i] = mean(tr_test[, i])
}
res_s = rev(res_s)

trave_learn[1]
trave_test[1]
plot(hidden, trave_learn, type="b", lty=1, lwd=2)
plot(hidden, trave_test, type="b", lty=1, lwd=2)
which.min(trave_learn)
which.min(trave_test)
hist(res_s[which.min(trave_learn)][[1]]$wts, breaks=seq(-20, 20, 5), freq=TRUE)
hist(res_s[which.min(trave_test)][[1]]$wts, breaks=seq(-20, 20, 5), freq=TRUE)
hidden = c(1:10)
iter = c(1:10)
decay = 0.01
trave_learn = rep(0, length(hidden))
trave_test = rep(0, length(hidden))
res_s = c()
tr_learn = matrix(0, length(iter), length(hidden))
tr_test = matrix(0, length(iter), length(hidden))
for (i in 1:length(hidden)) {
  for (j in 1:length(iter)) {
  	res_s = c(list(nnet(species~., data=ir[samp,], 
                        size=hidden[i], rang=0.5, decay=decay, maxit=200)), res_s)
	out_learn = predict(res_s[i][[1]], ir[samp,], type="class")
	out_test = predict(res_s[i][[1]], ir[-samp,], type="class")
	tr_learn[j, i] = mean(out_learn != ir[samp,]$species)
	tr_test[j, i] = mean(out_test != ir[-samp,]$species)
  }
  trave_learn[i] = mean(tr_learn[, i])
  trave_test[i] = mean(tr_test[, i])
}
res_s = rev(res_s)
plot(hidden, trave_learn, type="b", lty=1, lwd=2)
plot(hidden, trave_test, type="b", lty=1, lwd=2)
which.min(trave_learn)
which.min(trave_test)
hist(res_s[which.min(trave_learn)][[1]]$wts, breaks=seq(-6, 6, 1), freq=TRUE)
hist(res_s[which.min(trave_test)][[1]]$wts, breaks=seq(-6, 6, 1), freq=TRUE)
