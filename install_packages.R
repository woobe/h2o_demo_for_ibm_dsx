# Install R packages for H2O demo

# ------------------------------------------------------------------------------
# Check and make sure H2O version 3.10.5.1 is installed
# ------------------------------------------------------------------------------

pkg_installed <- as.data.frame(installed.packages(), stringsAsFactors = FALSE)
row_h2o <- which(pkg_installed$Package == "h2o")
if (row_h2o != 0) ver_h2o <- pkg_installed[row_h2o,]$Version
if ((row_h2o == 0) | (ver_h2o != "3.10.5.1")) {

  # Install H2O version 3.10.5.1

  # The following two commands remove any previously installed H2O packages for R.
  if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
  if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }

  # Next, we download packages that H2O depends on.
  pkgs <- c("statmod","RCurl","jsonlite")
  for (pkg in pkgs) {
    if (! (pkg %in% rownames(installed.packages()))) { install.packages(pkg) }
  }

  # Now we download, install and initialize the H2O package for R.
  install.packages("h2o", type="source", repos="http://h2o-release.s3.amazonaws.com/h2o/rel-vajda/1/R")

}

# ------------------------------------------------------------------------------
# Install Other R Packages
# ------------------------------------------------------------------------------

if (!require(data.table)) install.packages("data.table")
if (!require(plotly)) install.packages("plotly")
if (!require(shiny)) install.packages("shiny")
if (!require(shinydashboard)) install.packages("shinydashboard")
if (!require(DT)) install.packages("DT")
if (!require(rmarkdown)) install.packages("rmarkdown")
