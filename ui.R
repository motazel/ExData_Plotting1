library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("The application is really simple: just enter a numeric value to get its square and cube"),
  sidebarPanel(
    numericInput('id1', 'Your numeric input', 0, min = 0, max = 10, step = 1)    
  ),
  mainPanel(
    h3('The square of what you entered!'),    
    verbatimTextOutput("oid1"),   
    h3('The cube of what you entered!'),    
    verbatimTextOutput("oid2")   
  )
))
