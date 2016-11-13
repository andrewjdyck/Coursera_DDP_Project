
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(CanadianFootball)
library(ggplot2)

shinyUI(fluidPage(

  # Application title
  titlePanel("Canadian Football Expected vs. Actual Win Ratio (2015)"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("team", "Team:",
                  c("Saskatchewan Roughriders" = 'SSK', 
                    "BC Lions" = 'BC',
                    "Calgary Stampeders"= "CGY", 
                    "Edmonton Eskimos" = "EDM", 
                    "Winnipeg Blue Bombers" = "WPG", 
                    "Hamilton Tiger Cats" = "HAM", 
                    "Toronto Argonauts" = 'TOR', 
                    "Montreal Alouettes" = 'MTL', 
                    "Ottawa REDBLACKS" = 'ORB'
                    )
                  ),
      checkboxInput("showactual", "Show Actual Win %", FALSE),
      helpText(
        "This application is an exploration of the effectiveness of 
        Pythagorean Expectation for prediction of wins in pro football.

        Select a Canadian Football League (CFL) team from above to display their
        expected win percentage throughout the 2015 season. Then select the 
        'Show Actual Win %' checkbox to compare the predicted vs. actual win %."
      )
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("SeasonPyExpPlot")
    )
  )
))
