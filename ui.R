library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Tytul"),
  fluidRow(
    
    sidebarPanel(
      h3('Hello from sidebar')  
    ),
    mainPanel(
      h4('Hello from mainPanel'),
      plotOutput('histogram')
    )
    
  )
))