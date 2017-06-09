library(shiny)
library(ggplot2)  
library(mdsr)
ui<-fluidPage(
  titlePanel("Simpson's Paradox"),
  h4("Relationship of SAT scores and Teachers' Salaries"),
  tableOutput("SAT"),
  div(style = "position:absolute;top: 4.5em;right:47em;",
   actionButton("newplot2", h5("Click here first to show the plot"))),
  
  fluidRow(
    div(style = "position:absolute;top: 10em;right:42em;",
    textOutput("text1")),
    
    div(style = "position:absolute;top: 13em;right:43em;",
      sliderInput("integer", "Delta:",
                  min=0, max=8714, value=8714)),
    
    div(style = "position:absolute;top: 19em;right:24em;",
       plotOutput("plot2")),
    
    div(style = "position:absolute;top: 10em;right:2em;",
    htmlOutput("text2"))
    )
)


