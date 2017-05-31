library(shiny)
library(ggplot2)  
library(mdsr)
ui<-fluidPage(
  titlePanel("Simpson's Paradox"),
  tableOutput("SAT"),
  h4("Relationship between SAT Scores and Teachers' Salaries"),
  
  fluidPage(
    fluidRow(
      selectInput("Relationship between SAT Scores and Teachers'Salaries", 
                  "Choose the one you think is correct",
                  choices = c("Positive Relationship", "Negative Relationship", "Independent"))
      
      
    ),
    fluidRow(
      column( 1, offset = 0, actionButton("newplot","Check the result")),
      column(1, offset = 7, actionButton("newplot2", "solution")),
      br(),
      column( 6, plotOutput("plot")),
      column( 5, plotOutput("plot2"))
    )
    
  )
)
