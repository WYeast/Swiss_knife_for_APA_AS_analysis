# Swiss_knife_for_APA_AS_analysis
This script aims to process the alternative polyadenylation (APA) or alternative splicing (AS) sites for downstream study. 
The output file gives the number of APA or AS sites, the average distance of those sites to stop codon for each gene.
The adjacent sites that are closed enough (default distance is 15 bp) will be clustered and regarded as the same adjusted sites,
The distribution or other metric of adjusted sites on each gene could also be extracted from scripts if necessary.

The input file contains following rows 

NAC001	AT1G01010	1	+	5631	5919
NAC001	AT1G01010	1	+	5631	5892
ARV1	AT1G01020	1	-	6914	6864
NGA3	AT1G01030	1	-	11863	11617
NGA3	AT1G01030	1	-	11863	12956
DCL1	AT1G01040	1	+	31080	31168
DCL1	AT1G01040	1	+	31080	31196
PPA1	AT1G01050	1	-	31381	31189
PPA1	AT1G01050	1	-	31381	31193
PPA1	AT1G01050	1	-	31381	31194
LHY	AT1G01060	1	-	33991;33589	33375
LHY	AT1G01060	1	-	33991	33654
LHY	AT1G01060	1	-	33991	33668
LHY	AT1G01060	1	-	33991	33731
LHY	AT1G01060	1	-	33991	33732
LHY	AT1G01060	1	-	33991	33733
LHY	AT1G01060	1	-	33991	33734
LHY	AT1G01060	1	-	33991	33735
LHY	AT1G01060	1	-	33991	33736
LHY	AT1G01060	1	-	33991	33737
LHY	AT1G01060	1	-	33991	33738
LHY	AT1G01060	1	-	33991	33740
LHY	AT1G01060	1	-	33991	33743
LHY	AT1G01060	1	+	33662	37671
LHY	AT1G01060	1	-	33991	33743
LHY	AT1G01060	1	-	33991	33744
LHY	AT1G01060	1	-	33991	33745
LHY	AT1G01060	1	-	33991	33746
LHY	AT1G01060	1	-	33991	33748
LHY	AT1G01060	1	-	33991	33749
LHY	AT1G01060	1	-	33991	33750
LHY	AT1G01060	1	-	33991	33751
LHY	AT1G01060	1	-	33991	33752
LHY	AT1G01060	1	-	33991	33758
LHY	AT1G01060	1	-	33991	33765
LHY	AT1G01060	1	-	33991	33766
LHY	AT1G01060	1	-	33991	33768
LHY	AT1G01060	1	-	33991	33770
LHY	AT1G01060	1	-	33991	33773
LHY	AT1G01060	1	-	33991	33808
LHY	AT1G01060	1	-	33991	33840
LHY	AT1G01060	1	-	33991	33849
LHY	AT1G01060	1	-	33991	33862
LHY	AT1G01060	1	-	33991	33907
LHY	AT1G01060	1	-	33991	33979
AT1G01070	AT1G01070	1	-	38897	38774
AT1G01070	AT1G01070	1	-	38897	38801
AT1G01080	AT1G01080	1	-	45502	45346
AT1G01080	AT1G01080	1	-	45502	45348
AT1G01080	AT1G01080	1	-	45609	45369
AT1G01080	AT1G01080	1	-	45502	45381
PDH-E1 ALPHA	AT1G01090	1	+	47234	49245
PDH-E1 ALPHA	AT1G01090	1	-	47704	47487
PDH-E1 ALPHA	AT1G01090	1	-	47704	47487
PDH-E1 ALPHA	AT1G01090	1	-	47704	47494
PDH-E1 ALPHA	AT1G01090	1	-	47704	47497
PDH-E1 ALPHA	AT1G01090	1	+	47234	49231
PDH-E1 ALPHA	AT1G01090	1	+	47234	49265
PDH-E1 ALPHA	AT1G01090	1	-	47704	47602
PDH-E1 ALPHA	AT1G01090	1	+	47234	49082
PDH-E1 ALPHA	AT1G01090	1	-	47704	47615

Each row represents one alternative polyadenylation or splicing site. The first column is Arabidopsis gene name, the second is TAIR ID, the third 
is chromosome number, the forth is strand, the fifth is the genomic coordination of  stop codon for this gene and the last row is the genomic coordination 
of this alternative polyadenylation or splicing site.

By running script, 

perl APA.sites.processing input.file output.file

the output files are as follow:

PDH-E1 ALPHA	AT1G01090	-	47704	5	4	-165
LHY	AT1G01060	-	33991	32	12	-225
PDH-E1 ALPHA	AT1G01090	+	47234	4	4	1972
LHY	AT1G01060	-	33991;33589	1	1	-616
DCL1	AT1G01040	+	31080	2	2	102
NGA3	AT1G01030	-	11863	2	2	424
AT1G01070	AT1G01070	-	38897	2	2	-110
AT1G01080	AT1G01080	-	45502	3	2	-144
PPA1	AT1G01050	-	31381	3	1	-189
NAC001	AT1G01010	+	5631	2	2	275
LHY	AT1G01060	+	33662	1	1	4009
AT1G01080	AT1G01080	-	45609	1	1	-240
ARV1	AT1G01020	-	6914	1	1	-50

Row one represents gene name, row two represents TAIR ID, row three is strand and row four is the genomic coordination of  stop codon for this gene. Row six represents average distance 
between APA/AS sites and stop codon, row seven represent the number of adjusted sites (after clustering of adjacent sites) of this gene. The last column represents the average distance of all 
sites to stop codon for each gene.
 

