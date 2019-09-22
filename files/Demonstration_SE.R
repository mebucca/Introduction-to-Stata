# This code is a demonstration of what the Standard Error of an average is: the standard deviation of the estimate of the mean 
# across "infinite" samples. 

set.seed(13232)

# Theoretical parameters
mu
sigma = (105/36)^(1/2)
n = 500



# Our sample: a random sample of dice throws 

our_sample <- sample(x = 1:6, size = n, replace = TRUE)
plot(table(our_sample), xlab = 'Values', ylab = 'Frequency', main = '500 Rolls of 1 Fair Dice')
mean(our_sample)


#  Demonstration of the distrution of mu_hat across 1000 samples.

mues_hat = NULL

for (i in 1:1000) {
  
  a_sample <- sample(x = 1:6, size = 500, replace = TRUE)
  mu_hat <- mean(a_sample) 
  mues_hat <- c(mues_hat,mu_hat)
  
}


# Mean and SD of mu_hat 

mean_mu_hat <- mean(mues_hat)
sd_mu_hat  <- sd(mues_hat)

# mean of mu_hat  = mu
mean_mu_hat; mu

# sd of mu_hat  = sigma/sqrt(n)
sd_mu_hat; sigma/sqrt(n)

# Distribution of mu_hat: approximately normal
hist(mues_hat)
abline(v = mean(mues_hat), col="red", lwd=3, lty=2)
