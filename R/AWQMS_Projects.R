#' AWQMS_Projects
#'
#' This function will create a vector or projects from AWQMS Project1, project2, and project3 columns.
#'
#' @export
#' @return Dataframe of projects in AWQMS
#' @examples
#' AWQMS_Projects()
#'
#'
AWQMS_Projects <- function() {


   # Get environment variables
  readRenviron("~/.Renviron")
  AWQMS_server <- Sys.getenv('AWQMS_SERVER')

#Connect to database
con <- DBI::dbConnect(odbc::odbc(), "AWQMS")

project1 <- DBI::dbGetQuery(con, paste0("SELECT DISTINCT       Project1 AS 'Project'
                               FROM ",AWQMS_server,"[VW_AWQMS_Results]"))

project2 <- DBI::dbGetQuery(con, paste0("SELECT DISTINCT       Project2 AS 'Project'
                               FROM ",AWQMS_server,"[VW_AWQMS_Results]"))

#project3 <- dbGetQuery(con, "SELECT DISTINCT       Project3 AS 'Project'
#                             FROM            [deqlead-lims\\awqms].[awqms].[dbo].[VW_AWQMS_Results]")


DBI::dbDisconnect(con)


projects <- rbind(project1, project2)

projects <- unique(projects)



return(projects)

}
