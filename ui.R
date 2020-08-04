#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    titlePanel("BMI Calculator."),
    
    sidebarLayout(
        sidebarPanel(position = "bottom",
            
            helpText("Body Mass Index is a simple calculation using a person’s height and weight."),            
            br(),           
            numericInput("ing_weight_kg",label = h4("Please, enter your weight in Kg"),min = 10, max = 300,0, value = NA), #, value = 70
            br(),
            numericInput("int_height_cm",label = h4("Please, enter your height in cm"),min = 50, max = 250,0, value = NA), #,value = 170
            br(),
            
            br(),   
            actionButton("FindBMI", label = "Enter")    
            
            
        ),
        mainPanel
        (
            tabsetPanel
            (
                tabPanel("Find out you BMI",
                         br(),
                         p(h4("Your BMI index is:")),
                         textOutput("BMI_result"),
                         p(h4("Your BMI classification is:")),
                         textOutput("status_indicator")
                         
                ),
                tabPanel(
                    "More About",
                    p(h4("Body Mass Index (BMI)")),
                    br(),
                    helpText("The formula is BMI = kg/m2 where kg is a person’s weight in kilograms and m2 is their height in metres squared.
                             A BMI of 25.0 or more is overweight, while the healthy range is 18.5 to 24.9. BMI applies to most adults 18-65 years."),
                    p(h3("Not use BMI indicator:")),
                    helpText("BMI is not used for muscle builders, long distance athletes, pregnant women, the elderly or young children.")
                )
                
                
            )
        )
    )
))