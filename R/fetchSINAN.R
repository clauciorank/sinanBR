
#' Get data from SINAN
#' @param anomin ano mínimo numérico: 2015,2020
#' @param anomax ano máximo numérico: 2015,2020
#' @param agravo Character: sigla do agravo Acidente por Animais Peçonhentos (ANIM), Botulismo (BOTU), Doença de Chagas (CHAG), Febre de Chikungunya (CHIK), Cólera (COLE), Coqueluche (COQU), Dengue (DENG), Difteria (DIFT), Esquistossomose (ESQU), Febre Amarela (FAMA), Febre Maculosa (FMAC), Febre Tifóide (FTIF),Hanseníase (HANS), Hantavirose (HANT),Intoxicação Exógena (IEXO), Influenza Pandêmica (INFL), Leishmaniose Visceral (LEIV),	Leptospirose (LEPT), Leishmaniose Tegumentar Americana (LTAN), Malária (MALA), Zika Vírus (ZIKA)
#' @param uf character sigla estado: 'SC', 'PR', 'ALL'
#'
#' @examples
#' data <- fetch_SINAN(2018, 2020, 'DENG', 'ALL', directory)
#' data <- fetch_SINAN(2015, 2020, 'HANS', 'TO', directory)



fetch_SINAN <- function(anomin, anomax, agravo, uf){

  ufs <- c("AC","AL","AP","AM","BA","CE","DF","ES","GO","MA","MT","MS","MG","PA","PB","PR","PE",
           "PI","RJ","RN","RS","RO","RR","SC","SP","SE","TO", 'ALL', 'all')
  agravos <- c('ANIM', 'BOTU','CHAG','CHIK','COLE','COQU','DENG','DIFT', 'ESQU','FAMA', 'FMAC',
               'FTIF','HANS','HANT', 'IEXO', 'INFL', 'LEIV','LEPT', 'LTAN', 'MALA', 'ZIKA')




  if(anomin > anomax) {stop('anomin deve ser maior que anomax')}
  if(!is.numeric(anomin) | (!is.numeric(anomax))) {stop('ano deve ser numérico')}
  if(!uf %in% ufs) {stop('Estado não existe, sigla deve ser em maiúsculo ex: PR, SC')}
  if(!agravo %in% agravos) {stop('Doença não existe', call. = F)}


  y <- seq(anomin, anomax, 1)
  y <- substring(y, 3,4)
  if(uf %in% c('ALL','all')){

    read <- c()
    for (i in ufs[-c(28,29)]){
      arquivo <- paste(agravo,i,y, '.dbc', sep = '')
    read <- append(x = read, values = arquivo)
    }
  } else {

    read <- paste0(agravo,uf,y, '.dbc')
  }


  files_ftp <- RCurl::getURL('ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/', dirlistonly=T)
  files_ftp <- unlist(strsplit(files_ftp, "\r*\n"))
  read <- read[read %in% files_ftp]

  list_read <- list()
  count <- 0
  for (i in read){
  temp<-tempfile()
  tryCatch({
    download.file(paste0('ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/',
                       i), temp)
    list_read[[i]] <- read.dbc::read.dbc(temp)
    file.remove(temp)},
  error=function(cond){
  message(paste0('Problems with URL: ftp://ftp.datasus.gov.br/dissemin/publicos/SINAN/DADOS/FINAIS/', i))
  })
  count <- count + 1
  print(paste(count, 'de', length(read)))
  }
  print('Fetching')
  return(dplyr::bind_rows(list_read))
}









