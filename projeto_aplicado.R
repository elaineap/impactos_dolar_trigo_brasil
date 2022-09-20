
#Instala a biblioteca readxl que nos ajudara a ler 
# arquivos em formato de excel extensões (xls e xlsx)
install.packages("readxl")

#carrega a biblioteca readxl
library("readxl")

# Cria o data frame cotacao_trigo com os dados contidos no arquivo 
# cepea-consulta-20220920110522-trigo.xls
cotacao_trigo <- read_excel("./cepea-consulta-20220920110522-trigo.xls")

#Visualiza estatísticas descritivas da cotação do trigo
summary(cotacao_trigo)


# Cria o data frame cotacao_dolar com os dados contidos no arquivo 
# cepea-consulta-20220920112727-dolar.xls
cotacao_dolar <- read_excel("./cepea-consulta-20220920112727-dolar.xls")

#Visualiza estatísticas descritivas da cotação do trigo
summary(cotacao_trigo)












plot(y = dados$valor_total_locacao ,
     x = dados$quilometragem,
     pch = 16)

#Coeficiente de correlacao
cor(dados$valor_total_locacao, dados$cotacao_dolar)

#Ajuste regressao linear do Preco em funcao da Quilometragem
regressao_linear <- lm(cotacao_dolar ~ valor_total_locacao, data = dados)
summary(regressao_linear)

readfile

is.na(readfile)
sum(is.na(readfile))


s  <- readfile[readfile$Purpose == 'car (new)' & readfile$Personal.status.and.sex == 'male (single)',]  

mean(readfile$Age.in.years)

library(moments)
skewness(readfile$Credit.amount)
kurtosis(readfile$Credit.amount)

#qqline(readfile$Credit.amount)

#Boxplot do preco
boxplot(readfile$Credit.amount)

library(ggplot2)
qplot(readfile$Credit.amount, geom = 'histogram', binwidth = 2) + xlab('Time')

#Duration in months e credit amount
cor(readfile$Duration.in.months,readfile$Credit.amount)

#Present residence since e Age in years
cor(readfile$Present.residence.since,readfile$Age.in.years)

IQR(readfile$Credit.amount)
#2606.75
summary(readfile$Credit.amount)
# get threshold values for outliers
Tmin = 1366-(1.5*2606.75) 
Tmax = 3972+(1.5*2606.75) 

# find outlier
out <- readfile$Credit.amount[which(readfile$Credit.amount < Tmin | readfile$Credit.amount > Tmax)]
typeof(out)

unique(readfile$Purpose)

#Gera boxplot purpose

purpose_numbers=c(1,2,3, 4,5,6,7,8,9,10)

names(purpose_numbers)=c("radio/television", "education", "furniture/equipment", "car (new)", "car (used)", "business", "domestic appliances", "repairs", "others", "retraining")

purpose_numbers[readfile$Purpose]

education  <- readfile[readfile$Purpose == "education",]
summary(education$Age.in.years)
boxplot(education$Age.in.years)

reparos  <- readfile[readfile$Purpose == "repairs",]

boxplot(reparos$Age.in.years)
summary(reparos$Age.in.years)


domestic  <- readfile[readfile$Purpose == "domestic appliances",]

boxplot(domestic$Age.in.years)
summary(domestic$Age.in.years)
hist(domestic$Age.in.years)


others  <- readfile[readfile$Purpose == "others",]

boxplot(others$Age.in.years)
summary(others$Age.in.years)

summary( readfile[readfile$Purpose == "radio/television",]$Age.in.years)

plot(x = readfile$Duration.in.months, y = readfile$Credit.amount)


