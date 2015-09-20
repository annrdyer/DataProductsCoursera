library(shiny)


shinyUI(  
   pageWithSidebar(  
    
     headerPanel('Temperature Comparison By City'),
                 
     sidebarPanel(  
       
       p('Make your selections and click Submit to update the graph.'),  
       
       
       radioButtons(inputId="units", label="Select Temperature Units:", 
                    choices=c("Celsius" = "Celsius", "Fahrenheit" = "Fahrenheit")),
       
       
       radioButtons(inputId="type",label="Select Temperature Type:",
                    choices= c("Average" = "AveTemp", "Average Low" = "LowTemp", "Average High" = "HighTemp")),  
       
       
       selectInput(inputId="city1", label="Select First City:", selected = "London",
                   choices=list("Houston" = "Houston",
                                "London" = "London",  
                                "Mumbai" = "Mumbai",
                                "New York" = "New York",   
                                 "San Francisco" = "San Francisco",
                                "Sao Paulo" = "Sao Paulo",
                                "Shanghai" = "Shanghai" )),
       
       
       selectInput(inputId="city2", label="Select Second City:", selected = "New York",
                   choices=list("Houston" = "Houston",
                                "London" = "London",  
                                "Mumbai" = "Mumbai",
                                "New York" = "New York",   
                                "San Francisco" = "San Francisco",
                                "Sao Paulo" = "Sao Paulo",
                                "Shanghai" = "Shanghai" )),
       
            
       submitButton('Submit')  
     ),
     mainPanel(  
        
        p('This Shiny App generates a graph of historical monthly temperatures based on user input of temperature units, temperature type, and city selections.  Temperature data was obtained from www.weatherbase.com.'), 
        
        plotOutput('newPlot')
      )  
    )  
)  
