 ![Logo_DATAUNIRIO](https://raw.githubusercontent.com/thiagoassantos/googlesheets-shinyapps/master/datauniriologo.png)
 
## DATAUNIRIO - Transparência e Engajamento com Tomada de Decisões
 
Aplicativos que visam empoderar a todos os interessados na UNIRIO, no tocante à transparência de dados e apoio à gestão nas tomadas de decisão. Promovemos, assim, maior integração e melhoria da comunicação na Universidade.

[App Transparência](https://duttross.shinyapps.io/transparencia1/)

[App Engajamento](https://duttross.shinyapps.io/Engajamento/)



## Início ##

Desenvolvimento de Apps para facilitar o acessso e o entendimento ao Orçamento Público. Para isso, usamos aplicações [Shiny](http://shiny.rstudio.com/), que fornecem recursos extraordinários para a web, com a linguagem de programação R. E, para agilizar este trabalho, adotamos o [RStudio](https://www.rstudio.com/).

## Pré-requisitos - Pacotes do R ##

Shiny:
```
install.packages("shiny")
```

Para criar o dashboard:
```
install.packages("shinydashboard")
```

Para plotar os gráficos:
```
install.packages("highcharter")
install.packages("plotly")
```
Para a paleta de cores:
```
install.packages("viridis")
```

Para o Bootstrap. Os temas do Bootstrap podem ser vistos aqui <http://bootswatch.com/>:
```
install.packages("shinythemes")
```
Para melhorar a experiência do usuário com os aplicativos:

```
install.packages("shinyjs")
```

Para manipulação de dados:
```
install.packages("plyr")
```
Para melhor legibilidade e manutenção de código-fonte:
```
install.packages("magrittr")
```

## Instalação ##

Abrir os arquivos ```server.R``` e ```ui.R``` no RStudio e executar (Run App). O aplicativo abrirá em uma nova janela.

## Dados e Tecnologias ##

* [Shiny](http://shiny.rstudio.com/) - Framework de aplicações web
* [RStudio](https://www.rstudio.com/) - IDE para R
* [SIAFI](http://www.tesouro.fazenda.gov.br/siafi) - Fonte das bases de dados - SIAFI -  Sistema Integrado de Administração Financeira

## Licença ##

CC BY 3.0 BR

<!---->
