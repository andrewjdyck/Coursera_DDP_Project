
#library(devtools)
#install_github('andrewjdyck/CanadianFootball')
library(CanadianFootball)
games <- get_all_season_games(2015)

#games$HomeWin <- ifelse(games$HomeScore>games$AwayScore, 1, 0)
#games$HomeTie <- ifelse(games$HomeScore==games$AwayScore, 1, 0)
#games$HomeLoss <- 1-games$HomeWin

season_py_exp <- do.call(
  'rbind', 
  lapply(
    unique(games$HomeTeam), 
    function(x) single_team_py_exp(games[games$Type=='Regular',], x)
  )
)
season_py_exp$WinPct <- season_py_exp$CumWins/season_py_exp$tempPlayed

# output the application data
write.csv(season_py_exp, "./Data/AppData.csv", row.names=FALSE)
