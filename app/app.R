library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(tidyr)


load('./data.RData')


emotions_ <- data

# UI
ui <- fluidPage(
  titlePanel("İstanbul İlçelerine Göre Duygu Durum İstatistikleri"),
  sidebarLayout(
    sidebarPanel(
      selectInput("ilce", "İlçe Seçiniz:", choices = unique(emotions_$İlçe))
    ),
    mainPanel(
      plotOutput("emotionPlot")
    )
  )
)

# Server
server <- function(input, output) {
  output$emotionPlot <- renderPlot({
    filtered_data <- emotions_ %>%
      filter(İlçe == input$ilce) %>%
      pivot_longer(cols = -İlçe, names_to = "Category", values_to = "Value")
    
    ggplot(filtered_data, aes(x = Category, y = Value, fill = Category)) +
      geom_bar(stat = "identity") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1),legend.position = "none") 

  })
}

# Run the app
shinyApp(ui = ui, server = server)

