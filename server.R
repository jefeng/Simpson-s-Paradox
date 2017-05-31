library(shiny)
library(ggplot2)  
library(mdsr)
shinyServer(function(input, output) {
  output$SAT<-renderTable(SAT_2010_plot2[,-c(10)])
  observeEvent(input$newplot,{
    
    output$plot<-renderPlot({
      
      SAT_2010_new<-SAT_2010[c(1,17,49,23,18,10,2,11,8,37),]
      SAT_2010_salary_plot<-ggplot(data=SAT_2010_new,aes(x=salary,y=total))+
        geom_point()+geom_smooth(method = "lm",se = F, color = "red", linetype = "dashed")+ylab("Average Total SAT Score")+
        xlab("Average Teacher Salary")+geom_text(aes(label=state), size=3)
      SAT_2010_salary_plot
      
    },height=362,width = 488)
  })
  
  observeEvent(input$newplot2,{
    
    output$plot2<-renderPlot({
      
      SAT_2010_plot2<-SAT_2010_new%>%
        mutate(SAT_grp=ifelse(sat_pct<=27, "Low", "High"))
      ggplot(data=SAT_2010_plot2,aes(salary,total, col=SAT_grp))+
        geom_point()+geom_smooth(method=lm, se=FALSE)+ylab("Average Total SAT Score")+
        xlab("Average Teacher Salary")+geom_text(aes(label=state), size=3)+
        geom_smooth(method = "lm",se = F, color = "black", linetype = "dashed",lwd=1.5)
    },height=360,width = 557)
  })
  
}
)




