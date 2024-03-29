## Copyright 2015 Sebastian Gibb
## <mail@sebastiangibb.de>
##
## This file is part of MALDIquantForeign for R and related languages.
##
## MALDIquantForeign is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## MALDIquantForeign is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with MALDIquantForeign. If not, see <https://www.gnu.org/licenses/>

.writeImzMlDocument <- function(x, file,
                                id=.withoutFileExtension(basename(file)),
                                processed=TRUE, uuid=.uuid(),
                                coordinates=MALDIquant::coordinates(x),
                                pixelSize=c(metaData(x[[1L]])$imaging$pixelSize,
                                            100, 100)[1L:2L], ...) {
  if(isMassSpectrum(x) || isMassPeaks(x)) {
    x <- list(x)
  }

  if (!MALDIquant:::.isMassObjectList(x)) {
    stop("Only MALDIquant::MassSpectrum or MALDIquant::MassPeaks objects ",
         "are supported!")
  }

  if (is.null(metaData(x[[1L]])$imaging$pos) && is.null(coordinates)) {
    stop("The spectra contain no imaging information.")
  }

  isCoordinatesMatrix <- !is.null(coordinates) &&
                         is.matrix(coordinates) &&
                         ncol(coordinates) == 2L &&
                         nrow(coordinates) == length(x)

  if (!isCoordinatesMatrix) {
    stop("The ", sQuote("coordinates"),
         " argument has to be a matrix with two columns (x and y position)!")
  } else {
    size <- apply(coordinates, 2, max)
    dimension <- size * pixelSize

    x[[1L]]@metaData$imaging <- list(size=size,
                                     dim=dimension,
                                     pixelSize=pixelSize)
    MALDIquant::coordinates(x) <- coordinates
  }

  ibdFile <- .changeFileExtension(file, "ibd")
  .writeIbd(x, ibdFile, uuid=uuid, processed=processed)
  sha1 <- digest::digest(ibdFile, algo="sha1", file=TRUE)

  .writeMzMlDocument(x=.addIbdOffsets(x, processed=processed),
                     file=file, id=id,
                     imsArgs=list(uuid=uuid, sha1=sha1, processed=processed),
                     ...)
}
