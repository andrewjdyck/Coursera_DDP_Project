CFL Pythagorean Expectation
========================================================
author: Andrew Dyck
date: November 13, 2016
autosize: true

Intro to Pythagorean Expectation
========================================================

Introducing a new shiny application to explore predicted wins in professional Canadian football. 

<https://andrewjdyck.shinyapps.io/cfl_pythagorean_expectation/>.

- A method of predicting team performance used in Baseball for many years adapted to Canadian football
- The model is far from perfect but is simple to compute with the most basic data.
- Predictions are reasonable given the simplicity.


Calculation & Mathematical Representation
========================================================

The only data required for the model is the total points for and against for a given team. The calculation is expressed as:

$$
Win Ratio = \frac{1}{1 + (Points For/Points Against)^{\alpha}}
$$

Where the parameter $\alpha$ is estimated to be 2.37 based on data from the National Football League (NFL). 

Whether this parameter fits Canadian Football as well is the subject of future exploration.

Performance of Pythagorean Expectation
========================================================
The model adapted to Canadian football seems to perform reasonably well, but some teams' actual win % is as low as half the expected value (SSK).

```
  Team     PyExp    WinPct  Error
1  WPG 0.3026832 0.2777778 0.0006
2   BC 0.4373626 0.3888889 0.0023
3  CGY 0.6826371 0.7777778 0.0091
4  EDM 0.6770305 0.7777778 0.0102
5  HAM 0.6728011 0.5555556 0.0137
6  TOR 0.4233545 0.5555556 0.0175
7  MTL 0.4805327 0.3333333 0.0217
8  ORB 0.5116033 0.6666667 0.0240
9  SSK 0.3455401 0.1666667 0.0320
```



Thank you!
========================================================

Please visit my Shiny App built with Rstudio to see Pythagorean Expectation in action:

<https://andrewjdyck.shinyapps.io/cfl_pythagorean_expectation/>

Thanks!


