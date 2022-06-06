
# Quarterly Report Looper
# 12/17/2019

rm(list= ls())

library(tidyverse)
library(RODBC)
library(knitr)
library(markdown)
library(rmarkdown)

dbhandle <- odbcDriverConnect('driver={SQL Server};server=fakeserver;database=fakedatabase;trusted_connection=true')

departments <- sqlQuery(dbhandle, 
"SELECT DISTINCT DepartmentName, DeptAbbrev
FROM Department_XRef_Table
AND DepartmentName != 'Bad Department'
ORDER BY DeptAbbrev")

x = 0

for (AboutDept in departments$DepartmentName) {
  dept <- DepartmentName
  x = x + 1
  render("C:/Users/username/OneDrive - my location/HomeDrive/R Scripts/SurveyName/QuarterlyReport_LOOPEE_v2.Rmd",
         output_file = paste("QTR_", paste(departments$DeptAbbrev[x]), '_', Sys.Date(), ".html", sep = ""),
         output_dir = "C:/Users/username/OneDrive - my location/HomeDrive/SurveyName/SurveyDataReports")
}