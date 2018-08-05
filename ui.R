
library(shiny)

shinyUI(fluidPage(
  tabsetPanel(
    tabPanel("Interactive App", 
        titlePanel("Influence of mpg by weight of a car"),
        sidebarLayout(
            sidebarPanel(
                h4("Slope"),
                textOutput("slopOut"),
                h4("Intercept"),
                textOutput("intOut")
            ),
            mainPanel(
                plotOutput("plot1", brush = brushOpts(id="brush1")),
                p("- In order for the app to fit a linear model, ", span("at least two points must be selected,", style = "color:blue"), "otherwise, the app wil return", strong(span("'No model found'"), style = "color:blue"),"as a result."),
                p("- See the Instructions Tab for more information.")
            )
        )
    ),
    tabPanel("Instructions", 
             br(),
             h4(strong("How to use this app")),
             p("- This app calculates the slope and the intercept
                from a linear model fitted to the data selected by the user."),
             br(),
             p("- Please select the points from the graph on the 'Interactive Graph' tab you wish to know the slope and intercept for."),
             p("- The app will fitt a linear model on the points selected, calculates the intercept and slope and add a regression line"),
             br(),
             p("- In order for the app to fit a linear model, ", span("at least two points must be selected,", style = "color:blue"), "otherwise, the app wil return", strong(span("'No model found'"), style = "color:blue"),"as a result")
             )    
)
)
)