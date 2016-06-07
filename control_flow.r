
microbenchmark( {
total_population <- c()
for(i in 1:nrow(state.x77)) {
  total_population <- c(total_population, state.x77[i, 1])
}
}
)


microbenchmark( {
total_population_2 <- c()
 for(i in 1:nrow(state.x77)) {
    total_population_2 <- append(total_population_2, state.x77[i, 1])
 }
}
)

microbenchmark( {
total_population_3 <- rep(NA, 50)
for(i in 1:nrow(state.x77)) {
  total_population_3[i] <- state.x77[i]
}
}
)

x <- runif(1e6, -1, 1)
output <- rep("NA", 1e6)

microbenchmark({
  for(i in 1:length(x)){
    if(x[i] < 0) {
      output[i] <- "Not Positive"
    }
    
    if(x[i] >= 0) {
      output[i] <- "Positive"
    }
  }
  
})

microbenchmark({
  output <- ifelse(x < 0, "Not Positive", "Positive")
})

microbenchmark({
  output[x >= 0] <- "Positive"
  output[x < 0] <- "Not Positive"
})


