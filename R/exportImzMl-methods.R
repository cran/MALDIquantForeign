## Copyright 2013 Sebastian Gibb
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

setMethod(f=".exportImzMl",
  signature=signature(x="MassPeaks"),
  definition=function(x, file, id=.withoutFileExtension(basename(file)),
                      processed=TRUE, ...) {
  .writeImzMlDocument(x=x, file=file, id=id, processed=processed, ...)
})

setMethod(f=".exportImzMl",
  signature=signature(x="MassSpectrum"),
  definition=function(x, file, id=.withoutFileExtension(basename(file)),
                      processed=TRUE, ...) {
  .writeImzMlDocument(x=x, file=file, id=id, processed=processed, ...)
})

setMethod(f=".exportImzMl",
  signature=signature(x="list"),
  definition=function(x, file, id=.withoutFileExtension(basename(file)),
                      processed=TRUE, ...) {
  .writeImzMlDocument(x=x, file=file, id=id, processed=processed, ...)
})
