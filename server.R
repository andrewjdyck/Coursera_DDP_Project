
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(reshape2)
library(ggplot2)

shinyServer(function(input, output) {
  
  dataInput <- reactive({
    AppData <- read.csv('./Data/AppData.csv', stringsAsFactors = FALSE)
    AppData[AppData$Team == input$team, ]
  })
  
  # This function calculates the expected win percent (Pythagorean Expectation)
  pythagorean_expectation <- function(PointsFor, PointsAgainst, exponent=2.37) {
    py_exp <- PointsFor^exponent/(PointsFor^exponent + PointsAgainst^exponent)
    return(py_exp)
  }
  
  finalInput <- reactive({
    if (!input$showactual) {
      temp <- dataInput()
      temp$PyExp <- pythagorean_expectation(temp$CumPointsFor, temp$CumPointsAgainst)
      temp <- temp[, c('WeekNumber', 'PyExp')]
      names(temp) <- c('WeekNumber', 'Value')
      temp$Variable <- 'ExpectedWinPct'
    } else {
      temp <- dataInput()
      temp$PyExp <- pythagorean_expectation(temp$CumPointsFor, temp$CumPointsAgainst)
      temp$ActualWinPct <- temp$CumWins/temp$gamesPlayed
      temp <- temp[, c('WeekNumber', 'PyExp', 'ActualWinPct')]
      names(temp) <- c('WeekNumber', 'ExpectedWinPct', 'ActualWinPct')
      temp <- melt(temp, id.vars=c('WeekNumber'))
      names(temp) <- c('WeekNumber', 'Variable', 'Value')
    }
    return(temp)
  })
  
  output$SeasonPyExpPlot <- renderPlot({
      ggplot(finalInput(), aes(WeekNumber, Value, colour=Variable)) + geom_line() 
  })

})
