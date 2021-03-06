% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Chinook_Format.R
\name{Format_Chinook}
\alias{Format_Chinook}
\title{Format Chinook Salmon JTRAP data needed for MYTSBE models}
\usage{
Format_Chinook(JTRAP_data, PTAG_data, strata = 7, smolt.date = "07-01",
  species, trap.name)
}
\arguments{
\item{JTRAP_data}{JTRAP data query}

\item{PTAG_data}{PTAGIS data query (needs to be specific to the species of interest)}

\item{strata}{length of desired strata in days (e.g. 1 week -> 7 days)}

\item{smolt.date}{"MM-DD" smolt classification date needed for formatting}

\item{species}{character string needed to subset data (should be identical to the species name in the JTRAP_data set)}

\item{trap.name}{character string used for titles and descriptions of reports}
}
\description{
This function reconfigures Chinook Salmon JTRAP data into the appropriate capture-mark-recapture format needed for the Multi-Year Time Stratified Bayesian Estimator (MYTSBE) models.

Chinook "TU" dispositioned fish are marked individuals released upstream (nraw) of the rotary screw trap (RST) on a given date. "RE RC" dispositioned Chinook are recaptured individuals (m) at the RST on a given date.
The sum of "TU", "TD", "NTT", "NTD", "NTR" & "NTS" dispositioned fish are captured unmarked individuals (u) at the RST on a given date.

Fry and NTS disposition individuals captured between the earliest trapping date to the specified smolt cut-off are broken into "YOYnraw", "YOYm", and "YOYu". Precocial Chinook, designated with precocial disposition, are excluded from the formatting. Yearling fish migrating after the specified smolt date are excluded from the formatting.

Years are standardized in that each year begins at the earliest trapping date and ends at the latest trapping date the RST was ever in operation since RST installation.

 PTAGIS data are needed to calculate the likelihood an individual is available for recapture during a proceeding day.
 Movement parameters of individauls are calculated using a MLE approach beginning with Day 1 (day after release) through Day 5, for the entirety of the data set. After day 5, it is assumed that migrating fish have traveled passed the RST
or left the population. "n" is the estimated number of fish available for recapture on a given date rounded to the nearest integer.

This package exports a .csv file to the working directory titled "Trap name, species, today's date, formatted data.csv"
}

