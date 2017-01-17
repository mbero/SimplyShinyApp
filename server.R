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
    # sledzie <- sledzie[, -1] # usuwam pierwszy wiersz z numeracja wierszy od 0 do n-1
    
    # 5. rozmiar zbioru i statystyki
    dim(sledzie)
    str(sledzie)
    summary(sledzie)
    
    # sprawdz braki, ile ich jest
    apply(sledzie, 2, function(x) sum(is.na(x)))
    
    # sprawdz braki, jaki procent
    apply(sledzie, 2, function(x) sum(is.na(x))/length(x)) # ok 0,03%
    
    # czym zastapic braki? moze srednia?
    sledzie <- data.frame(apply(sledzie, 2, function(x) {
      ind <- which(is.na(x))
      srednia <- mean(x, na.rm = TRUE)
      x[ind] <- srednia
      x
    }))
    
    
    output$histogram <- renderPlot({
      title <- "Fishes histogram"
       hist(runif(sledzie))
    })
    
  }
)