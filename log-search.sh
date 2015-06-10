########################################################################################
#!/bin/bash
# Version 1.01
# By Raz Goren
# Script for searching strings in multiple text files and zipped files
########################################################################################
# Notes :
########################################################################################
# ToDo :
########################################################################################

#####################
# set params        #
#####################

# Will be used to insert parameters
function read_params() {	
	. list_params.sh
}

UNDER_LINE="===================================================================================="
#STRING_GREP="xargs zegrep -i "\$\{STRINGS_2_SEARCH[\$j\]}

#####################
# Functions         #
#####################

# Getting Folder to search from configuration
function search_folder () {
	echo Searching Folders : ${FOLDERS_2_SEARCH[*]} | tee -a $LOG_NAME
	echo Searching Strings : ${STRINGS_2_SEARCH[*]} | tee -a $LOG_NAME
	echo $UNDER_LINE | tee -a $LOG_NAME
}

function search_string () {
	#good but changed to zegrep# find ${FOLDERS_2_SEARCH[2]} -type f -name "*.*" | xargs egrep -i --exclude="*\.gz*" ${STRINGS_2_SEARCH[2]}
	find ${FOLDERS_2_SEARCH[$i]} -type f -name "*.*" | xargs zegrep -i ${STRINGS_2_SEARCH[0]} | xargs zegrep -i ${STRINGS_2_SEARCH[1]}
}

function search_multi_string () {
	# get length of an array
	ASTLEN=${#STRINGS_2_SEARCH[@]}
	echo "ASTLEN is" $ASTLEN | tee -a $LOG_NAME	
	# use for loop to read all Folders To Search
	echo "Variable is :" $STRING_GREP | tee -a $LOG_NAME
	for (( j=0; j<${ASTLEN}; j++ ));
		do
			echo "Current Value of Array Variable is :" ${STRINGS_2_SEARCH[$j]} | tee -a $LOG_NAME

			PATTERN=$(IFS='|'; echo "${STRINGS_2_SEARCH[*]}")
			find ${FOLDERS_2_SEARCH[$i]} -ctime +${DATES_2_SEARCH[0]} -ctime -${DATES_2_SEARCH[1]} -type f -name "*.*" | xargs zegrep -i "$PATTERN"
			# Search with no dates
			#find ${FOLDERS_2_SEARCH[$i]} -type f -name "*.*" | xargs zegrep -i "$PATTERN"
		
		done
}

function search_all () {
	# get length of an array
	ALEN=${#FOLDERS_2_SEARCH[@]}
	echo "ALEN is" $ALEN | tee -a $LOG_NAME
	# use for loop to read all Folders To Search
	for (( i=0; i<${ALEN}; i++ ));
		do
			echo "Searching" ${FOLDERS_2_SEARCH[$i]}
			echo $UNDER_LINE | tee -a $LOG_NAME
			#search_string | tee $LOG_NAME
			search_multi_string | tee -a $LOG_NAME
		done
}  

#####################
# Main              #
#####################
read_params
search_folder
search_all
