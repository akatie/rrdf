# Copyright (C) 2011  Egon Willighagen <egon.willighagen@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details. 
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

sparql.rdf <- function(model, sparql, rowvarname=NULL) {
    stringMat <- .jcall(
        "com/github/egonw/rrdf/RJenaHelper",
        "Lcom/github/egonw/rrdf/StringMatrix;", "sparql", model, sparql
    )
    exception <- .jgetEx(clear = TRUE)
    if (!is.null(exception)) {
        stop(exception)
    }
    return(.stringMatrix.to.matrix(stringMat, rowvarname))
}
