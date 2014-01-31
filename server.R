library(shiny)
library(ggplot2)
source('./helperFunctions.R')
# Define server logic required to generate and plot:
shinyServer(function(input, output) {

	# deteremine the model type from the input:
	


	
	
	# define x axis:
	x <- seq(0.001,1,by=.001)
	aStatic 		<- 0.6
	kStatic 		<- 25
	tResStatic 	<- 0.2
	
	
	
	
	# PLOT CHRONOMETRIC FUNCTION (CMF):	 
	# ---------------------------------
	output$CMF <- renderPlot({

	# define parameters:
	a 		<- input$a
	k 		<- input$k
	tRes 	<- input$tRes
	
	# Chronometric
	y <- (a/(k*x)) * tanh((a*k)*x) + tRes
	yStatic <- (aStatic/(kStatic*x)) * tanh((aStatic*kStatic)*x) + tResStatic
	Chron<-data.frame(x=x,y=y*1000,yStatic=yStatic*1000)
		
		
	# Psychometric
	
	 psych_y<-(1 / (1+exp(-2*input$k*x*input$a)))
	 #y2<-(a/(k*x)) * tanh((a*k)*x) + tRes
	 psych_Static<- (1 / (1+exp(-2*kStatic*x*aStatic)))
	 Psych<-data.frame(x=x,y=psych_y,psych_Static=psych_Static)
		
		
		
		#plot
		
		p1<-ggplot(data=Chron,aes(x=x,y=y)) +geom_line(aes(x,y,color="User Input"),size=3) + scale_x_log10(breaks=c(.001,.005,.01,.05,.1,.5,1))+scale_y_continuous(limits=c(0,1000)) +labs(title='Chronometric Function', x='Stimulus Strength', y='Response Time (ms)') +geom_line(aes(x=x,y=yStatic,color="Default"),size=2)+scale_color_manual("",values=c("Default"="#00000080","User Input"="#3690C0"))+theme(axis.text=element_text(size=12),
        axis.title=element_text(size=14),title=element_text(size=16,face="bold"),legend.text=element_text(size=12))

		
		

		
	 p2<-ggplot(data=Psych,aes(x=x,y=y)) +geom_line(aes(x,y,color="User Input"),size=3) + scale_x_log10(breaks=c(.001,.005,.01,.05,.1,.5,1)) + labs(title='Psychometric Function', x='Stimulus Strength', y='Proportion Correct')+geom_line(aes(x=x,y=psych_Static,color="Default"),size=2)+scale_color_manual("",values=c("Default"="#00000080","User Input"="#3690C0"))+theme(axis.text=element_text(size=12),title=element_text(size=16,face="bold"),
        axis.title=element_text(size=14),legend.text=element_text(size=12))



    # generate a curve and plot it
	
	
	#plot(x,y*1000, log="x", type='l', lwd=10, col='#3690C0', xlab="Stimulus Strength", ylab="Response Time (ms)", main='Chronometric Function', ylim=c(0,1000), cex.lab=1.5,pch=1,cex=1.5)
	#grid(5,5, col="lightgray", lty="dotted", lwd=2)

	#lines(x, yStatic*1000,  lwd=5, col='#676F86')
   	 
   	 #legend()
   	
   	 
	  

 	# PLOT PSYCHOMETRIC FUNCTION (PMF):
 	# ---------------------------------


# # 	# define apramters:
	# a 		<- input$a
	# k 		<- input$k
	# tRes 	<- input$tRes
	
	 
	
    # # generate a curve and plot it

	# plot(x,y, log="x", type='l', lwd=10, col='#3690C0', xlab="Stimulus Strength", ylab="Proportion Correct", main='Psychometric Function', cex.lab=1.5,pch=1,cex=1.5)
	
	# grid(5,5, col="lightgray", lty="dotted", lwd=2)

	# lines(x, yStatic,   lwd=5, col='#676F86')
   	
   	# legend()
   	multiplot(p1,p2)
   	
	  })
})
      
      
      
      
      
      
      
      