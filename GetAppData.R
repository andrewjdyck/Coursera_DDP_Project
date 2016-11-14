
#library(devtools)
#install_github('andrewjdyck/CanadianFootball')
library(CanadianFootball)
games <- get_all_season_games(2015)


AppData <- do.call(
  'rbind', 
  lapply(
    unique(games$HomeTeam), 
    function(x) single_team_py_exp(games[games$Type=='Regular',], x)
  )
)

AppData$PyExp <- NULL

# output the application data
write.csv(AppData, "./Data/AppData.csv", row.names=FALSE)
