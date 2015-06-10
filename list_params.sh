########################################################################################
#!/bin/bash
# Version 1.00
# By Raz Goren
# Script for Setting Initial Parameters
########################################################################################

#STRINGS_2_SEARCH=(447731291379 10.29.191.214 2013_12_29) 
STRINGS_2_SEARCH=(2013-12-30T19:19:30Z MIA-ACCESS69) 
FOLDERS_2_SEARCH=(/var/log /OSS/oss/NexOSS_5.8.0/ARCHIVE /OSS/oss/NexOSS_5.8.0/LOG)
# To the Date search enter number of how many days before to search
DATES_2_SEARCH=(8 12)
LOG_NAME=searchresults.txt
