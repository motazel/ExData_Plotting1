
shinyServer(
  function(input, output) {
    x <- reactive({as.numeric(input$id1)})
    output$oid1 <- renderText({x()^2 })
    output$oid2 <- renderText({x()^3})
  }
)
