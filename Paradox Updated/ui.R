library(shiny)
library(ggplot2)  
library(mdsr)
library(plotly)
library(shinyBS)

ui<-fluidPage(
  titlePanel("Simpson's Paradox"),
  h4("Relationship of SAT scores and Teachers' Salaries"),
  tableOutput("SAT1"),

  div(style = "position:absolute;top: 3.5em;right:46em;",
   actionButton("newplot2", h5("Click here first to show the plot"))),
   bsPopover("newplot2", "", "This plot shows you the original paradox effect", place="right",  options = list(container = "body")),
  
  tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: #1C2C5B}")),
  
  fluidRow(
    
     div(style = "position:absolute;top: 13em;right:39em;",
         sliderInput("integer", 
                     label = div(style='width:400px;', 
                                 div(style='float:left;', 'No Paradox Effect'), 
                                 div(style='float:right;', 'Actual Paradox Effect')), 
                     min = 0, max = 1, value = 1, width = '400px')),
    bsPopover("integer", "", "Move the slider to see how the Simpson Paradox effect change", place="right", options = list(container = "body")),
    
    
    
    conditionalPanel("input.newplot2 != 0",
                     div(style = "position:absolute;top: 19em;right:32em;",
                     plotlyOutput("plot2")),
                     bsPopover("plot2", "", "Hover the point to see more details", placement = "right", options = list(container = "body")),
                     div(style = "position:absolute;top: 20em;right:6em;",
                         img(src="jinglin.jpg", width=350))),
    
    
    div(style = "position:absolute;top: 9em;right:0.5em;",
    htmlOutput("text2"))
    )
)


