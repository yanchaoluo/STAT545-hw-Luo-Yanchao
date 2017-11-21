library(shiny)

library(DT)
library(shinyjs)

  ui <- fluidPage(
    
    useShinyjs(),
  # Application title
  
  titlePanel("My liquor webpage"),
  
  sidebarPanel(h4(" Created by Yanchao Luo"),
               img(src ="Liquorspicture.jpg", width = "100%"),
               br(),br(),
               
               sliderInput("priceIn", "Price of booze",
                           min = 0, max = 300,
                           value = c(10,20), pre = "CAD"),
               
               selectInput("typeIn", "What kind of booze?",
                            choices = c("BEER", "SPIRITS", "WINE"),
                            selected = "SPIRITS",multiple = TRUE),
               checkboxInput("checkInput","sort the results table by price",value = FALSE),
               checkboxInput("checkcountryInput","Filter by country",value = FALSE),
               uiOutput("countryOutput"),
               ## Add a survey
               shinyjs::inlineCSS(list(.big = "font-size: 2em")),
               div(id = "myapp",
                   h4("Survey"),
                   checkboxInput("big", "Bigger text", FALSE),
                   textInput("favoritewine", "Favorite Wine", ""),
                   a(id = "toggleAdvanced", "Show/hide advanced info", href = "#"),
                   shinyjs::hidden(
                     div(id = "hid",
                         numericInput("age", "Age", 30),
                         textInput("gender", "gender", "")
                     )
                   ),
                   p("Time: ",
                     span(id = "time", date()),
                     a(id = "update", "Update", href = "#")
                   ),
                   actionButton("submit", "Submit")
               ),
               downloadButton("downloadCSV","Download CSV"),
               
               p("Data source:", 
                    tags$a("OpenDataBC", href = "https://www.opendatabc.ca/dataset/bc-liquor-store-product-price-list-current-prices"))
             ),
  
mainPanel(
          tabsetPanel(
            tabPanel("Plot", 
                     plotOutput("Hist_AlcCont"),
                     shinyjs::colourInput("color", "Choose one color?")),
          
            tabPanel("Table", 
                     textOutput("Text_AlcCont"),
                     DT::dataTableOutput("table_head"))
            )
          )


)

