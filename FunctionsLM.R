# Generate n-dimensional response Y that follows linear regression model Y = Xbeta + epsilon, where epsilon is normal zero with variance sigma^2 independent across samples. Seed should be set at the beginning of the function
# X - design matrix
# beta - given parameter vector
# sigma - standard deviation of the noise
# seed  - starting seed value
generateY <- function(X, beta, sigma, seed = 5832652){
  #[ToDo] Set seed and generate Y following linear model
  #Sets random seed
  set.seed(seed = seed)
  #Generates normal noise component
  epsilon = rnorm(n = nrow(X), mean = 0, sd = sigma)
  #Generates signal component
  signal = X%*%beta
  Y = X%*%beta + epsilon
  # Return Y
  return(Y)
}

# Calculate beta_LS - least-squares solution, do not use lm function
# X - design matrix
# Y -response
calculateBeta <- function(X, Y){
  #Compute (X^T)(X)
  XtransposeX = crossprod(X)
  #Compute (X^T)(Y)
  XtransposeY = crossprod(X,Y)
  # Calculate beta_LS
  beta_LS = solve(XtransposeX,XtransposeY)
  # Return beta
  return(beta_LS)
}

# Calculate MSE
calculateMSE <- function(beta, beta_LS){
  MSE = as.numeric(crossprod(beta - beta_LS))
  # Return MSE - error ||beta - beta_LS||_2^2
  return(MSE)
}