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
library(shinythemes)

dashboardPage(skin = "black",
  dashboardHeader(title = "Bem vindo ao portal de transparência orçamentária da UNIRIO", titleWidth = 600),
  dashboardSidebar(
    tags$img(src = "datauniriologo.png", width = "200px", height = "100px"),
    h4("Comandos dos Gráficos"), 
      selectInput("size", "Tamanho:",
                  list("Empenhado" = "Empenhado", 
                       "Liquidado" = "Liquidado",
                       "Pago_e_RP_Pago" = "Pago_e_RP_Pago")),
      selectInput("classe", "Classe",
                  list("Acao_Subtitulo" = "Acao_Subtitulo", 
                       "Programa" = "Programa",
                       "Categoria_Economica" = "Categoria_Economica",
                       "Elemento_Despesa" = "Elemento_Despesa")),
   h4("Comandos do Banco de dados"), 
   sliderInput("linhas", "Selecione o número de linhas do banco de dados", min=1, max = 108, value=1),
   br(),
   h5(textOutput("counter"))
),
  dashboardBody(
    useShinyjs(),
    actionButton("showSidebar", "Mostrar barra lateral"),
    actionButton("hideSidebar", "Esconder barra lateral"),
    
    tabsetPanel(
      tabPanel("Gráfico",value=1,
              fluidRow(
                valueBoxOutput("Empenhado1"),
                valueBoxOutput("Liquidado1"),
                valueBoxOutput("Pago1")),
              highchartOutput("hcontainer",height = "500px"),
              h5("Em breve a análise do Hospital Universitário Gaffrée e Guinle."),
              h5("Fonte dos dados SIAFI.  Processamento", a("DATAUNIRIO", href="https://www.dataunirio.ml/"), ".")),
      
      tabPanel("Banco de Dados",value=2,
              h2("Banco de dados para download"), 
              h4("O Banco de dados completo tem 08 (oito) colunas e 108 linhas e pode ser baixado no formato Excel."), 
              h3("Download em excel", a("Orcamento_2016.xlsx", href="https://www.dropbox.com/s/sgqs4eeu6xmtlg0/Orcamento_2016.xlsx?dl=0")),
              tableOutput("data"),
              h4("Estrutura do Banco de dados"), 
              verbatimTextOutput("str")),
      
      tabPanel("Nota explicativa",value=3,
              fluidPage(
              h2(strong("O QUE É O ORÇAMENTO PÚBLICO?")),
              h4("O orçamento público é uma lei que entre outros aspectos expoe em termos financeiros a alocação dos recursos públicos. Trata-se de um instrumento de planejamento que espelha as decisões políticas, estabelecendo as ações prioritárias para atendimento das demandas da sociedade, em face à escassez de recursos."),
              br(),
              h4("A ação de monitorar as atividades do governo é conhecida como controle social, que pode ser realizada por todos.  Mas como você pode participar e controlar a realização dessas ações? o governo tem por obrigação dar transparência aos seus gastos: é a conhecida “transparência orçamentária”. Esse projeto é para garantir esse direito a todos alunos, técnicos e professores da Unirio."), 
              h4("Você pode baixar o manual do Orçamento Público neste", a("site", href="https://dataunirio.github.io/Orcamento_publico.pdf"),"."),
              br(),
              h3(strong("Glossário do Orçamento")),
              br(),
              checkboxGroupInput("checkGroup", label = " ",
                                 choices = list("Programa" = "O programa é o instrumento de organização da atuação governamental que articula um conjunto de ações que concorrem para a concretização de um objetivo preestabelecido, mensurado por indicadores instituídos no plano, visando a solução de um problema ou o atendimento de determinada necessidade ou demanda da sociedade",
                                                "Elemento de despesa" = "Elemento de despesa (Natureza da Despesa) é o desdobramento da despesa com pessoal, material, serviços, obras, instalações e outros meios de que se serve a Administração Pública para consecução de seus fins", 
                                                "Categoria Econômica" = "Categoria Econômica é a forma de classificação da despesa que compreende duas espécies: as despesas correntes e as despesas de capital.",
                                                "Ação Subtitulo" = "As ações são operações das quais resultam  produtos  (bens ou  serviços), que contribuem para atender ao objetivo de um programa. As ações, conforme suas características  podem  ser classificadas como atividades, projetos ou operações especiais."), 
                                 selected = "O programa é o instrumento de organização da atuação governamental que articula um conjunto de ações que concorrem para a concretização de um objetivo preestabelecido, mensurado por indicadores instituídos no plano, visando a solução de um problema ou o atendimento de determinada necessidade ou demanda da sociedade"),
              hr(),
              h1(verbatimTextOutput("value")),
              h4(strong("Empenho"),"é o ato de uma autoridade competente que gera para o Estado obrigação de pagamento. Consiste na reserva de dotação orçamentária para um fim específico. Ressalta-se que",strong("não é possível a realização da despesa sem prévio empenho.")),
              br(),
              h4(strong("Liquidação"), "consiste na verificação do direito adquirido pelo credor tendo por base  os  títulos e documentos comprobatórios do respectivo crédito."),
              br(),
              h4(strong("Pagamento"), "consiste na  entrega de  numerário ao  credor  por meio  de  ordens de pagamentos ou crédito em conta, e só pode ser efetuado após a regular liquidação da despesa."),
              br(),
              h4("No final do exercício, as despesas orçamentárias empenhadas e não pagas serão inscritas em", strong("Restos a Pagar"), "e constituirão a Dívida Flutuante."),
              br(),
              h4("Você pode construir o seu orçamento para a Unirio neste", a("site", href="https://duttross.shinyapps.io/Engajamento/"),".")
))
))
)