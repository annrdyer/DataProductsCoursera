library(shiny)
library(ggplot2)

data <- read.csv(file="CityTemps.csv",head=TRUE,sep=",")


shinyServer(  
  function(input, output) {  
                     
       output$newPlot <- renderPlot({
       
       plotData <- subset(data, data$City == input$city1 | data$City == input$city2)
          
       if(input$type == "AveTemp" & input$units == "Celsius") {
       ggplot(plotData, aes(x = Month, y = (AveTemp-32)/1.8, colour = City)) + geom_line(size=1) + geom_point(size=4) +
         ggtitle("Average Monthly Temperature") + labs(x="Month",y="Degrees Celsius") +
         scale_x_discrete(labels= c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")) +        
         scale_y_continuous( limits = c(-10,40) ) +
         theme(plot.title = element_text(face="bold", size=17)) +
         theme(axis.text.x=element_text(size=15)) +
         theme(axis.text.y=element_text(size=15)) +
         theme(axis.title.x = element_text(size = 17)) +
         theme(axis.title.y = element_text(size = 17)) +
         theme(legend.title=element_text(size=15))
       
       }
       
       else if(input$type == "AveTemp" & input$units == "Fahrenheit") {
         ggplot(plotData, aes(x = Month, y = AveTemp, colour = City)) + geom_line(size=1) + geom_point(size=4) +
           ggtitle("Average Monthly Temperature") + labs(x="Month",y="Degrees  Fahrenheit") +
           scale_x_discrete(labels= c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")) +
           scale_y_continuous( limits = c(20,100) ) +
           theme(plot.title = element_text(face="bold", size=17))  +
           theme(axis.text.x=element_text(size=15)) +
           theme(axis.text.y=element_text(size=15))  +
           theme(axis.title.x = element_text(size = 17)) +
           theme(axis.title.y = element_text(size = 17)) +
           theme(legend.title=element_text(size=15))
       }
       
       
       else if(input$type == "LowTemp" & input$units == "Celsius") {
       ggplot(plotData, aes(x = Month, y = (LowTemp-32)/1.8, colour = City)) + geom_line(size=1) + geom_point(size=4) +
         ggtitle("Average Monthly Low Temperature") + labs(x="Month",y="Degrees Celsius") +
         scale_x_discrete(labels= c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")) +
         scale_y_continuous( limits = c(-10,40) ) +
         theme(plot.title = element_text(face="bold", size=17))  +
         theme(axis.text.x=element_text(size=15)) +
         theme(axis.text.y=element_text(size=15))  +
         theme(axis.title.x = element_text(size = 17)) +
         theme(axis.title.y = element_text(size = 17)) +
         theme(legend.title=element_text(size=15))
       }
       
       
       else if(input$type == "LowTemp" & input$units == "Fahrenheit" ) {
         ggplot(plotData, aes(x = Month, y = LowTemp, colour = City)) + geom_line(size=1) + geom_point(size=4) +
           ggtitle("Average Monthly Low Temperature") + labs(x="Month",y="Degrees Fahrenheit") +
           scale_x_discrete(labels= c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")) +
           scale_y_continuous( limits = c(20,100) ) +
           theme(plot.title = element_text(face="bold", size=17))  +
           theme(axis.text.x=element_text(size=15)) +
           theme(axis.text.y=element_text(size=15))  +
           theme(axis.title.x = element_text(size = 17)) +
           theme(axis.title.y = element_text(size = 17)) +
           theme(legend.title=element_text(size=15))
       }
     
       else if(input$type == "HighTemp" & input$units == "Celsius") {
       ggplot(plotData, aes(x = Month, y = (HighTemp-32)/1.8, colour = City)) + geom_line(size=1) + geom_point(size=4) +
         ggtitle("Average Monthly High Temperature") + labs(x="Month",y="Degrees Celsius") +
         scale_x_discrete(labels= c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")) +
         scale_y_continuous( limits = c(-10,40) ) +
         theme(plot.title = element_text(face="bold", size=17))  +
         theme(axis.text.x=element_text(size=15)) +
         theme(axis.text.y=element_text(size=15))  +
         theme(axis.title.x = element_text(size = 17)) +
         theme(axis.title.y = element_text(size = 17)) +
         theme(legend.title=element_text(size=15))
       }     
       
       
       else if(input$type == "HighTemp" & input$units == "Fahrenheit") {
         ggplot(plotData, aes(x = Month, y = HighTemp, colour = City)) + geom_line(size=1) + geom_point(size=4) +
           ggtitle("Average Monthly High Temperature") + labs(x="Month",y="Degrees Fahrenheit") +
           scale_x_discrete(labels= c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")) +
           scale_y_continuous( limits = c(20,100) ) +
           theme(plot.title = element_text(face="bold", size=17))  +
           theme(axis.text.x=element_text(size=15)) +
           theme(axis.text.y=element_text(size=15))  +
           theme(axis.title.x = element_text(size = 17)) +
           theme(axis.title.y = element_text(size = 17)) +
           theme(legend.title=element_text(size=15))
       }      
       
       })
     
   }  
)  