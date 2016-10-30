
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })
  
  output$SeasonPyExpPlot <- renderPlot({
    #season <- input$season
    season <- 2014
    games <- get_all_season_games(season)
    season_py_exp <- do.call(
      'rbind', 
      lapply(
        unique(games$HomeTeam), 
        function(x) single_team_py_exp(games[games$Type=='Regular',], x)
      )
    )
    
    ggplot(season_py_exp, aes(WeekNumber, PyExp, colour=Team)) +
      geom_line() +
      geom_point()
  })

})
