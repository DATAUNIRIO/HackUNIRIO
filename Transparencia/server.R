library(shiny)
library(shinydashboard)
library(shinyjs)
library(shinySignals)
library(gridBase)
library("treemap")
library("viridis")
library(dplyr)
library(plotly)
library("highcharter")

load(file="Transparencia2016.RData")
load(file="elementodedespesa2016_2.RData")
load(file="categoriaeconomica2016_2.RData")
load(file="acaoesubtitulo2016_2.RData")
load(file="programa2016_2.RData")
#load(file="funcionalprogramatico2016.RData")

shinyServer(
  function(input, output) {
    observeEvent(input$showSidebar, {
      shinyjs::removeClass(selector = "body", class = "sidebar-collapse")
    })
    observeEvent(input$hideSidebar, {
      shinyjs::addClass(selector = "body", class = "sidebar-collapse")
    })
    
    # Soma do valor empenhado em 2016
    Empenhado <- sum(Transparencia2016$Empenhado)
    Liquidado <- sum(Transparencia2016$Liquidado)
    Pago_e_RP_Pago <- sum(Transparencia2016$Pago_e_RP_Pago)
    
    output$Empenhado1 <-   renderValueBox({valueBox(
      value = formatC(Empenhado, digits = 2, big.mark = ".", big.interval = 3L, small.mark = " .", decimal.mark = ",",format = "f"),
      subtitle = "Empenhado em 2016", icon = icon("area-chart"),
      color = if (Liquidado >= Empenhado) "yellow" else "aqua")
    })
    output$Liquidado1 <-   renderValueBox({ valueBox(
      value = formatC(Liquidado , digits = 2, big.mark = ".", big.interval = 3L, small.mark = " .", decimal.mark = ",",format = "f"),
      subtitle = "Liquidado em 2016",
      icon = icon("line-chart"),
      color = "yellow")
    })
    output$Pago1 <-   renderValueBox({ valueBox(
      value = formatC(Pago_e_RP_Pago , digits = 2, big.mark = ".", big.interval = 3L, small.mark = " .", decimal.mark = ",",format = "f"),
      subtitle = "Pago e RP Pago em 2016",
      icon = icon("university"),
      color = "green")
    })

    output$str <- renderPrint({
      str(Transparencia2016)
    })
    output$data <- renderTable({
      colm <- as.numeric(input$linhas)
      Transparencia2016[1:colm,]
    })
    output$value <- renderPrint({input$checkGroup
      })
    output$hcontainer <- renderHighchart({
      tm <<- treemap(Transparencia2016, index=input$classe,
                     vSize=input$size, vColor = input$size,
                     type = "value", palette = rev(viridis(8)),
                     draw = FALSE)
      highchart(height = 800) %>% 
        hc_add_series_treemap(tm, allowDrillToNode = TRUE,
                              layoutAlgorithm = "squarified",
                              name = "tmdata") %>% 
        hc_title(text = "Despesas da Universidade em 2016") %>% 
        hc_tooltip(pointFormat = "<b>{point.name}</b>:<br>
                   Valor: {point.value:,.0f}<br>")
    })
    
    output$counter <- renderText({
      if(!file.exists("counter.Rdata"))
        counter<- 0
      else
        load(file="counter.Rdata")
        counter <- counter + 1
        save(counter, file="counter.Rdata")
        paste0("Total de visitas: ", counter)
    })
    
  })