
## ----setup, include=FALSE, cache=FALSE-----------------------------------
library("knitr")
opts_chunk$set(tidy.opts=list(width.cutoff=45), tidy=FALSE, fig.align="center",
               fig.height=4.25, comment=NA, prompt=TRUE)


## ----env, echo=FALSE-----------------------------------------------------
suppressPackageStartupMessages(library("MALDIquant"))
suppressPackageStartupMessages(library("MALDIquantForeign"))


## ----fileformats---------------------------------------------------------
supportedFileFormats()


## ----mqsetup, eval=FALSE-------------------------------------------------
## install.packages(c("MALDIquant", "MALDIquantForeign"))


## ----mqlibrary, eval=FALSE-----------------------------------------------
## library("MALDIquant")
## library("MALDIquantForeign")


## ----import--------------------------------------------------------------
## get the example directory
exampleDirectory <- system.file("exampledata",
                                package="MALDIquantForeign")

spectra <- import(file.path(exampleDirectory,
                            "brukerflex"),
                  verbose=FALSE)
spectra[[1]]


## ----importbrukerflex----------------------------------------------------
spectra <- importBrukerFlex(file.path(exampleDirectory,
                                      "brukerflex"),
                            verbose=FALSE)
spectra[[1]]


## ----importcsvcompressed-------------------------------------------------
spectra <- importCsv(file.path(exampleDirectory, "compressed",
                               "csv.tar.gz"), verbose=FALSE)
spectra[[1]]

spectra <- importCsv(file.path(exampleDirectory, "compressed",
                               "csv.zip"), verbose=FALSE)
spectra[[1]]


## ----importremote--------------------------------------------------------
githubUrl <- paste0("https://raw.github.com/sgibb/",
                    "MALDIquantForeign/master/",
                    "inst/exampledata/tiny1.mzML1.1.mzML")
spectra <- import(githubUrl, verbose=FALSE)
spectra[[1]]

spectra <- importMzMl(githubUrl, verbose=FALSE)
spectra[[1]]


## ----masspectrum---------------------------------------------------------
spectra <- list(
  createMassSpectrum(mass=1:5, intensity=1:5),
  createMassSpectrum(mass=1:5, intensity=6:10))


## ----export1, eval=FALSE-------------------------------------------------
## export(spectra[[1]], file="spectrum1.csv")


## ----exportpath, eval=TRUE-----------------------------------------------
## force=TRUE creates the path if it does not exist
## (or overwrites it)
export(spectra, type="csv", path="spectra", force=TRUE)
list.files("spectra")


## ----mqvignette, eval=FALSE----------------------------------------------
## vignette(topic="MALDIquant", package="MALDIquant")


## ----sessioninfo, echo=FALSE, results="asis"-----------------------------
toLatex(sessionInfo(), locale=FALSE)


