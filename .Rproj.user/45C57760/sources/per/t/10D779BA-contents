#' Get DST data from clauciorank github: https://github.com/clauciorank/sinanBRFiles
#' the original ones could be find at:
#' http://indicadoreshepatites.aids.gov.br/;
#' http://indicadoressifilis.aids.gov.br/;
#' http://indicadores.aids.gov.br/;
#' @param agravo Character: 'AIDS','SIFI','HEPA','HEPB','HEPC','HEPD'
#' @examples
#' data <- fetch_DST('AIDS')

fetch_DST <- function(agravo){

  if(!agravo %in% c('AIDS','SIFI','HEPA','HEPB','HEPC','HEPD')) {stop('agravo incorreto')}

  temp <- tempfile()
  tryCatch({
    download.file(paste(
    'https://github.com/clauciorank/sinanBRFiles/raw/main/',agravo,'.Rds', sep = ''),
    temp)
  }, error=function(cond) {
    message("This can be a problem with the Internet or the file does not exist yet.")
  })
  return(readRDS(temp))
}




