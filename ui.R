library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Drift Diffusion Model to Predict Behavior"),

  # Sidebar with a slider input:
  sidebarPanel(
 
  
    sliderInput("a", 
                "Bound Height:", 
                min = 0.1,
                max = 1, 
                step = 0.01,
                value = 0.6,
                ),
  
	sliderInput("k", 
                "Sensitivity:", 
                min = .1,
                max = 100, 
                step = 0.1,
                value = 25),
                
	sliderInput("tRes", 
                "Residual Time:", 
                min = 0,
                max = 0.6, 
                step = 0.01,
                value = 0.2)
                
     #checkboxInput()
                
  	),              

  # Show a plot of the PMF & CMF:
  mainPanel(
  	
 	h3(textOutput("caption")),

plotOutput("CMF"),
    plotOutput("PMF")
  )
))


