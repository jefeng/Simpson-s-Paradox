library(shiny)

library(ggplot2)  
library(mdsr)
shinyServer(function(input, output) {
  
  output$SAT<-renderTable(
    
    
    SAT_2010[c(20,21,30,38,39,5,23,49,16,27,34,42), c(1,4,8,9)]
  )
  output$text1 <- renderText({ 
    "Move the slider to see the Simpson's Paradox effect"
  })
  
  observeEvent(input$newplot2,{
    
    output$plot2<-renderPlot({
      
      SAT_2010_plot2<-SAT_2010[c(20,21,30,38,39,5,23,49,16,27,34,42),]%>%
        mutate(SAT_grp=ifelse(sat_pct<=27, "Low", "High"))
      
      integer=8714-input$integer*8714
      
      low=which(SAT_2010_plot2$salary<=55051)
      high=which(SAT_2010_plot2$salary>55051)
      SAT_2010_plot2[low, ]$salary=SAT_2010_plot2[low, ]$salary+integer
      SAT_2010_plot2[low, ]$total=SAT_2010_plot2[low, ]$total+(integer*-0.01417 )    
      
      SAT_2010_plot2[high, ]$salary=SAT_2010_plot2[high, ]$salary-integer
      SAT_2010_plot2[high, ]$total=SAT_2010_plot2[high, ]$total-(integer*-0.01417 )
      
      
      
      # ggplot(data=SAT_2010_plot2,aes(salary,total, col=SAT_grp))+
      #   geom_point()+geom_smooth(method=lm, se=FALSE)+ylab("Average Total SAT Score")+
      #   xlab("Average Teacher Salary")+geom_text(aes(label=state), size=3)+
      #   geom_smooth(method = "lm",se = F, color = "black", linetype = "dashed",lwd=1.5)
      # 
      # 
      # ggplot(data=SAT_2010_plot2,aes(salary,total, col=SAT_grp))+
      #   geom_point()+xlim(c(45111,72734))+ylim(c(1473,1781))+ylab("Average Total SAT Score")+
      #   xlab("Average Teacher Salary")
      
      
      p=ggplot(data=SAT_2010_plot2,aes(salary,total, col=SAT_grp))+geom_smooth(method='lm', se=F)+
              labs(x="Teachers'Salaries", y="SAT Scores")+geom_point()
       
       p +geom_text(aes(label=state), size=3)  + geom_smooth(method = "lm",se = F, color = "black", linetype = "longdash",lwd=1.5)
       
    },height=410,width = 637)
    
 
  })
  
  output$text2 <- renderText({ 
    HTML(paste("Low Group: States have SAT Participation Rate less than 27% (National Level)",
    "High Group: States have SAT Participation Rate greater than 27% (National Level)",
    "Delta: Distance between two center points of these two groups", 
    "Black dahed line represents the aggregated effect of the blue and red lines", sep ="<br/>"))
  })
  
}
)




