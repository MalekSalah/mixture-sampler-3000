rnormix <- function(N, p, mu_1, sigma_1, mu_2, sigma_2){
  B <- sample(1:2, size = N, replace = TRUE, prob = c(p, 1-p))
  length_p <- length(mu_1)
  # Sampling from the mixture
  Mu <- rbind(mu_1, mu_2)
  Std <- rbind(sigma_1, sigma_2)
  Y <- rnorm(N, mean = Mu[cbind(B,(seq(0,N-1) %% length_p)+1)], sd = Std[cbind(B,(seq(0,N-1) %% length_p)+1)])
  return(list("samples"=Y, "mean"=p*mu_1+(1-p)*mu_2, "sd"=sqrt(p*((sigma_1^2)+(mu_1^2)) + (1-p)*((sigma_2^2)+ (mu_2^2)) - ((p*mu_1+(1-p)*mu_2)^2))))
}
