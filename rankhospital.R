rankhospital <- function(state,outcome,num ="best")
{
  
  data = read.csv("outcome.csv",colClasses = "character")
  fd <- as.data.frame(cbind( data[,2],  # hospital
                             data[, 7],   # state
                             data[, 11],  # heart attack
                             data[, 17],  # heart failure
                             data[, 23]), # pneumonia
                      stringsAsFactors = FALSE)
  
  colnames(fd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
  
    if (!state %in% fd[,"state"])
    { stop("Invalid State") }
  
  else if (!outcome %in% c("heart attack", "heart failure", "pneumonia"))
  {   stop("Invalid Outcome") }
  else 
  {
    
    ## all the entries with the state 
    st <- which(fd[,"state"]==state)
    ## extract the table with the "st" as the state
    nw <- fd[st,]
    
    ## arrange the table based on outcome  
    nw2<- nw[order(as.numeric(nw[,outcome]),na.last = NA),]
    
    ## Get the row count of the table
    rcount <- nrow(nw2)
    ## Get the name of the hospital
    
    if (num == "worst")
    {
      ## Get the value in numeric
##      value <- as.numeric(nw2[rcount,outcome])
  ## Get the hospital names with the worst value
##      result <- nw2[,"hospital"][which(nw2[,outcome] == value)]
    ## the ordered result
##      result <- result[order(result)]
      
      result <- nw2[order(as.numeric(nw2[,outcome]),nw2[,"hospital"]),]
    
    return(result[rcount,"hospital"])
      
##      return(result)
      
    } 
    else if (num =="best")
    {
      ## Get the value in numeric
##      value <- as.numeric(nw2[1,outcome])
      ## Get the hospital names with the worst value
##      result <- nw2[,"hospital"][which(nw2[,outcome] == value)]
      ## the ordered result
    
      result <- nw2[order(as.numeric(nw2[,outcome]),nw2[,"hospital"]),]
      
        return(result[1,"hospital"])
      
 ##     return(result)
    }
    else if (num > nrow(nw2))
    {
      return("NA")
    }
    else 
    {
      
      ## arrange on the based on the two columns
      result <- nw2[order(as.numeric(nw2[,outcome]),nw2[,"hospital"]),]
      ## Get the value in numeric
 ##     value <- as.numeric(nw2[num,outcome])
      ## Get the hospital names with the worst value
##      result <- nw2[,"hospital"][which(nw2[,outcome] == value)]
      ## the ordered result
##      result <- result[order(result)]
      
      return(result[num,"hospital"])
      
    }
    
    
  }
  
  
  
  
  
  }