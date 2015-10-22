library(shiny)
library(ggplot2)

data(WorldPhones)

shinyServer(function(input, output) {
  output$ui <- renderUI({
    if (is.null(input$input_type))
      return()
    
    # Depending on input$input_type, we'll generate a different
    # UI component and send it to the client.
    switch(input$input_type,
           "Country" = checkboxGroupInput(
             inputId = "c", label  = "Country:",
             choices = c(
               "N.Amer" = "N.Amer",
               "Europe" = "Europe",
               "Asia" = "Asia",
               "S.Amer" = "S.Amer",
               "Oceania" = "Oceania",
               "Africa" = "Africa",
               "Mid.Amer" = "Mid.Amer"
             ),
             selected = "N.Amer"
           ),
           "Year" = checkboxGroupInput(
             inputId = "n", label  = "Year:",
             choices = c(
               "1951" = "1951",
               "1956" = "1956",
               "1957" = "1957",
               "1958" = "1958",
               "1959" = "1959",
               "1960" = "1960",
               "1961" = "1961"
             ),
             selected = "1951"
           )
    )
  })
  
  
  output$qPlot <- renderPlot({
    
    switch(input$input_type,
           "Country" = {
             dat <- as.vector(rowSums(WorldPhones[,input$c ,drop = FALSE]))
             qplot(x = unlist(dimnames(WorldPhones)[1]), y = dat,main = "Number of phones by year"
                   ,xlab = "Year", ylab = "Number of phones")
           },
           "Year" = {
             dat <- as.vector(colSums(WorldPhones[as.character(input$n), ,drop = FALSE]))
             qplot(x = unlist(dimnames(WorldPhones)[2]), y = dat,main = "Number of phones by county"
                   ,xlab = "Country", ylab = "Number of phones")
           }
    )
    
  })
  
})