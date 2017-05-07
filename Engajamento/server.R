library(shiny) # Load shiny package
library(plyr)
library(magrittr)
library(plotly)



shinyServer(
  function(input, output, session) {
    output$text1 <- renderText({ 
      paste("O percentual que deve ser utilizado para AUXÍLIO FINANCEIRO A ESTUDANTES é ", input$bin1)
    })
    output$text2 <- renderText({ 
      paste("O percentual que deve ser utilizado para AUXÍLIO FINANCEIRO A PESQUISADORES é ", input$bin2)
    })      
    output$text3 <- renderText({ 
      paste("O percentual que deve ser utilizado para EQUIPAMENTOS E MATERIAL PERMANENTE é ", input$bin3)
    })
    output$text4 <- renderText({ 
      paste("O percentual que deve ser utilizado para MATERIAL DE CONSUMO é ", input$bin4)
    })
    output$text5 <- renderText({ 
      paste("O percentual que deve ser utilizado para PASSAGENS, DIÁRIAS E DESPESAS COM LOCOMOÇÃO é ", input$bin5)
    })      
    output$text6 <- renderText({ 
      paste("O percentual que deve ser utilizado para SERVIÇOS DE CONSULTORIA é ", input$bin6)
    })
    output$text7 <- renderText({ 
      paste("O percentual que deve ser utilizado para CONTRATAÇÃO POR TEMPO DETERMINADO é ", input$bin7)
    })
    output$text8 <- renderText({ 
      paste("O percentual que deve ser utilizado para OBRAS E INSTALAÇÕES é ", input$bin8)
    })      
    output$text9 <- renderText({ 
      paste("O percentual que deve ser utilizado para LOCAÇÃO DE MAO-DE-OBRA é ", input$bin9)
    })
    output$text10 <- renderText({ 
      paste("O percentual que deve ser utilizado para OUTROS SERVIÇOS DE TERCEIROS - PESSOA FÍSICA E PESSOA JURÍDICA (Limpeza e Segurança) é ", input$bin10)
    })
    output$text98 <- renderText({ 
      paste("Soma", sum(input$bin1+input$bin2+input$bin3+input$bin4+input$bin5+input$bin6+input$bin7+input$bin8+input$bin9+input$bin10))
    })    
    output$text99<-renderText({
      if (input$bin1+input$bin2+input$bin3+input$bin4+input$bin5+input$bin6+input$bin7+input$bin8+input$bin9+input$bin10>100) {
        HTML(paste0("<b>","O seu orçamento para a Universidade tem um somatório acima de 100%.","</b>", "Infelizmente, não é possível utilizar mais do que 100% do orçamento"))
      } else {
        paste("Você quer comparar o seu orçamento com o valor utilizado pela Unirio?")
      }
    })
    

      randomVals <- eventReactive(input$Comparar, {
      c(546929*as.numeric(input$bin1[1]),546929*as.numeric(input$bin2[1]),546929*as.numeric(input$bin3[1]),546929*as.numeric(input$bin4[1]),546929*as.numeric(input$bin5[1]),546929*as.numeric(input$bin6[1]),546929*as.numeric(input$bin7[1]),546929*as.numeric(input$bin8[1]),546929*as.numeric(input$bin9[1]),546929*as.numeric(input$bin10[1]))    # input$bin1[1] primeiro valor do bin (minimo)
      })
      randomVals2 <- c(9313380, 122500, 3321989.12, 1416603.58,805839.14, 157273.98,485000,535733.45,21799289,16735336.36)
      
      CAT <- eventReactive(input$Comparar,{input$var}) 
      output$CAT2<- renderText({ 
        paste("Orcamento de", CAT())
      })
      output$plot <- renderPlotly({
        p <- plot_ly(x = c("AUXÍLIO FINANCEIRO A ESTUDANTES",
          "AUXÍLIO FINANCEIRO A PESQUISADORES",
          "EQUIPAMENTOS E MATERIAL PERMANENTE",
          "MATERIAL DE CONSUMO",
          "PASSAGENS, DIÁRIAS E DESPESAS COM LOCOMOÇÃO",
          "SERVIÇOS DE CONSULTORIA",
          "CONTRATAÇÃO POR TEMPO DETERMINADO",
          "OBRAS E INSTALAÇÕES",
          "LOCAÇÃO DE MAO-DE-OBRA",
          "SERVIÇOS DE TERCEIROS (Limpeza e Segurança)"),y =randomVals(),name = "Orçamento construído", type = "bar",marker = list(color = 'rgb(50, 66, 89)')) %>%
          add_trace(y = ~randomVals2, name = 'Orçamento da UNIRIO em 2016',marker = list(color = 'rgb(183, 34, 34)')) %>%
          layout(yaxis = list(title = 'Percentual'), barmode = 'group',tickangle = 45, margin = list(b = 160), ticks = "outside")
             })
})      

