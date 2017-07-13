library(shiny)
library(ggplot2)  
library(mdsr)
library(plotly)
library(shinyBS)

ui<-fluidPage(
  titlePanel("Simpson's Paradox"),
  
  fluidRow(
    
    
    
    div(class="col-sm-12 col-md-5 col-lg-3",
        
        #tags$style(".well{background-color: transparent;border: solid transparent}"),
        #tags$style(type="text/css", ".well { max-width: 450px; }"),
        #tags$style(type="text/css", '#leftPanel { width:500px; float:left;}'),
        #id = "leftPanel",
        h4("Relationship of SAT scores and Teachers' Salaries"),
        
        
        tableOutput("SAT1"),
        bsPopover("SAT1", "", "This dataset is about the SAT results by state in 2010. There are 12 selected states with different teachers salaries, SAT scores and SAT participation rates. The variable salary is the average teachers salaries in US dollar; The variable total is the state average SAT score; The variable sat pct is the percent of students taking SAT in that state"),
        br(),
        htmlOutput("text2")
        
        
    ),
    
    div(class="col-sm-11 col-md-7 col-lg-9",
        
        div(
          
          column(6, offset=3, actionButton("newplot2", h5("Click here first to show the plot"))),
          bsPopover("newplot2", "", "This plot shows you the original (actual) paradox effect", place="right",options = list(container = "body")),
          tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: #1C2C5B}")),
          br(),
          br(),
          br(),
          column(5,offset=2, sliderInput("integer", 
                                         label = div(style='width:400px;', 
                                                     div(style='float:left;', 'No Paradox Effect'), 
                                                     div(style='float:right;', 'Actual Paradox Effect')), 
                                         min = 0, max = 1, value = 1, width = '400px')),
          bsPopover("integer", "", "Move the slider to see how the Simpson Paradox effect changes. Default as actual paradox effect, which is the true SAT participation rates in the dataset. No paradox effect is the case that when all states have equal SAT participation rates", place="right", options = list(container = "body"))
        ),
        
        
        
        mainPanel( 
          conditionalPanel("input.newplot2 != 0",
                           div(class="col-sm-7 col-md-6 col-lg-6", style="left:13%; width:90%; height:80% ",
                               plotlyOutput("plot2"),
                               bsPopover("plot2", "", "Hover the point to see more details", placement = "right", options = list(container="body")),
                               br(),
                               div(class="col-sm-7 col-md-6 col-lg-6",  style="left:34px",
                                   img(src="jinglin.jpg", width=350)))))
        
        
    )  
  )
)



