#Use this command if you want to append a word (e.g., "_138R") or set of characters at the end of a line containing a specific word (e.g., "scaffold") or set of characters

sed '/scaffold/ s/$/_138R/' viruses.fasta > 138R_viruses.fasta

#Use this command if you want to print certain columns of a text file and re-write them to another file. You can decide whether to print two columns directly after one another, and you can even insert a particular character to separate two columns i.e., a tab or a "_"

awk '{print $1"_"$2"\t" $3,"\t",$4"\t",$5"\t",$6;}' *.crisprs > master_assembled.crisprs

#This command will allow you to see if there are duplicate lines within a file and will specify the line numbers where the duplicates exist

$ grep -nFx "$(sort sentences.txt | uniq -d)" sentences.txt

#This command allows you to delete that one dreaded column from your favourite text file

awk '!($3="")' file.txt

#This command allows you to get a count of how many nucleotides are in a fasta file

grep -v ">" all_2.5K_scaffolds.fasta | wc | awk '{print$3-$1}'

#This command allows you to add line numbers at the end of each line

awk '{print $0, FNR}' file.txt 

#This command allows you to sort a text file based on certain columns of interest

sort -k 2 file.txt

#This command allows you to find and replace any character within a text file (you will have to escape special characters (i.e., those that have specific functions in sed) in both the find and replace blocks using "\"). "-i" modifies the file in place otherwise you need to write changes to a new file

sed -i 's/old/new/g' file.txt 
sed 's/%//g' file.txt > file2.txt 

#This command allows you to take a range of lines from one input file and output it to another file

sed -n '52254,53319 p' < file1.txt > file2.txt

#This command allows you to convert all hidden files in a directory to visible files

rename 's/\.//;' .*

#This command allows you to append a character or set of characters at the end of every line in a text file

sed 's/$/.contigs.fa/' file.txt > file2.txt

#This command allows you to move files within the current working directory to another directory you've created e.g., "good_quality_bins", only if the file names are in the list you've provided e.g., "good_quality_bins_filenames"

xargs mv -t good_quality_bins < good_quality_bin_filenames

#This command allows you to remove a period at the end of every line in a text file

sed -r 's/\.$//' file.txt

#This command allows you to remove all files of size 0

find . -size 0 -delete

#This command allows you to find and replace in vim (the text editor) only if the worlds match exactly and it will ask for permission

:%s/\<foo\>/bar/gc

#This command allows you to convert a csv into a tsv 

< filename.csv tr "," "\t" > outfile.tsv 

#This command allows you find files or directories of interest (type examples are "f" for file and "d" for directory) 

find . -type f -name "abc*" 

find . -type d -name "Spacer*"

find . -type f -name “Spacer_[0-1]”

#The command below allows you to remove all whitespace from a text file of interest (you don't need the cat part, but I recommend running it first and then running the full command so you can see the changes)

cat file.txt | tr -d "[:space:]"

#This command allows you to keep only columns of interest

cut -f 4,5,6 file.txt > new_file.txt

#This command allows you to perform a column-wise cat of two text files and separate the columns with your delimiter of choice

paste file1 file2 | column -s $'\t' -t > file3 

#This command allows you to delete files that match a regex pattern

find ./ -name "Spacer*fasta" -delete

#This command allows you to delete words in a file of interest

sed -i -e 's/spacer//g' file.txt

#This command allows you to delete (regex) patterns in a file of interest using regexes

sed -i -E -e 's/spacer[0-9]+//g' file.txt

#This command allows you to rename file extensions for multiple files in a directory or create new file extensions

for f in *.genbank; do     mv -- "$f" "$(basename -- "$f" .genbank).gff"; done

#sum a column in a file 

awk '{print $2}' file.txt | awk '{ total += $1 } END { print total }'

#this command allows you to calculate the average of a column in a file ('NR' is the number of records/lines in this case)

awk '{print $2}' file.txt | awk '{ total += $1 } END { print total/NR }' 

#pattern replacement in vim 

:%s/seventeen/sixteen/g 

#add a prefix (e.g., "SOX") to all file names (if the files are matched with the wildcard pattern "*.fna")

for f in *.fna; do mv "$f" "SOX_$f"; done

#quickly slicing a single fasta file (this would give you the nucleotide positions "14000-15000", better to do this with (bio)python) 

grep -v ">" virus_with_array.fna | tr -d '\n' | cut -c 14000-15000

#how to print the length of every sequence in a fasta file 

awk '/^>/{if (l!="") print l; print; l=0; next}{l+=length($0)}END{print l}' file.fasta

#delete empty lines 

sed '/^$/d' file.txt

#delete last character in every line in a file

sed 's/.$//' file.txt


