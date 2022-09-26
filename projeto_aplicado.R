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
