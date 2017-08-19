best <- function(state,outcome){
  
  data <- read.csv("outcome.csv",colClasses = "character")
  fd <- as.data.frame(cbind( data[,2],  # hospital
                             data[, 7],   # state
                             data[, 11],  # heart attack
                             data[, 17],  # heart failure
                             data[, 23]), # pneumonia
                             stringsAsFactors = FALSE)
    
  colnames(fd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
  
  if (!state %in% fd[,"state"])
  {   stop("Invalid State") }
  
  else if (!outcome %in% c("heart attack", "heart failure", "pneumonia"))
  {   stop("Invalid Outcome") }
  else 
  {
    st <- which(fd[,"state"] == state)
    nw <- fd[st,]
    nw2 <- as.numeric(nw[,outcome])
    min_val <- min(nw2,na.rm = TRUE)
    result <- nw[,"hospital"][which(nw2 == min_val)]
    result <- result[order(result)]
  }
  return(result)
  
  
}