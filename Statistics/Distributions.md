# Distributions 

### The Binomial Distribution

A probability distribution of the number of successes in a sequence of independent trials.  
For example the number of heads in a sequence of coin flips.

$n$: the total number of trials    
$p$: the probability of success

```
rbinom(3,10,0.5) #Outputs either 1 or 0
```

```
dbinom(7,10,0.5)
dbinom(0:20, 20, 0.5)
```

### The Uniform Distribution

<img width="612" alt="Screenshot 2023-02-16 at 17 10 48" src="https://user-images.githubusercontent.com/124198480/219450369-03972dd9-565b-4e64-ba61-53d1ef24ccad.png">

```
punif(7, min = 0, max = 12) #Probability of waiting less than 7 minutes
punif(7, min = 0, max = 12, lower.tail = FALSE) #Probability of waiting more than 7 minutes
punif(7, min = 0, max = 12) - punif(4, min = 0, max = 12) #Probability of waiting between 4 and 7 minutes
```

```
wait_times %>%
  mutate(time = runif(1000, 0,30))
```

### The Normal Distribution

The normal distribution is described by it’s mean and standard deviation.

A *****************************standard normal distribution***************************** has $\mu = 0$ and $\sigma = 1$.

68% of the area of the normal distribution falls within one standard deviation, 95% is within two, and 99.7% is within three

```
pnorm(154, mean = 161, sd = 7)
```

```
rnorm(10, mean = 161, sd = 7)
```
