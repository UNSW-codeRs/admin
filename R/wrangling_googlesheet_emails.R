#install.packages("googlesheets4")
library(googlesheets4)
library(dplyr)
library(janitor)
library(stringr)

gdrive_members <- read_sheet("https://docs.google.com/spreadsheets/d/1X4bjxszAdLV5h439slLAItRMHkc_3pPdenQmxS044Zo/edit#gid=1490825635")

gdrive_members <- gdrive_members |> 
  clean_names()

# Extract UNSW emails
unsw_emails_only <- gdrive_members |> 
  filter(
         str_detect(whats_your_email, "unsw")) |> 
  select(whats_your_email) |> 
  rename(email = whats_your_email) |> 
  write.csv("21-09-23_UNSW_emails_gdrive.csv", row.names = FALSE)

# unsw_emails_only |> pull(whats_your_email) |> paste0(collapse = ", ")
  



         
         
         
  