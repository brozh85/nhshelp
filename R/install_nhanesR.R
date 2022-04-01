#' install
#'
#' @param token token
#'
#' @return install
#' @export
#'
install_nhanesR <- function(token,version='0.9.2.1'){
    e <- tryCatch(detach("package:nhanesR", unload = TRUE),error=function(e) 'e')
    # check
    (td <- tempdir(check = TRUE))
    td2 <- '1'
    while(td2 %in% list.files(path = td)){
        td2 <- as.character(as.numeric(td2)+1)
    }
    (dest <- paste0(td,'\\',td2))
    dir.create(path = dest,recursive = TRUE,showWarnings = FALSE)
    (tf <- paste0(dest,'\\nhanesR.zip'))

    download.file(url = sprintf('https://raw.githubusercontent.com/yikeshu0611/nhanesR/main/nhanesR_%s.zip',version),
                  destfile = tf,
                  headers = c(NULL,Authorization = sprintf("token %s",token)))

    unzip(zipfile = tf,files = 'nhanesR/DESCRIPTION',exdir = dest,overwrite = TRUE)
    desc <- paste0(dest,'\\nhanesR')
    check_package(desc)

    install.packages(pkgs = tf,repos = NULL)

    x <- suppressWarnings(file.remove(list.files(dest,recursive = TRUE)))
    invisible()
}


