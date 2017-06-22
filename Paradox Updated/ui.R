library(shiny)
library(ggplot2)  
library(mdsr)
library(plotly)


ui<-fluidPage(
  titlePanel("Simpson's Paradox"),
  h4("Relationship of SAT scores and Teachers' Salaries"),
  tableOutput("SAT"),
  div(style = "position:absolute;top: 4.5em;right:47em;",
   actionButton("newplot2", h5("Click here first to show the plot"))),
  
  fluidRow(
    div(style = "position:absolute;top: 10em;right:42em;",
    textOutput("text1")),
    
     div(style = "position:absolute;top: 13em;right:39em;",
         sliderInput("integer", 
                     label = div(style='width:400px;', 
                                 div(style='float:left;', 'No Paradox Effect'), 
                                 div(style='float:right;', 'Actual Paradox Effect')), 
                     min = 0, max = 1, value = 1, width = '400px')),
    
    
    
    conditionalPanel("input.newplot2 != 0",
                     div(style = "position:absolute;top: 19em;right:32em;",
                     plotlyOutput("plot2")),
                     div(style = "position:absolute;top: 24em;right:12em;",
                         img(src="jingling.png", width=260))),
    
    
    div(style = "position:absolute;top: 12em;right:0.5em;",
    htmlOutput("text2"))
    )
)


