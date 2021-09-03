# sinanBR

Extração de dados do Sistema de Informações de Agravos e Notificações

## Instalação

```
library(devtools)
install_github('clauciorank/sinanBR')

```

## Uso 

O uso se dá pela utilização de duas funções:

```fetch_SINAN()``` que extrai todos dados de agravos presentes no SINAN incluindo as seguintes patologias: Acidente por Animais Peçonhentos (ANIM), Botulismo (BOTU), Doença de Chagas (CHAG), Febre de Chikungunya (CHIK), Cólera (COLE), Coqueluche (COQU), Dengue (DENG), Difteria (DIFT), Esquistossomose (ESQU), Febre Amarela (FAMA), Febre Maculosa (FMAC), Febre Tifóide (FTIF),Hanseníase (HANS), Hantavirose (HANT),Intoxicação Exógena (IEXO), Influenza Pandêmica (INFL), Leishmaniose Visceral (LEIV),	Leptospirose (LEPT), Leishmaniose Tegumentar Americana (LTAN), Malária (MALA), Zika Vírus (ZIKA).
	
```fetch_DST()``` que extrai todos os dados presentes na base aids.gov.br separados por município para as doenças: Sífilis (http://indicadoressifilis.aids.gov.br/); AIDS (http://indicadores.aids.gov.br/); Hepatites A,B,C,D (http://indicadoreshepatites.aids.gov.br/). 

## Exemplos

``` data <- fetch_SINAN(2018, 2020, 'DENG', 'ALL', directory) ```

``` data <- fetch_DST('AIDS') ```


## Agradecimentos

Este pacote se inspira no [microdatasus](https://github.com/rfsaldanha/microdatasus) e não seria possível sem o pacote [read.dbc](https://cran.r-project.org/web/packages/read.dbc/index.html)



