# ui.R
library(shiny)

shinyUI(fluidPage( 
  titlePanel("Exploring Equilibrium"), 
  
  sidebarLayout(
    sidebarPanel(
      tabsetPanel(
        tabPanel("Documentation", p(paste("This application attempts to demonstrate simple supply-demand concepts from microeconomics.",
                "You will have the opportunity to set different parameters that affect both demand and supply, and the app will",
                "demonstrate the impact those parameters have on the market equilibrium price, quantity, and manufacturer's profit.")),
                p("This app assumes very simple, linear supply and demand curves. The equation for the demand curve is given as:"),
                p(em("Price = MaxDemand + slope * quantity")),
                p("We derive the supply curve from the following cost function for the manufacturer:"),
                p(em("Cost = FixedCost + linearParam * quantity + quadraticParam * quantity^2")),
                p("This yields the following supply curve:"),
                p(em("Price = linearParam + 2 * quadraticParam * quantity")),
                p(strong("To get started with the application, please select 'Inputs' above."))
                ),
        
        tabPanel("Inputs",
          h3("Demand Inputs"),
          sliderInput("maxD",
                      "Maximum Demand",
                      min=1,
                      max=20,
                      value=20),
          sliderInput("a",
                      "Demand Slope",
                      min=-5,
                      max=0, 
                      value=-1,
                      step=0.1),
          h3("Supply Inputs"),
          sliderInput("fc",
                      "Fixed Cost",
                      min = 0,
                      max = 20,
                      value = 10,
                      step = 1),
          sliderInput("b",
                      "Linear Cost Parameter",
                      min = 0,
                      max = 3,
                      value = 0,
                      step = 0.5),
          sliderInput("c",
                      "Quadratic Cost Parameter",
                      min = 0,
                      max = 3,
                      value = 0.5,
                      step = 0.5)
        ))
      ),
    mainPanel(
      plotOutput("marketPlot"),
      h3("Equilibrium Values"),
      tableOutput("summary")
      )
    )
  ))