cars
d1=cars
d1
d1$speed
d1$dist
cov(d1$speed, d1$dist)
cor(d1$speed, d1$dist)
plot(d1,type='o',xlab='speed',ylab='dist',col='red')
plot(d1,type='p',xlab='speed',ylab='dist',col='red')
lred=lm(dist~speed,d=d1)
lred
summary(lred)
summary(d1)
plot(d1$speed, d1$dist, xlab = "speed", ylab = "Stopping distance(ft)", main = "distance vs speed", col="red")
abline(lred, col="black", lty=1, lwd=4)
