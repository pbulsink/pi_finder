#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    # generate points based on input$points from ui.R

  output$piPlot <- renderPlot({
    # draw the plot!
    x <- runif(n = input$points)
    y <- runif(n = input$points)
    isPi <- ifelse(sqrt(x^2 + y^2)<=1, TRUE, FALSE)
    pidf<-data.frame(x, y, isPi)
    piVal<- 4*sum(isPi)/input$points

    ggplot(pidf, aes(x=x, y=y)) + geom_point(aes(colour=factor(isPi))) + annotate('text', label=paste0("pi estimate = ", round(piVal, 6)), x=0.3, y=0.3, size = 8)
  })

})
