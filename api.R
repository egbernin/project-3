#Reading in necessary packages
library(plumber)

#Reading in data and fitting final model
load('clean_data.RData')



#Returning message for info endpoint
#* @get /info
function(){
  'Emma Berninger,
  URL for rendered GitHub Pages website: '
}


#Choosing predictors and returning mean or most prevalent class
#* @param predictor Type a predictor to return
#* @get /pred
function(predictor){
  if(is.numeric(clean_data[[predictor]])){
    data <- clean_data[[predictor]]
    value_num <- mean(data)
    message_num <- paste('The mean of', predictor, 'is', value_num)
    return(message_num)
  }else if(is.factor(clean_data[[predictor]])){
    factor_data <- clean_data[[predictor]]
    table_data <- table(factor_data)
    value_factor <- names(which.max(table_data))
    message_factor <- paste('The most prevalent class of', predictor, 'is', value_factor)
    return(message_factor)
  }
}

#Three API calls
#http://127.0.0.1:17984/pred?predictor=Regionname
#http://127.0.0.1:17984/pred?predictor=Rooms
#http://127.0.0.1:17984/pred?predictor=Distance
