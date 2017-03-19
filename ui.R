#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Pi Estimator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
       sliderInput("points",
                   "Number of points to use in estimation:",
                   min = 500,
                   max = 500000,
                   value = 5000,
                   step = 500)
    ),


    # Show a plot of the generated distribution
    mainPanel(
       h1("Estimate of Pi"),
       p("This estimates pi using Monte Carlo simulation. More information is available in the manual."),
       plotOutput("piPlot")
    )
  )
))
