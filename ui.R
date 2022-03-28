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

    # Application title
    titlePanel("Iris data regresion by species"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("Instructions: "),
            p("1. Select two diferent variables from the iris dataset"),
            br(),
            selectInput("varx", label = "Variable X", choices = colnames(iris)[1:4]),
            selectInput("vary", label = "Variable Y", choices = colnames(iris)[1:4]),
            br(),
            p("2. Do you want to see the diferent regresion models in a single plot?"),
            checkboxInput(inputId = "separate", label = "Separate by species.", value = TRUE),
            submitButton("Submit!")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            textOutput("text")
        )
    )
))
