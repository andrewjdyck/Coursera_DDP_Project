
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
  
  finalInput <- reactive({
    if (!input$showactual) {
      temp <- dataInput()
      temp <- temp[, c('WeekNumber', 'PyExp')]
      names(temp) <- c('WeekNumber', 'Value')
      temp$Variable <- 'ExpectedWinPct'
    } else {
      temp <- dataInput()
      temp <- temp[, c('WeekNumber', 'PyExp', 'WinPct')]
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
