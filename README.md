# ENGL C1001 Final Research Paper: Statistical Anti-Doping Model

## Overview
This repo contains the supplementary computational model referenced in Section 3 of my final research essay. 

Professor, if you're reading this, I hope you know I tried, but this model doesn't really do much. I don't have the skills or the knowledge needed to make a completely airtight model. Smarter people and entire research teams have tried, and were only partially successful. Anti-doping agencies spend millions every year on doping detection, and pay just as much to keep their models' priors hidden to prevent athletes from "gaming" the system.
The model does something, but what it produces is an amalgamation of other people's work that may not even work together properly.

## Additional Details
In order for this script to work, you need your own database of information; it has the results of the four athletes found in my paper, but it contains no other information currently.
If you want, you can try to attach the spreadsheet I created, but I will suggest downloading it as a .csv file first, as I don't think the script can handle the sheet in the form as it is now.

**For Mac / Linux:**
Download this repo, open the terminal, navigate to the folder containing the file, and run:
```bash
perl doping_probability_model.pl
```

**For Windows:**
Download this repo, then install your Perl interpreter of choice (if you don't have one) and run
```cmd
perl doping_probability_model.pl
```
