library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
    
      data <- iris[c(input$varx, input$vary, "Species")]
      
      colnames(data) <- c("x", "y", "Species")
      xlab = paste(unlist(strsplit(input$varx, ".")), collapse = " ")
      ylab = paste(unlist(strsplit(input$vary, ".")), collapse = " ")
      
      p <- ggplot(data = data, aes(x = x, y = y, col = Species)) + 
        geom_jitter() +
        geom_smooth(method = "lm") +
        labs(title = paste(input$varx, "vs", input$vary, sep = " "),
        x = input$varx, y = input$vary)
        
      if (input$separate) {
        p + facet_grid(Species ~ .)
      } else {p}

    })

    output$text <- renderText({
      paste(unlist(strsplit(input$vary, ".")), sep = " ")
    })
    
    
})

    