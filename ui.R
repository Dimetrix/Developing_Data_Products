library(shiny)

shinyUI(fluidPage(
  titlePanel("The World's Telephones"),
  
  column(3, wellPanel(
    selectInput("input_type", "Filter type",
                c("Year", "Country"))
  )),
  
  column(3, wellPanel(# This outputs the dynamic UI component
    uiOutput("ui"))),
  
  column(5, plotOutput("qPlot", height = 300))
))