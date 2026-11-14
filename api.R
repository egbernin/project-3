#Reading in necessary packages
library(plumber)

#Reading in data and fitting final model




#Returning message for info endpoint
#* @get /info
function(){
  'Emma Berninger'
  'URL for rendered GitHub Pages website: '
}


#Choosing predictors and returning mean or most prevalent class
#* @param predictor Type a predictor to return
#* @get /pred
function(predictor){
  data <- clean_data
  if(is.numeric(data[[predictor]])){
    value <- mean(data[[predictor]])
    message <- paste('The mean of', predictor, 'is', value)
    return(message)
  }else if(is.factor(data[[predictor]])){
    pred_table <- table(predictor)
    value <- names(which.max(pred_table))
    message <- paste('The most prevalent class of', predictor, 'is', value)
    return(message)
  }else{
    stop('Invalid predictor')
  }
}
#Three example calls


