#!/bin/bash

# Set options for error handling
set -euo pipefail

# Run from the directory this file is saved
cd "$(dirname "${BASH_SOURCE[0]}")"

# Set up variables
STUDY_ID=SRP255885
RUN_ID=SRR11518889
FASTQ_R1="${RUN_ID}_1.fastq.gz"
FASTQ_R2="${RUN_ID}_2.fastq.gz"
FASTQ_URL="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/089/${RUN_ID}"
FASTQ_DEST="../data/raw/fastq/${STUDY_ID}"


# Create directory to hold FASTQ files from this project
# -p tells it to make the parent directory if the parent doesn't exist yet
mkdir -p $FASTQ_DEST


# Download the R1 file
curl -O ${FASTQ_URL}/${FASTQ_R1}

# Move file to destination directory
mv $FASTQ_R1 $FASTQ_DEST

# Count the lines in the R1 file
echo "The number of lines in $FASTQ_R1 is:"
gunzip -c ${FASTQ_DEST}/${FASTQ_R1} | wc -l

# Download the R2 file
curl -O ${FASTQ_URL}/${FASTQ_R2}

# Move file to destination directory
mv $FASTQ_R2 $FASTQ_DEST

# Count the lines in the R2 file
echo "The number of lines in $FASTQ_R2 is:"
gunzip -c ${FASTQ_DEST}/${FASTQ_R2} | wc -l
