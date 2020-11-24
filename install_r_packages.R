# installs all my used R packages

ipak <- function(pkg){
  # ipak function: install and load multiple R packages.
  # check to see if packages are installed. Install them if they are not, then load them into the R session.
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg,
                     dependencies = TRUE,
                     repos = "https://mirror.las.iastate.edu/CRAN/")
  sapply(pkg, require, character.only = TRUE)
}

# usage
packages <- c("plyr", #rbind.fill??
              "RColorBrewer", "scales", "grid","latex2exp", #graphing aid packages
              "txtplot", #textplotting in a terminal when you don't have X11
              "data.table","RSQLite", #data management
              "shiny", "leaflet", #shiny related packages
              "caret", "glmnet","rms", #machine learning/statistical learning
              "Rcpp", "RcppEigen", "RcppArmadillo", #Rcpp and variants
              "RSpectra", "Rfast", #fast linear algebra packages and optimized functions
          		"roxygen2",  "devtools", #package development
          		"tidyverse", #hadleys foundations: ggplot2, dplyr, forcats, readr, stringr, tidyr, purrr
          		"imager", #image manipulations
          		"microbenchmark", #timing
          		"future", "future.apply", #future and future extensions
          		"lintr"# linting R code
		)
ipak(packages)


# bioconductor install
# if (!requireNamespace("BiocManager"))
#   install.packages("BiocManager")
# BiocManager::install()
# 
# BiocManager::install(c("GenomicFeatures", "AnnotationDbi", "ChAMP", "GenomicRanges", "rtracklayer", "TxDb.Hsapiens.UCSC.hg38.knownGene"))
# BiocManager::install(c("TxDb.Hsapiens.UCSC.hg19.knownGene"))
# BiocManager::install("IlluminaHumanMethylation450kanno.ilmn12.hg19", version = "3.8")
