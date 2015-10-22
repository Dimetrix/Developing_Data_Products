library(shiny)

shinyUI(fluidPage(
  titlePanel("The World's Telephones"),

  fluidRow(column(width = 8,"This application uses data from WorldPhones dataset.")),
  fluidRow(column(width = 8,"Based on selected type of filter (Year or Country) it displays number of phones by check-boxed years or countries.")),
  fluidRow(column(width = 8,"App Usage:")),  
  fluidRow(column(width = 8,offset = 1, "1. Select filter type;")),   
  fluidRow(column(width = 8,offset = 1, "2. Check boxes of Years or Countries you are interested in;")), 
  fluidRow(column(width = 8,offset = 1, "3. Observe figure.")),
  fluidRow(column(width = 8,"------------------------------------------------------------------------------------------------------------------------")),  
  
  column(3, wellPanel(
    selectInput("input_type", "Filter type",
                c("Year", "Country"))
  )),
  
  column(3, wellPanel(# This outputs the dynamic UI component
    uiOutput("ui"))),
  
  column(5, plotOutput("qPlot", height = 300))
))