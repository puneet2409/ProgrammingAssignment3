rankall <- function(outcome,num="best")
{
  
  val = NULL
  ## Create an empty data frame with two columns to store results
  val <- setNames(data.frame(matrix(ncol = 2, nrow = 0)), c("hospital", "state"))
  ndata = read.csv("outcome.csv",colClasses = "character")
  ## Get the names of the all the States
  States <- unique(ndata[,"State"])
  stcount <- length(States) 
  source("rankhospital.R")


  for (i in 1:stcount)
  {
      val[i,1] <- rankhospital(States[i],outcome,num)
##    result <- rbind(val,States[i])
      val[i,2] <- States[i]
  
  }
  ##val[,"hospital"],
  result <- val[order(val[,"state"]),] 
  return(result)
}