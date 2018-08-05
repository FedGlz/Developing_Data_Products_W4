
library(shiny)


shinyServer(function(input,output){
    dataset <- mtcars
    model <- reactive({
        brushed_data <- brushedPoints(dataset,input$brush1,
                                      xvar = "wt", y= "mpg")
        if(nrow(brushed_data)<2){
            return(NULL)
        }
        
        lm(mpg~wt, data = brushed_data)
    })
    output$slopOut <- renderText({
        if(is.null(model())){
            "No model Found"
        } else {
            model()[[1]][2]
        }
    })
    output$intOut <- renderText({
        if(is.null(model())){
            "No model Found"
        } else {
            model()[[1]][1]
        }
    })
    output$plot1 <- renderPlot({
        with(dataset,plot(wt, mpg, 
             xlab = "Car Weight", ylab = "mpg",
             main = "Cars mpg by weight",
             cex=1.5, pch=16, btn="n", col="lightblue"))
        if(!is.null(model())){
            abline(model(), col="blue", lwd=2)
        }
    })
})