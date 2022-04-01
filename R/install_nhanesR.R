#' install
#'
#' @param token token
#'
#' @return install
#' @export
#'
install_nhanesR <- function(){
    # check
    h0 <- .libPaths() |> list.files('nhanesR',full.names = TRUE)
    (td <- tempdir(check = TRUE))
    td2 <- '1'
    while(length(list.files(path = td,pattern = td2))!=0){
        td2 <- as.character(as.numeric(td2)+1)
    }
    dest <- paste0(td,'\\',td2)
    dir.create(path = dest,recursive = TRUE,showWarnings = FALSE)
    tf <- tempfile(tmpdir=dest, fileext=".zip")
    # download file from internet into temporary location
    download.file(url = "https://github.com/yikeshu0611/nhanesR/archive/refs/heads/main.zip",
                  mode='wb',
                  destfile = tf,
                  headers = c(NULL, Authorization = "token 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"))
    unzip(zipfile = tf,exdir=dest, overwrite=TRUE)
    set <- paste0(dest,'\\nhanesR')
    file.rename(paste0(dest,'\\nhanesR-main'),set)
    for (i in .libPaths()){
        x <- file.copy(set,i,recursive = TRUE,overwrite = TRUE)
        if (x){
            message(i)
            message('Done(nhanesR)')
            break(i)
        }
    }
}


