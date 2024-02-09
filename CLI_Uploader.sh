#!/bin/bash
#validate arguments
if [[ $# -ne 2 ]]; then
	echo "Usage: $0 <file_path> <bucket_name>"
	exit 1
fi
#Arguments
file_path="$1"
bucket_name="$2"
#check if file exists
if [[ ! -f "$file_path" ]]; then
	echo "Error: File '$file_path' doesn't exist."
	exit 1
fi
# Use temporary credentials 
#code here


#Upload the file

aws s3 cp "$file_path" "s3://$bucket_name" 2>/dev/null | pv -i 1 > /dev/null

upload_status=$?

#check for Errors

if [[ $upload_status -eq 0 ]]; then
	echo "File '$file_path' uploaded successfuly to '$bucket_name'"
else
	echo "Error uploading file. check AWS logs for details"
fi
	
