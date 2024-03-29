## Copyright 2012-2015 Sebastian Gibb
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

.importMzXml <- function(file, centroided=FALSE, massRange=c(0, Inf),
                         minIntensity=0, verbose=FALSE, ...) {

  l <- readMzXmlData:::.readMzXmlFile(mzXmlFile=file,
                                      verbose=verbose, ...)
  lapply(l, function(x).createMassObject(mass=x$spectrum$mass,
                                         intensity=x$spectrum$intensity,
                                         snr=x$spectrum$snr,
                                         metaData=x$metaData,
                                         centroided=centroided,
                                         massRange=massRange,
                                         minIntensity=minIntensity,
                                         verbose=verbose))
}
