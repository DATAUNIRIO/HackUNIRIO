library(plotly)
library(shiny) # load the shiny package
library(shinythemes)

shinyUI(fluidPage(theme = "bootstrap.css",                
  
  # Header or title Panel 
  titlePanel(h2(strong("FAÇA AQUI O SEU ORÇAMENTO PARA A UNIRIO"), align = "center", style = "color:white")),
  # Sidebar panel
  sidebarPanel(
    selectInput("var", label = "Selecione sua categoria", 
                choices = c("Escolha a categoria","Aluno/Aluna", "Técnico/Técnica", "Professor/Professora"),
                selected = 1),
    sliderInput("bin1", "1. Selecione o percentual que deve ser utilizado para AUXÍLIO FINANCEIRO A ESTUDANTES", min=0, max=100, value=0),
    sliderInput("bin2", "2. Selecione o percentual que deve ser utilizado para AUXÍLIO FINANCEIRO A PESQUISADORES", min=0, max=100, value=0),
    sliderInput("bin3", "3. Selecione o percentual que deve ser utilizado para EQUIPAMENTOS E MATERIAL PERMANENTE", min=0, max=100, value=0),
    sliderInput("bin4", "4. Selecione o percentual que deve ser utilizado para MATERIAL DE CONSUMO", min=0, max=100, value=0),
    sliderInput("bin5", "5. Selecione o percentual que deve ser utilizado para PASSAGENS, DIARIAS E DESPESAS COM LOCOMOÇÃO", min=0, max=100, value=0),
    sliderInput("bin6", "6. Selecione o percentual que deve ser utilizado para SERVICOS DE CONSULTORIA", min=0, max=100, value=0),
    sliderInput("bin7", "7. Selecione o percentual que deve ser utilizado para CONTRATAÇÃO POR TEMPO DETERMINADO", min=0, max=100, value=0),
    sliderInput("bin8", "8. Selecione o percentual que deve ser utilizado para OBRAS E INSTALAÇÕES", min=0, max=100, value=0),
    sliderInput("bin9", "9. Selecione o percentual que deve ser utilizado para LOCAÇÃO DE MAO-DE-OBRA", min=0, max=100, value=0),
    sliderInput("bin10", "10. Selecione o percentual que deve ser utilizado para OUTROS SERVICOS DE TERCEIROS PF E PJ", min=0, max=100, value=0),
    actionButton("Comparar", "Comparar Orçamento", icon("bar-chart"),
                 style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
    h5("Clique aqui se quiser comparar o seu orçamento com o da Universidade")
),
  # Main Panel
  mainPanel(
    h2("QUAIS SÃO AS PRIORIDADES DA UNIRIO?"),
    h3("Qual o orçamento que você faria? Neste espaço você pode", strong("criar o seu próprio orçamento"), "da Universidade."),
    h3("Após a construção, você pode", strong("comparar o seu orçamento"), "com aquele definido pela UNIRIO."),
    h4(htmlOutput("text1"), style= "color: #dee7f4"), 
    h4(htmlOutput("text2"), style= "color: #dee7f4"), 
    h4(htmlOutput("text3"), style= "color: #dee7f4"), 
    h4(htmlOutput("text4"), style= "color: #dee7f4"), 
    h4(htmlOutput("text5"), style= "color: #dee7f4"), 
    h4(htmlOutput("text6"), style= "color: #dee7f4"), 
    h4(htmlOutput("text7"), style= "color: #dee7f4"),
    h4(htmlOutput("text8"), style= "color: #dee7f4"), 
    h4(htmlOutput("text9"), style= "color: #dee7f4"), 
    h4(htmlOutput("text10"), style= "color: #dee7f4"), 
    h2(htmlOutput("text98"), style= "color: #324259; background-color:#dee7f4;"), 
    h2(htmlOutput("text99"), style= "color: #324259; background-color:#dee7f4;"),
    h2(htmlOutput("CAT2")),
    plotlyOutput("plot", width = "100%", height = "700px"),
    br(),
    h4("Este projeto foi desenvolvido pelo", a("DATAUNIRIO", href="https://www.dataunirio.ml/"), "."),
    br()
  )
)
)
