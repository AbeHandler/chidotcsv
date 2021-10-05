# chidotcsv

This repo holds code and data to make a big csv file of all CHI paper titles going back to 1981. The main script to create the dataset is `main.sh`. 

## Data collection

There are two primary data collection methods:

1. For old conferences (up to late 90s), it is possible to manually export the CHI proceedings as a bib file from the [ACM LIbrary](https://dl.acm.org/proceedings). I did that by hand and save the bib files to the `bib` directory.
2. For more recent conferences, the bib files get to big for the ACM website to export (ha!) so you have to scrape and parse html proceedings from the conference websites. There are a few different formats for the websites, which change every few years. And a couple of standalone conference years require ad-hoc scraping scripts. See `collect_data.sh` to see the scripting details.

## Data processing

Once data is collected by hand and by scripts, it needs to be processed to create the csv. The processing scripts are in `process_data.sh`. The data is processed into a column store format: each paper title is shown as one line in the file `titles.txt` and its year is shown as a corresponding line in `years.txt`. I use the paste command to join the two columns to make the csv.

## Data validation

ACM posts acceptance rates by year in the CHI proceedings section of the ACM library. I copied/pasted this information by hand into `acm_acceptance.txt` and wrote a script to check the count of papers by year collected in this repo vs. the ACM count. For now, the main validation that I am oding is checking to see that the count in this repo is either higher or very slightly than the ACM count. Help with validation would be great! The validation script is in `validate_data.sh`.

The other validation I do is make sure I get the same number of years and titles. Parsing should return the same number of each.

## Other notes 

See this similar effort focused on [viz](https://sites.google.com/site/vispubdata/home) papers
