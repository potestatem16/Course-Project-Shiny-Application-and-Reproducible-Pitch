#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


# Define server logic required to draw a histogram
#shinyServer(function(input, output) {

#output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2]
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')

#})

#})

library(shiny)
shinyServer(function(input, output) {
    
    values <- reactiveValues()
    
    observe({
        input$FindBMI
        values$bmi <- isolate({
            
            (input$ing_weight_kg/((input$int_height_cm/100)^2))
            
            
            
        })
    })
    
    
    
    # Display your current values
    output$current_height <- renderText({
        input$FindBMI
        paste("Your current height in cm is:", isolate(input$int_height_cm))
    })
    
    output$current_weight <- renderText({
        input$FindBMI
        paste("Your current weight in Kg is: ", isolate(input$ing_weight_kg))
    })
    
    
    output$status_indicator <- renderText({
        
        
        if(input$FindBMI == 0) ""
        else {
            
            if (values$bmi < 18.5)
            {
                values$status_indicator = "Underweight"
                
            }
            
            else if (values$bmi < 24.9)
            {
                values$status_indicator="Normal weight"
            }
            else if (values$bmi < 29.9)
            {
                values$status_indicator="Overweight"
            }
            else
            {
                values$status_indicator="Obesity"
            }
            
            
            paste("Classification according to BMI: ", values$status_indicator)
        }
    })
    
    
    # Display your BMI
    
    output$BMI_result <- renderText({
        if(input$FindBMI == 0) ""
        else
            paste("Your current BMI is:", values$bmi)
    })
    
    
    
    
    
    
})


