#Instala a biblioteca readxl que nos ajudara a ler 
# arquivos em formato de excel extensões (xls e xlsx)
install.packages("readxl")

#carrega a biblioteca readxl
library("readxl")

# Cria o data frame cotacao_trigo com os dados contidos no arquivo 
# cepea-consulta-20220920110522-trigo.xls
cotacao_trigo <- read_excel("./cepea-consulta-20220920110522-trigo.xls")

# Exibe alguns registros contidos no dataframe cotacao_trigo
head(cotacao_trigo)

#Visualiza estatísticas descritivas da cotação do trigo
summary(cotacao_trigo)

# Cria o data frame cotacao_dolar com os dados contidos no arquivo 
# cepea-consulta-20220920112727-dolar.xls
cotacao_dolar <- read_excel("./cepea-consulta-20220920112727-dolar.xls")
# Exibe alguns registros contidos no dataframe cotacao_dolar
head(cotacao_dolar)
#Visualiza estatísticas descritivas da cotação do trigo
summary(cotacao_dolar)

# converte data da cotação do trigo de string para  date
# cria um vector com a data da cotação do trigo em formato date
data_cotacao_trigo <- sapply(cotacao_trigo$Data, as.Date, format = "%d/%m/%Y")

#carrega a biblioteca stringr
library("stringr")

# Remove o "." da string do valor da cotação do trigo
# Cria um vector com valor da cotação do trigo sem o ".", mas ainda em formato string
valor_cotacao_trigo_str <- str_replace(cotacao_trigo$`À vista R$`,'\\.', "")

# Remove a "," da string do valor da cotação do trigo
# Cria um vector com valor da cotação do trigo sem o ",", mas ainda em formato string
valor_cotacao_trigo_double_str <- str_replace(valor_cotacao_trigo_str, ",", ".")

# converte o valor da cotação do trigo de string para double
# cria um vector com o valor da cotação do trigo em formato doble
valor_cotacao_trigo <- sapply(valor_cotacao_trigo_double_str, as.double) 

# Gera o grpafico de linha com a variação da preço do trigo
plot( 
  y = valor_cotacao_trigo, 
  x = data_cotacao_trigo, 
  type = "l",
  main = 'Variação do preço do Trigo',
  xlab = 'Data',
  ylab = 'Preço do Trigo',
)

# converte data da cotação do dolar de string para  date
# cria um vector com a data da cotação do dolar em formato date
data_cotacao_dolar <- sapply(cotacao_dolar$Data, as.Date, format = "%d/%m/%Y")

# Remove a "," da string do valor da cotação do trigo
# Cria um vector com valor da cotação do trigo sem o ",", mas ainda em formato string
valor_cotacao_dolar_str <- str_replace(cotacao_dolar$`À vista R$`, ",", ".")

# converte o valor da cotação do trigo de string para double
# cria um vector com o valor da cotação do trigo em formato doble
valor_cotacao_dolar <- sapply(valor_cotacao_dolar_str, as.double) 


# Cria um gráfico de linha com o valor da cotação do trigo
plot( 
  y = valor_cotacao_dolar, 
  x = data_cotacao_dolar, 
  type = "l",
  main = 'Variação do preço do Dólar',
  xlab = 'Data',
  ylab = 'Preço do Dólar',
)


plot(y = valor_cotacao_trigo,
     x = valor_cotacao_dolar,
     main = 'Relação entre preço do trigo VS cotação do Dólar',
     xlab = 'Cotação do Dólar',
     ylab = 'Preço do Trigo',
     pch = 20)

grid()

abline(lm(valor_cotacao_trigo ~ valor_cotacao_dolar))

cor(valor_cotacao_trigo, valor_cotacao_dolar)
