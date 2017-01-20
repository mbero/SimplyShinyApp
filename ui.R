library(shiny)
library(ggplot2)

shinyUI(
  fluidPage(
  
  titlePanel("Fish analysis - Sample Shiny App"),
  fluidRow(
    
    sidebarPanel(
      h3('Data presentation as table'),  
      p('In the right side we see interactive table with data from file sledzie.csv')
     
    ),
    mainPanel(
      h4('Hello from mainPanel'),
      #plotOutput('histogram')
          column(4,
                 selectInput("xmonth",
                             "Months:",
                             c("1","2","3"))
          ),
        # Create a new row for the table.
        fluidRow(
          dataTableOutput("table")
        )
    
    )#end of mainPanel
    
  )#end first fluidRow
  ,
  fluidRow(    
    sidebarPanel(
      h3('Histogram'),
      p('Choose variable to generate histogram with shows changes of given variable trough time'),
      selectInput("property", "Choose property :",
                  list("Month" = "xmonth", 
                       "Length" = "length"
                  ))
    ),
    mainPanel(
      #histogram with selected property
      plotOutput(outputId = "hist") 
    )
  )
))