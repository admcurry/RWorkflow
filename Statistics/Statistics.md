# Statistics

**Statistics is the practice and study of collecting and analysing data.**  
**A summary statistic is a fact or summary of some data.**

### Mean:
```
mean(data)
```

### Variance:
The average distance from each data point to the data’s mean.
```
dists <- data - mean(data)
variance <- dists^2 / count(data) - 1

var(data)
```

### Standard Deviation
```
sd(data)
```

### Quartiles
Quartiles split up data into four equal parts.
The interquartile range is the difference between the 25th and 75th percentile.
```
quantile(data)

quantile(data, 0.75) - quantile(data, 0.25)
```

### Outliers

