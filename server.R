# server.R

library(shiny)

shinyServer(function(input, output) {
  output$marketPlot <- renderPlot({
    q <- matrix(0:20, nrow=1)
    plot(q, input$maxD+input$a*q, type = "l",
         lwd = 3,
         col = "steelblue", 
         xlab = "Quantity",
         ylim = c(0, 25),
         ylab = "Price",
         main = "Supply and Demand")
    lines(q, input$b + 2*input$c*q, type="l",
          lwd = 3,
          col = "orangered")
    legend(12, 22,c("Demand", "Supply"), lty=c(1,1), col=c("steelblue", "orangered"), lwd = c(3,3))
    quant <- (input$maxD-input$b)/(2*input$c - input$a)
    price <- input$maxD + input$a * quant
    points(quant, price, cex=3)
  })
  
  output$summary <- renderTable({
    quant <- (input$maxD-input$b)/(2*input$c - input$a)
    price <- input$maxD + input$a * quant
    cost <- input$fc + input$b*quant + input$c*quant^2
    profit <- price * quant - cost
    tab <- data.frame(quant, price, profit)
    names(tab) <- c("Quantity", "Price", "Profit")
    tab
  })

})