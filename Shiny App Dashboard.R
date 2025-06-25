library(shiny)
library(readr)
library(dplyr)
library(ggplot2)
library(janitor)
library(scales)

# Load and clean data
setwd("C:/Users/LENOVO/Downloads")
data <- read_csv("food_delivery_startup_2024_fictional_data.csv") %>%
  janitor::clean_names()

# Precompute base revenue and cost
data <- data %>%
  mutate(
    total_revenue_calculated = subscription_revenue_pkr + commission_revenue_pkr +
      delivery_fees_collected_pkr + in_app_ads_revenue_pkr,
    total_costs_base = fixed_costs_pkr + delivery_partner_payouts_pkr +
      marketing_spend_pkr + packaging_costs_pkr + customer_support_refunds_pkr
  )

# UI
ui <- fluidPage(
  titlePanel("Startup Profitability Dashboard"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("marketing_multiplier", "Marketing Spend Multiplier", 0.5, 2, 1, step = 0.1),
      sliderInput("delivery_multiplier", "Delivery Payout Multiplier", 0.5, 2, 1, step = 0.1)
    ),
    mainPanel(
      plotOutput("profitPlot"),
      tableOutput("kpiTable")
    )
  )
)

# Server
server <- function(input, output) {
  
  adjusted_data <- reactive({
    data %>%
      mutate(
        adjusted_marketing = marketing_spend_pkr * input$marketing_multiplier,
        adjusted_delivery = delivery_partner_payouts_pkr * input$delivery_multiplier,
        adjusted_total_costs = fixed_costs_pkr + adjusted_marketing + adjusted_delivery +
          packaging_costs_pkr + customer_support_refunds_pkr,
        adjusted_profit = total_revenue_calculated - adjusted_total_costs
      )
  })
  
  output$profitPlot <- renderPlot({
    df <- adjusted_data()
    ggplot(df, aes(x = month, y = adjusted_profit)) +
      geom_line(color = "blue", linewidth = 1.2) +
      geom_point(color = "darkgreen", size = 3) +
      geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
      labs(title = "Adjusted Monthly Profit", x = "Month", y = "Profit (PKR)") +
      scale_y_continuous(labels = comma)+
      theme_minimal()
  })
  
  output$kpiTable <- renderTable({
    df <- adjusted_data()
    data.frame(
      "Average Adjusted Profit" = round(mean(df$adjusted_profit), 0),
      "Max Profit" = max(df$adjusted_profit),
      "Min Profit" = min(df$adjusted_profit)
    )
  })
}

shinyApp(ui = ui, server = server)
