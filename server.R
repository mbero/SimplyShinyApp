library(shiny)
library(knitr, warn.conflicts = FALSE)
library(dplyr, warn.conflicts = FALSE)
library(ggplot2, warn.conflicts = FALSE)

library(tidyverse)
library(gplots)
library(rpart)
library(randomForest)


shinyServer(
  function(input, output) {
    
    # 3. wczytanie danych i 4. przetworzenie brakujacych danych
    sledzie <- read.csv("sledzie.csv", na.strings = "?")
    
    sledzie_sample <- read.csv("sledzie.csv", nrows = 10)
    # sledzie <- sledzie[, -1] # usuwam pierwszy wiersz z numeracja wierszy od 0 do n-1
    
    # czym zastapic braki? moze srednia?
    sledzie <- data.frame(apply(sledzie, 2, function(x) {
      ind <- which(is.na(x))
      srednia <- mean(x, na.rm = TRUE)
      x[ind] <- srednia
      x
    }))
   
    output$table = renderDataTable({
      sledzie
    })
    
    output$hist <- renderPlot({
      
      # Render a barplot
      barplot(sledzie[,"length"], 
              main="length",
              ylab="Length of fish",
              xlab="Time")
    })
    
    
  }
)