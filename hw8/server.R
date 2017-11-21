
library(shiny)
library(tidyverse)
library(stringr)

server <- function(input, output) {
  bcl_data <- read_csv("bcl-data.csv")
  
  output$countryOutput <- renderUI({
    if(input$checkcountryInput)
      selectInput("countryInput","Country",
                  sort(unique(bcl_data$Country)),
                  selected = "CANADA",
                  multiple = TRUE)
  })

  
  Filtered_bcl<- reactive({
    if(input$checkInput) bcl_data<-arrange(bcl_data,Price)
    else bcl_data
    
    if(input$checkcountryInput){
    bcl_data %>% 
      filter(Price >= input$priceIn[1],
             Price <= input$priceIn[2],
             Type==input$typeIn,
             Country %in% input$countryInput)
      
    }
    else { 
      bcl_data %>% 
        filter(Price >= input$priceIn[1],
               Price <= input$priceIn[2],
               Type==input$typeIn)
      
    }
    
    })
 

  output$Hist_AlcCont <- renderPlot({
    
    if(nrow(Filtered_bcl())==0){
      return(NULL)
    }
    else{
      Filtered_bcl() %>% 
      ggplot() +
      aes(x = Alcohol_Content) +
      geom_histogram(fill=input$color, color="black")+
      theme_bw()
    }
  })
  

  
  output$table_head <- DT::renderDataTable({
    
    if(nrow(Filtered_bcl())==0){
      return(NULL)
    }
    else{
      Filtered_bcl() 
    }
  })
  
  
  output$Text_AlcCont <- renderText({
    number <- count(Filtered_bcl())
    str_c("We found ", number, " options for you")
  })
  
  ## survey
  observe({
    toggleState("submit", !is.null(input$favoritewine) && input$favoritewine != "")
  })
  
  shinyjs::onclick("toggleAdvanced",
                   shinyjs::toggle(id = "hid", anim = TRUE))    
  
  shinyjs::onclick("update", shinyjs::html("time", date()))
  
  observe({
    toggleClass("myapp", "big", input$big)
  })
  
  observe({
    if (input$submit > 0) {
      shinyjs::info("Thank you!")
    }
  }) 
  output$downloadCSV <- downloadHandler(
    filename = function() {
      paste("data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(x=Filtered_bcl(),
                file=file, row.names = FALSE)
    }
  )
  
}