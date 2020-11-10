# APA_AS_analysis
This script aims to process the alternative polyadenylation (APA) or alternative splicing (AS) sites for downstream study. 
The output file gives the number of APA or AS sites, the average distance of those sites to stop codon for each gene.
The adjacent sites that are closed enough (default distance is 15 bp) will be clustered and regarded as the same adjusted sites,
The distribution or other metric of adjusted sites on each gene could also be extracted from scripts if necessary.

The input file contains following rows 

NAC001	AT1G01010	1	+	5631	5919\n
NAC001	AT1G01010	1	+	5631	5892

Each row represents one alternative polyadenylation or splicing site. The first column is Arabidopsis gene name, the second is TAIR ID, the third 
is chromosome number, the forth is strand, the fifth is the genomic coordination of  stop codon for this gene and the last row is the genomic coordination 
of this alternative polyadenylation or splicing site.

By running script, 

perl APA.sites.processing input.file output.file

the output files are as follow:

NAC001	AT1G01010	+	5631	2	2	275

Row one represents gene name, row two represents TAIR ID, row three is strand and row four is the genomic coordination of  stop codon for this gene. Row six represents average distance 
between APA/AS sites and stop codon, row seven represent the number of adjusted sites (after clustering of adjacent sites) of this gene. The last column represents the average distance of all 
sites to stop codon for each gene.
 

