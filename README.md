# Startup Profitability and Cost Analysis

This project simulates the financial operations of a fictional food delivery startup over a 12-month period. It focuses on understanding how revenue, costs, and profit evolve month by month. Using R for analysis and Shiny for interactivity, the project includes a detailed financial report, automated calculations, and an interactive dashboard for exploring different business scenarios.

## Objective

To evaluate the profitability of a startup by analyzing revenue streams and cost structures, and to identify strategic opportunities for improving financial performance through data-driven insights.

## Dataset

The dataset was manually simulated to reflect monthly operations of a food delivery startup. It includes:

- Number of Orders and Average Order Value
- Revenue streams (Delivery Fees, Subscriptions, Commissions, In-App Ads)
- Cost components (Fixed Costs, Delivery Payouts, Marketing, Packaging, Customer Support)
- Total Revenue, Total Costs, and Net Profit

## Analysis Summary

- Calculated monthly profit, profit margins, and cumulative profit
- Identified break-even month and performance fluctuations
- Detected high-cost risk periods due to delivery payouts
- Modeled marketing cost reductions and their impact on profitability
- Created trend visualizations for revenue growth, cost behavior, and profit fluctuation

## Key Insights

- Average monthly profit margin: **4.57%**
- Break-even achieved in **January 2024**
- Cutting marketing costs by 20% led to a **49.44% increase** in monthly profit
- Profit dropped by **146.53%** during months with highest delivery partner payouts

## Project Files

| File                                  | Description                                          |
|---------------------------------------|------------------------------------------------------|
| `food_delivery_startup_2024_fictional_data.csv` | Simulated monthly dataset used for the analysis     |
| `startup_profitability_analysis.Rmd`  | Full R Markdown analysis with code and output       |
| `startup_analysis_R_markdown.pdf`  | Exported PDF version of the R Markdown              |
| `startup_analysis_report.pdf`          | Written business-style report with methodology and insights |
| `app.R`                               | Shiny dashboard code for interactive sensitivity testing |

## Technologies Used

- **R** – Financial analysis, simulation, and visual reporting
- **Shiny** – Building an interactive web-based dashboard
- **ggplot2** – Data visualization
- **dplyr, tidyr** – Data transformation and wrangling
- **readr** – Data import from CSV
- **Excel** – Used for initial dataset design



